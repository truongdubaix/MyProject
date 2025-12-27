import db from "../config/db.js";
import {
  sendNotificationToDriver,
  sendNotificationToDispatcher,
} from "../server.js";

// ==========================
// Lấy tất cả đơn hàng
// ==========================
export const getAllShipments = async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT * FROM shipments ORDER BY created_at DESC"
    );
    res.json(rows);
  } catch (err) {
    console.error("❌ Lỗi khi lấy danh sách đơn hàng:", err);
    res.status(500).json({ error: "Không thể lấy danh sách đơn hàng" });
  }
};

// ==========================
// Lấy đơn theo ID
// ==========================
export const getShipmentById = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query("SELECT * FROM shipments WHERE id = ?", [id]);
    if (!rows.length)
      return res.status(404).json({ error: "Không tìm thấy đơn hàng" });
    res.json(rows[0]);
  } catch (err) {
    console.error("❌ Lỗi khi lấy chi tiết đơn hàng:", err);
    res.status(500).json({ error: "Không thể lấy chi tiết đơn hàng" });
  }
};

// ==========================
// Tạo đơn hàng
// ==========================
export const createShipment = async (req, res) => {
  try {
    const {
      sender_name,
      sender_phone,
      receiver_name,
      receiver_phone,
      pickup_address,
      pickup_lat, // Nhận tọa độ
      pickup_lng,
      delivery_address,
      delivery_lat, // Nhận tọa độ
      delivery_lng,
      item_name,
      quantity,
      weight_kg,
      cod_amount,
      shipping_fee,
      payment_method,
      pickup_option, // Nhận tùy chọn lấy hàng
      service_type, // Nhận loại dịch vụ
      status,
      customer_id,
    } = req.body;

    // Tạo mã vận đơn ngẫu nhiên (VD: SP123456)
    const tracking_code = "SP" + Date.now().toString().slice(-6);

    // Câu lệnh SQL (Cần khớp với tên cột trong Database)
    const q = `
      INSERT INTO shipments 
      (customer_id, tracking_code, sender_name, sender_phone, pickup_address, pickup_lat, pickup_lng, 
       receiver_name, receiver_phone, delivery_address, delivery_lat, delivery_lng, 
       item_name, quantity, weight_kg, cod_amount, shipping_fee, 
       payment_method, pickup_option, service_type, status, created_at) 
      VALUES (?)
    `;

    const values = [
      customer_id,
      tracking_code,
      sender_name,
      sender_phone,
      pickup_address,
      pickup_lat || null, // Nếu không có thì lưu NULL
      pickup_lng || null,
      receiver_name,
      receiver_phone,
      delivery_address,
      delivery_lat || null,
      delivery_lng || null,
      item_name,
      quantity,
      weight_kg, // Lưu ý: Database có thể đặt tên cột là 'weight' hoặc 'weight_kg'. Kiểm tra kỹ trong DB.
      cod_amount,
      shipping_fee,
      payment_method,
      pickup_option,
      service_type,
      status || "pending",
      new Date(),
    ];

    const [result] = await db.query(q, [values]);

    // Gửi thông báo cho điều phối viên (nếu cần)
    await sendNotificationToDispatcher(
      1,
      result.insertId,
      `🆕 Đơn hàng #${result.insertId} vừa được tạo`
    );

    // ✅ QUAN TRỌNG: Trả về ID của đơn hàng vừa tạo và tracking_code (đúng tên biến)
    res.status(201).json({
      message: "Tạo đơn hàng thành công",
      id: result.insertId,
      tracking_code: tracking_code, // Sử dụng đúng tên biến đã khai báo
    });
  } catch (err) {
    console.error("❌ Lỗi tạo đơn hàng:", err); // Xem lỗi chi tiết ở Terminal backend
    res
      .status(500)
      .json({ error: "Lỗi server khi tạo đơn hàng", details: err.message });
  }
};

// ==========================
// Cập nhật đơn hàng
// ==========================
export const updateShipment = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      sender_name,
      sender_phone,
      receiver_name,
      receiver_phone,
      pickup_address,
      delivery_address,
      weight_kg,
      cod_amount,
      status,
      current_location,
    } = req.body;

    await db.query(
      `UPDATE shipments SET
        sender_name=?, sender_phone=?, receiver_name=?, receiver_phone=?,
        pickup_address=?, delivery_address=?, weight_kg=?, cod_amount=?,
        status=?, current_location=?, updated_at=NOW()
       WHERE id=?`,
      [
        sender_name,
        sender_phone,
        receiver_name,
        receiver_phone,
        pickup_address,
        delivery_address,
        weight_kg,
        cod_amount,
        status,
        current_location,
        id,
      ]
    );

    res.json({ message: "Cập nhật thành công" });
  } catch (err) {
    console.error("❌ Lỗi cập nhật đơn:", err);
    res.status(500).json({ error: "Không thể cập nhật đơn hàng" });
  }
};

// ==========================
// Xóa đơn hàng
// ==========================
export const deleteShipment = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("DELETE FROM shipments WHERE id=?", [id]);
    res.json({ message: "Đã xóa đơn hàng" });
  } catch (err) {
    console.error("❌ Lỗi xóa đơn:", err);
    res.status(500).json({ error: "Không thể xóa đơn hàng" });
  }
};

// ==========================
// Phân công tài xế
// ==========================
export const assignShipment = async (req, res) => {
  try {
    const { driver_id, shipment_id } = req.body;

    await db.query(
      "UPDATE shipments SET status='assigned', updated_at=NOW() WHERE id=?",
      [shipment_id]
    );

    await db.query(
      "INSERT INTO assignments (shipment_id, driver_id, status) VALUES (?, ?, 'assigned')",
      [shipment_id, driver_id]
    );

    await sendNotificationToDriver(
      driver_id,
      shipment_id,
      `Bạn được phân công đơn #${shipment_id}`
    );

    res.json({ message: "Đã phân công tài xế" });
  } catch (err) {
    console.error("❌ Lỗi phân công:", err);
    res.status(500).json({ error: "Không thể phân công" });
  }
};

// ==========================
// CUSTOMER tracking (login)
// ==========================
export const getShipmentByCode = async (req, res) => {
  try {
    const { code } = req.params;
    const [[shipment]] = await db.query(
      "SELECT * FROM shipments WHERE tracking_code=?",
      [code]
    );

    if (!shipment)
      return res.status(404).json({ message: "Không tìm thấy đơn hàng" });

    res.json(shipment);
  } catch (err) {
    res.status(500).json({ message: "Lỗi server" });
  }
};

// ==========================
// ✅ GUEST tracking (PUBLIC)
// ==========================
export const getShipmentByCodePublic = async (req, res) => {
  try {
    const { code } = req.params;
    const { last4 } = req.query;

    if (!code) {
      return res.status(400).json({ message: "Thiếu mã vận đơn" });
    }

    const [[shipment]] = await db.query(
      "SELECT * FROM shipments WHERE tracking_code = ?",
      [code]
    );

    if (!shipment) {
      return res.status(404).json({ message: "Không tìm thấy đơn hàng" });
    }

    // Nếu có last4 → xác thực cho khách vãng lai
    if (last4) {
      const phone = shipment.receiver_phone || "";
      if (!phone.endsWith(last4)) {
        return res.status(403).json({ message: "Sai thông tin xác thực" });
      }
    }

    res.json(shipment);
  } catch (err) {
    console.error("❌ Lỗi tra cứu đơn công khai:", err);
    res.status(500).json({ message: "Lỗi server" });
  }
};
