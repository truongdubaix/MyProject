// constants.js
const SYSTEM_ID = 0; // ID của hệ thống/bot
const WELCOME_CONTENT =
  "Xin chào 👋! Chúng tôi là đội ngũ hỗ trợ SpeedyShip. Bạn cần giúp gì hôm nay?";

// Biến lưu trữ tạm thời (RAM)
let onlineDrivers = {};
let activeChats = {}; // Map: customerId -> chatId

export default function initSocket(io, pool) {
  io.on("connection", (socket) => {
    // console.log(`⚡ Kết nối mới: ${socket.id}`);

    // ============================================
    // 🛡️ 1. DISPATCHER: ĐĂNG KÝ (QUAN TRỌNG)
    // ============================================
    // Phải có đoạn này Dispatcher mới nhận được thông báo từ các phòng khác
    socket.on("joinDispatcher", () => {
      socket.join("dispatcherRoom");
      console.log(`🛡️ Dispatcher ${socket.id} đã vào phòng điều phối`);
    });

    // ============================================
    // 🚚 2. TÀI XẾ: ĐĂNG KÝ
    // ============================================
    socket.on("registerDriver", (driverId) => {
      onlineDrivers[driverId] = socket.id;
      console.log(`🛵 Tài xế ${driverId} đã online`);
    });

    // ============================================
    // 🟢 3. KHÁCH HÀNG: BẮT ĐẦU CHAT
    // ============================================
    socket.on("startChat", async (customerId) => {
      try {
        // 1. Tìm hoặc tạo Chat Session
        let chatId;
        const [existingChats] = await pool.query(
          "SELECT id FROM chats WHERE customer_id = ? AND status = 'active' LIMIT 1",
          [customerId]
        );

        if (existingChats.length > 0) {
          chatId = existingChats[0].id;
        } else {
          const [result] = await pool.query(
            "INSERT INTO chats (customer_id, status) VALUES (?, 'active')",
            [customerId]
          );
          chatId = result.insertId;
        }

        // 2. Lưu cache & Join phòng
        activeChats[customerId] = chatId;
        const room = `chat_${chatId}`;
        socket.join(room);

        // 3. Phản hồi ngay lập tức để Client mở khóa UI
        io.to(socket.id).emit("chatStarted", chatId);

        // 4. Thông báo cho Dispatcher
        io.to("dispatcherRoom").emit("newChat", { chatId, customerId });

        // 5. XỬ LÝ TIN NHẮN CHÀO MỪNG (LOGIC AN TOÀN)
        setTimeout(async () => {
          // Kiểm tra lại DB bên trong timeout để chắc chắn chưa có tin nhắn nào
          const [msgCheck] = await pool.query(
            "SELECT id FROM messages WHERE chat_id = ? LIMIT 1",
            [chatId]
          );

          if (msgCheck.length === 0) {
            const time = new Date();
            // Insert tin nhắn chào
            await pool.query(
              "INSERT INTO messages (chat_id, sender_id, role, content, created_at) VALUES (?, ?, ?, ?, ?)",
              [chatId, SYSTEM_ID, "dispatcher", WELCOME_CONTENT, time]
            );

            const welcomeMsg = {
              chatId,
              senderId: SYSTEM_ID,
              role: "dispatcher",
              content: WELCOME_CONTENT,
              created_at: time,
            };

            // Gửi cho khách
            io.to(room).emit("newMessage", welcomeMsg);
            // Gửi cho Dispatcher (để hiện preview tin nhắn cuối)
            io.to("dispatcherRoom").emit("welcomeMessage", welcomeMsg);
          }
        }, 500);
      } catch (err) {
        console.error(
          `❌ Lỗi startChat [Customer ${customerId}]:`,
          err.message
        );
        socket.emit("error", "Không thể khởi tạo cuộc trò chuyện");
      }
    });

    // ============================================
    // 🟣 4. DISPATCHER: THAM GIA CHAT
    // ============================================
    socket.on("joinChat", async (chatId) => {
      const room = `chat_${chatId}`;
      socket.join(room);
      console.log(`👀 Dispatcher đang xem chat #${chatId}`);
    });

    // ============================================
    // ✉️ 5. GỬI TIN NHẮN
    // ============================================
    socket.on("sendMessage", async (msg) => {
      const { chatId, senderId, role, content } = msg;

      // Validate cơ bản
      if (!content || !content.trim()) return;

      const time = new Date();
      const room = `chat_${chatId}`;

      try {
        await pool.query(
          "INSERT INTO messages (chat_id, sender_id, role, content, created_at) VALUES (?, ?, ?, ?, ?)",
          [chatId, senderId, role, content, time]
        );

        const messageData = {
          chatId,
          senderId,
          role,
          content,
          created_at: time,
        };

        // Gửi cho người trong phòng (Bao gồm cả người gửi)
        io.to(room).emit("newMessage", messageData);

        // 🔥 QUAN TRỌNG: Nếu khách gửi, báo riêng cho Dispatcher Room
        if (role === "customer") {
          io.to("dispatcherRoom").emit("customerMessage", messageData);
        }
      } catch (err) {
        console.error("❌ Lỗi sendMessage:", err.message);
      }
    });

    // ============================================
    // 🔴 6. KẾT THÚC CHAT
    // ============================================
    socket.on("endChat", async (userId) => {
      try {
        // Cập nhật DB trước
        await pool.query(
          "UPDATE chats SET status='closed', ended_at=NOW() WHERE customer_id=? AND status='active'",
          [userId]
        );

        // Lấy chatId từ Cache HOẶC DB (Fallback)
        let chatId = activeChats[userId];

        // Nếu Server bị restart, activeChats sẽ rỗng, cần query lại DB để lấy ID chat vừa đóng
        if (!chatId) {
          const [lastClosed] = await pool.query(
            "SELECT id FROM chats WHERE customer_id=? AND status='closed' ORDER BY ended_at DESC LIMIT 1",
            [userId]
          );
          if (lastClosed.length > 0) chatId = lastClosed[0].id;
        }

        if (chatId) {
          const room = `chat_${chatId}`;
          // Báo cho 2 bên
          io.to(room).emit("chatEnded", { chatId });
          io.to("dispatcherRoom").emit("chatEnded", { chatId, userId });

          // Clean up memory
          delete activeChats[userId];

          // Cho tất cả rời phòng
          io.in(room).socketsLeave(room);
        }
      } catch (err) {
        console.error("❌ Lỗi endChat:", err.message);
      }
    });

    // ⚪ Khi socket ngắt kết nối
    socket.on("disconnect", () => {
      for (let id in onlineDrivers) {
        if (onlineDrivers[id] === socket.id) delete onlineDrivers[id];
      }
    });
  });

  // ======================================================
  // 🔔 Helper Functions (API gọi vào đây)
  // ======================================================
  return {
    sendNotificationToDriver: async (driverId, shipmentId, message) => {
      try {
        await pool.query(
          "INSERT INTO notifications (receiver_id, target_role, shipment_id, message) VALUES (?, 'driver', ?, ?)",
          [driverId, shipmentId, message]
        );
        const socketId = onlineDrivers[driverId];
        if (socketId)
          io.to(socketId).emit("newNotification", { shipmentId, message });
      } catch (err) {
        console.error("❌ Lỗi gửi thông báo driver:", err.message);
      }
    },

    sendNotificationToDispatcher: async (dispatcherId, shipmentId, message) => {
      try {
        await pool.query(
          "INSERT INTO notifications (receiver_id, target_role, shipment_id, message) VALUES (?, 'dispatcher', ?, ?)",
          [dispatcherId, shipmentId, message]
        );
        // Gửi vào room chung
        io.to("dispatcherRoom").emit("newDispatcherNotification", {
          shipmentId,
          message,
          created_at: new Date(),
        });
      } catch (err) {
        console.error("❌ Lỗi gửi thông báo dispatcher:", err.message);
      }
    },
  };
}
