import { useState, useEffect } from "react"; // 1. Import useEffect
import { motion, AnimatePresence } from "framer-motion";
import { useChat } from "../hooks/useChat"; // 2. Import Context

import FloatingActions from "./FloatingActions";
import ChatPopupTop from "./ChatPopupTop";
import ChatBubble from "./ChatBubble";

export default function ChatLayout() {
  // --- LẤY DATA TỪ CONTEXT ---
  // Để lắng nghe khi nào bên ngoài gọi lệnh mở
  const { isOpen, activeTab, closeChat } = useChat();

  // State quản lý danh sách chat đang mở (dạng mảng - Logic cũ của bạn)
  const [activeChats, setActiveChats] = useState([]);

  // --- HÀM LOCAL: Mở chat ---
  const handleOpenChat = (type) => {
    const isAlreadyOpen = activeChats.find((chat) => chat === type);
    if (!isAlreadyOpen) {
      setActiveChats((prev) => [...prev, type]);
    }
  };

  // --- HÀM LOCAL: Đóng chat ---
  const handleCloseChat = (type) => {
    setActiveChats((prev) => prev.filter((chat) => chat !== type));

    // Quan trọng: Khi đóng bằng tay, cũng báo cho Context biết là đã đóng
    // Để lần sau bấm nút bên ngoài nó còn nhận diện được sự thay đổi
    closeChat();
  };

  // --- 🔥 PHẦN MỚI THÊM: ĐỒNG BỘ CONTEXT -> LOCAL STATE ---
  // Khi bạn bấm nút ở Banner, Context thay đổi (isOpen = true),
  // useEffect này sẽ bắt được và tự động mở cửa sổ tương ứng.
  useEffect(() => {
    if (isOpen) {
      if (activeTab === "ai") {
        handleOpenChat("bot");
      } else if (activeTab === "support") {
        handleOpenChat("support");
      }
    }
  }, [isOpen, activeTab]);

  return (
    <div className="relative z-[9999]">
      <div className="fixed bottom-0 right-32 flex items-end gap-4 z-[9990] pointer-events-none px-4">
        <AnimatePresence mode="popLayout">
          {activeChats.map((type) => (
            <motion.div
              key={type}
              layout
              initial={{ opacity: 0, y: 50, scale: 0.9 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{
                opacity: 0,
                y: 20,
                scale: 0.9,
                transition: { duration: 0.2 },
              }}
              transition={{ type: "spring", stiffness: 400, damping: 30 }}
              className="pointer-events-auto"
            >
              {type === "bot" && (
                <div className="mb-4">
                  <ChatPopupTop onClose={() => handleCloseChat("bot")} />
                </div>
              )}

              {type === "support" && (
                <div className="mb-4">
                  <ChatBubble onClose={() => handleCloseChat("support")} />
                </div>
              )}
            </motion.div>
          ))}
        </AnimatePresence>
      </div>

      {/* --- NÚT BẤM (FloatingActions) --- */}
      {/* Nút này gọi thẳng hàm local handleOpenChat hoặc gọi Context đều được.
          Ở đây mình gọi local cho nhanh vì đang ở trong component này rồi */}
      <FloatingActions
        onOpenChatTop={() => handleOpenChat("bot")}
        onOpenChatBubble={() => handleOpenChat("support")}
      />
    </div>
  );
}
