import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";

// 1. Import file nút bấm của bạn
import FloatingActions from "./FloatingActions";

// 2. Import 2 file chat content của bạn
import ChatPopupTop from "./ChatPopupTop"; // Chat Bot
import ChatBubble from "./ChatBubble"; // Chat Support

export default function ChatLayout() {
  // State quản lý danh sách chat đang mở (dạng mảng)
  const [activeChats, setActiveChats] = useState([]);

  // Hàm mở chat: Thêm vào mảng nếu chưa có
  const handleOpenChat = (type) => {
    // Kiểm tra xem đã mở chưa
    const isAlreadyOpen = activeChats.find((chat) => chat === type);

    if (!isAlreadyOpen) {
      // Thêm chat mới vào cuối danh sách
      setActiveChats((prev) => [...prev, type]);
    }
  };

  // Hàm đóng chat: Xóa khỏi mảng
  const handleCloseChat = (type) => {
    setActiveChats((prev) => prev.filter((chat) => chat !== type));
  };

  return (
    <div className="relative z-[9999]">
      <div className="fixed bottom-0 right-32 flex items-end gap-4 z-[9990] pointer-events-none px-4">
        <AnimatePresence mode="popLayout">
          {activeChats.map((type) => (
            <motion.div
              key={type} // Key cực kỳ quan trọng để React phân biệt
              layout // 🔥 CÁI NÀY LÀM NÊN ĐIỀU KỲ DIỆU: Tự động trượt sang khi có thằng bên cạnh bị xóa
              initial={{ opacity: 0, y: 50, scale: 0.9 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{
                opacity: 0,
                y: 20,
                scale: 0.9,
                transition: { duration: 0.2 },
              }}
              transition={{ type: "spring", stiffness: 400, damping: 30 }}
              className="pointer-events-auto" // Bật lại chuột cho khung chat
            >
              {/* Cửa sổ Chat Bot */}
              {type === "bot" && (
                <div className="bg-white rounded-t-xl shadow-2xl overflow-hidden border border-gray-200">
                  {/* Truyền hàm đóng vào bên trong */}
                  <ChatPopupTop onClose={() => handleCloseChat("bot")} />
                </div>
              )}

              {/* Cửa sổ Chat Support */}
              {type === "support" && (
                <div className="bg-white rounded-t-xl shadow-2xl overflow-hidden border border-gray-200">
                  {/* Truyền hàm đóng vào bên trong */}
                  <ChatBubble onClose={() => handleCloseChat("support")} />
                </div>
              )}
            </motion.div>
          ))}
        </AnimatePresence>
      </div>

      {/* --- NÚT BẤM (FloatingActions) --- */}
      {/* Nút này nằm cố định ở góc, không liên quan đến flexbox ở trên */}
      <FloatingActions
        onOpenChatTop={() => handleOpenChat("bot")}
        onOpenChatBubble={() => handleOpenChat("support")}
      />
    </div>
  );
}
