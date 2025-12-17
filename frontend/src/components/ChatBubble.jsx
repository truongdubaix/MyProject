import { useState, useEffect, useRef } from "react";
import io from "socket.io-client";
import { motion, AnimatePresence } from "framer-motion";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faMinus,
  faExpand,
  faTimes,
  faPaperPlane,
  faUserTie,
  faInfoCircle,
} from "@fortawesome/free-solid-svg-icons";

export default function ChatBubble({ onClose }) {
  const [collapsed, setCollapsed] = useState(false);
  const [chatId, setChatId] = useState(null);

  // Thêm state để quản lý Toast thông báo
  const [showToast, setShowToast] = useState(false);

  // Tin nhắn ban đầu
  const [messages, setMessages] = useState([
    {
      role: "system",
      content:
        "Xin chào! 👋 Cảm ơn bạn đã liên hệ SpeedyShip. Chúng tôi có thể giúp gì cho bạn hôm nay?",
    },
  ]);

  const [input, setInput] = useState("");
  const [ready, setReady] = useState(false); // Trạng thái kết nối
  const messagesEndRef = useRef(null);

  // Ref để giữ instance của socket
  const socketRef = useRef(null);

  const userId = localStorage.getItem("userId");
  const role = localStorage.getItem("role");

  // Auto scroll
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, collapsed]);

  // 🟢 LOGIC KẾT NỐI SOCKET
  useEffect(() => {
    if (!userId || role !== "customer") {
      alert("⚠ Vui lòng đăng nhập để chat!");
      onClose();
      return;
    }

    if (!socketRef.current) {
      console.log("🔌 Client: Đang khởi tạo Socket...");
      socketRef.current = io("http://localhost:5000", {
        transports: ["websocket"],
        reconnectionAttempts: 5,
      });
    }

    const socket = socketRef.current;

    const onChatStarted = (id) => {
      console.log("✅ Client: Chat Started! ID:", id);
      setChatId(id);
      setReady(true);
      socket.emit("joinChat", id);

      setMessages((prev) => {
        if (
          prev.length > 0 &&
          prev[prev.length - 1].content.includes("kết nối")
        ) {
          return prev;
        }
        return [
          ...prev,
          { role: "system", content: "Đã kết nối với nhân viên hỗ trợ." },
        ];
      });
    };

    const onNewMessage = (msg) => {
      console.log("📩 New Message:", msg);
      setMessages((prev) => {
        const exists = prev.some(
          (m) =>
            m.content === msg.content &&
            m.role === msg.role &&
            (Math.abs(new Date(m.created_at) - new Date(msg.created_at)) <
              2000 ||
              !m.created_at)
        );
        if (exists) return prev;
        return [...prev, msg];
      });
    };

    // 🔥 SỬA ĐỔI QUAN TRỌNG: Thay alert bằng Toast
    const onChatEnded = () => {
      // 1. Hiển thị Toast
      setShowToast(true);
      // 2. Khóa chat
      setReady(false);
      // 3. Đảm bảo cửa sổ đang mở để người dùng thấy thông báo
      setCollapsed(false);

      // 4. Đợi 4 giây rồi mới đóng hẳn
      setTimeout(() => {
        onClose();
      }, 4000);
    };

    const onConnectError = (err) => {
      console.error("❌ Socket Error:", err);
    };

    socket.on("connect", () => {
      console.log("🌐 Socket Connected:", socket.id);
      socket.emit("startChat", userId);
    });

    socket.on("chatStarted", onChatStarted);
    socket.on("newMessage", onNewMessage);
    socket.on("chatEnded", onChatEnded);
    socket.on("connect_error", onConnectError);

    if (socket.connected) {
      socket.emit("startChat", userId);
    }

    return () => {
      console.log("🛑 Client: Cleanup Socket...");
      socket.off("connect");
      socket.off("chatStarted", onChatStarted);
      socket.off("newMessage", onNewMessage);
      socket.off("chatEnded", onChatEnded);
      socket.off("connect_error", onConnectError);
      socket.disconnect();
      socketRef.current = null;
    };
  }, [userId, role, onClose]);

  // 🟢 HÀM GỬI TIN NHẮN
  const sendMessage = () => {
    if (!input.trim()) return;

    const tempMsg = {
      role: "customer",
      content: input.trim(),
      created_at: new Date().toISOString(),
    };
    setMessages((prev) => [...prev, tempMsg]);

    if (socketRef.current && chatId) {
      socketRef.current.emit("sendMessage", {
        chatId,
        senderId: userId,
        role: "customer",
        content: input.trim(),
      });
    }
    setInput("");
  };

  const endChat = () => {
    if (socketRef.current && chatId) {
      socketRef.current.emit("endChat", userId);
    }
    onClose();
  };

  return (
    <motion.div
      initial={{ opacity: 0, scale: 0.9 }}
      animate={{
        opacity: 1,
        scale: 1,
        width: 400,
        height: collapsed ? 50 : 600,
      }}
      exit={{ opacity: 0, scale: 0.9 }}
      transition={{ type: "spring", stiffness: 300, damping: 30 }}
      className="bg-white rounded-t-xl shadow-2xl flex flex-col overflow-hidden border border-gray-200 font-sans relative" // Thêm relative để định vị Toast
    >
      {/* --- 🔥 TOAST THÔNG BÁO KẾT THÚC --- */}
      <AnimatePresence>
        {showToast && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0 }}
            className="absolute top-16 left-0 right-0 mx-auto w-max z-50 flex items-center gap-2 bg-black/80 text-white px-4 py-2 rounded-full text-xs shadow-lg backdrop-blur-sm"
          >
            <FontAwesomeIcon icon={faInfoCircle} className="text-yellow-400" />
            <span>Cuộc trò chuyện đã kết thúc</span>
          </motion.div>
        )}
      </AnimatePresence>

      {/* HEADER */}
      <div
        className="bg-gradient-to-r from-orange-600 to-blue-500 text-white px-4 py-3 flex justify-between items-center cursor-pointer select-none"
        onClick={() => setCollapsed(!collapsed)}
      >
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-full bg-white/20 flex items-center justify-center relative">
            <div
              className={`absolute bottom-0 right-0 w-2.5 h-2.5 border-2 border-blue-600 rounded-full ${
                ready ? "bg-green-400" : "bg-yellow-400"
              }`}
            ></div>
            <FontAwesomeIcon icon={faUserTie} />
          </div>
          <div>
            <h3 className="font-bold text-base leading-tight">
              HỖ TRỢ TRỰC TUYẾN
            </h3>
            {!collapsed && (
              <p className="text-[11px] text-blue-100 opacity-90">
                {ready ? "Đang trực tuyến" : "Đang kết nối..."}
              </p>
            )}
          </div>
        </div>

        <div className="flex items-center gap-3 text-white/80">
          <FontAwesomeIcon
            icon={collapsed ? faExpand : faMinus}
            className="hover:text-white transition-colors text-sm"
            title={collapsed ? "Mở rộng" : "Thu nhỏ"}
          />
          <FontAwesomeIcon
            icon={faTimes}
            onClick={(e) => {
              e.stopPropagation();
              endChat();
            }}
            className="hover:text-red-200 transition-colors ml-1 text-sm"
            title="Kết thúc chat"
          />
        </div>
      </div>

      {/* BODY */}
      {!collapsed && (
        <>
          <div className="flex-1 p-4 overflow-y-auto bg-slate-50 scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent">
            <div className="text-center mb-6">
              <p className="text-[10px] text-gray-400 uppercase font-semibold">
                Cuộc trò chuyện được bảo mật
              </p>
            </div>

            <AnimatePresence>
              {messages.map((m, i) => (
                <motion.div
                  key={i}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  className={`flex w-full mb-4 ${
                    m.role === "customer"
                      ? "justify-end"
                      : m.role === "system"
                      ? "justify-center"
                      : "justify-start"
                  }`}
                >
                  {m.role !== "customer" && m.role !== "system" && (
                    <div className="w-8 h-8 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center mr-2 mt-1 flex-shrink-0 text-xs border border-blue-200">
                      <FontAwesomeIcon icon={faUserTie} />
                    </div>
                  )}

                  {m.role === "system" ? (
                    <div className="max-w-[85%] text-center">
                      <span className="text-[10px] text-gray-500 bg-gray-100 px-3 py-1 rounded-full inline-block border border-gray-200">
                        {m.content}
                      </span>
                    </div>
                  ) : (
                    <div
                      className={`p-3 rounded-2xl text-sm max-w-[75%] leading-relaxed shadow-sm ${
                        m.role === "customer"
                          ? "bg-blue-600 text-white rounded-br-none"
                          : "bg-white text-gray-800 border border-gray-100 rounded-bl-none"
                      }`}
                    >
                      {m.content}
                    </div>
                  )}
                </motion.div>
              ))}
            </AnimatePresence>
            <div ref={messagesEndRef} />
          </div>

          {/* INPUT */}
          <div className="p-3 bg-white border-t border-gray-100 relative z-20">
            <div
              className={`relative flex items-center bg-gray-100 rounded-full px-4 py-2 border border-transparent transition-all duration-300 ${
                ready
                  ? "focus-within:bg-white focus-within:ring-1 focus-within:ring-blue-500"
                  : "opacity-70 cursor-not-allowed"
              }`}
            >
              <input
                className="flex-1 bg-transparent border-none outline-none text-sm text-gray-700 placeholder-gray-400 disabled:cursor-not-allowed"
                placeholder={ready ? "Nhập tin nhắn..." : "Đang kết nối..."}
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={(e) => e.key === "Enter" && sendMessage()}
                disabled={!ready}
                autoFocus
              />
              <button
                onClick={sendMessage}
                disabled={!ready || !input.trim()}
                className={`ml-2 w-8 h-8 shrink-0 flex items-center justify-center rounded-full transition-all duration-300 shadow-sm ${
                  ready && input.trim()
                    ? "bg-blue-600 text-white hover:bg-blue-700"
                    : "bg-gray-300 text-gray-500 cursor-not-allowed"
                }`}
              >
                <FontAwesomeIcon
                  icon={faPaperPlane}
                  className="text-xs pr-[2px]"
                />
              </button>
            </div>
            <div className="text-center mt-2">
              <p className="text-[10px] text-gray-400 flex items-center justify-center gap-1">
                <span
                  className={`w-1.5 h-1.5 rounded-full ${
                    ready ? "bg-green-500" : "bg-yellow-500 animate-pulse"
                  }`}
                ></span>
                {ready ? "Kết nối ổn định" : "Đang kết nối server..."}
              </p>
            </div>
          </div>
        </>
      )}
    </motion.div>
  );
}
