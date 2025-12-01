import { useNavigate } from "react-router-dom";

import HeroBanner from "../components/homepage/HeroBanner";
import WhySection from "../components/homepage/WhySection";
import ServicePlans from "../components/homepage/ServicePlans";
import RealtimeSection from "../components/homepage/RealtimeSection";
import Testimonials from "../components/homepage/Testimonials";
import FinalCTA from "../components/homepage/FinalCTA";

import ChatBubble from "../components/ChatBubble";
import ChatPopupTop from "../components/ChatPopupTop";
import FloatingActions from "../components/FloatingActions";

import { useChat } from "../hooks/useChat";

export default function Home() {
  const navigate = useNavigate();

  // ⭐ LẤY GLOBAL popup state từ context
  const {
    aiOpen,
    supportOpen,
    openAIChat,
    openSupportChat,
    closeAIChat,
    closeSupportChat,
  } = useChat();

  return (
    <>
      <HeroBanner />

      <WhySection />

      <ServicePlans onCreate={() => navigate("/customer/create")} />

      {/* mở AI */}
      <RealtimeSection onChatAI={openAIChat} />

      <Testimonials />

      {/* mở support */}
      <FinalCTA onChat={openSupportChat} />

      {/* ============= POPUP CHAT RENDER ============= */}

      {aiOpen && <ChatPopupTop onClose={closeAIChat} bubbleOpen={false} />}

      {supportOpen && <ChatBubble onClose={closeSupportChat} />}

      {/* Nút nổi dưới góc */}
      <FloatingActions
        onOpenChatBubble={openSupportChat}
        onOpenChatTop={openAIChat}
      />
    </>
  );
}
