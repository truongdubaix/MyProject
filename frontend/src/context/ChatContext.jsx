import { createContext, useState, useContext } from "react";

// eslint-disable-next-line react-refresh/only-export-components
export const ChatContext = createContext(null);

// Hook phụ trợ để dùng nhanh (Optional)
export const useChat = () => useContext(ChatContext);

export function ChatProvider({ children }) {
  // Thay vì 2 biến đóng mở, ta dùng 1 biến isOpen và 1 biến activeTab
  const [isOpen, setIsOpen] = useState(false);
  const [activeTab, setActiveTab] = useState("ai"); // Giá trị: "ai" hoặc "support"

  const value = {
    isOpen, // Trạng thái mở cửa sổ chat chung
    activeTab, // Tab hiện tại đang xem ('ai' | 'support')
    setActiveTab, // Hàm để chuyển tab thủ công (khi bấm nút trên header chat)

    // Hàm mở AI: Vừa mở cửa sổ, vừa set tab là AI
    openAIChat: () => {
      setActiveTab("ai");
      setIsOpen(true);
    },

    // Hàm mở Support: Vừa mở cửa sổ, vừa set tab là Support
    openSupportChat: () => {
      setActiveTab("support");
      setIsOpen(true);
    },

    // Hàm đóng chat chung
    closeChat: () => setIsOpen(false),
  };

  return <ChatContext.Provider value={value}>{children}</ChatContext.Provider>;
}
