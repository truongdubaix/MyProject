import { createContext, useState } from "react";

// eslint-disable-next-line react-refresh/only-export-components
export const ChatContext = createContext(null);

export function ChatProvider({ children }) {
  const [aiOpen, setAiOpen] = useState(false);
  const [supportOpen, setSupportOpen] = useState(false);

  const value = {
    aiOpen,
    supportOpen,

    openAIChat: () => setAiOpen(true),
    closeAIChat: () => setAiOpen(false),

    openSupportChat: () => setSupportOpen(true),
    closeSupportChat: () => setSupportOpen(false),

    closeAll: () => {
      setAiOpen(false);
      setSupportOpen(false);
    },
  };

  return <ChatContext.Provider value={value}>{children}</ChatContext.Provider>;
}
