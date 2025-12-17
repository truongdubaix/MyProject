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
import UtilitySidebar from "../components/UtilitySidebar";
import AboutSection from "../components/homepage/AboutSection";
import PartnerCarousel from "../components/homepage/PartnerCarousel";
import CommitmentSection from "../components/homepage/CommitmentSection";
import ServicesSection from "../components/homepage/ServicesSection";
import PricingAboutSection from "../components/homepage/PricingAboutSection";
import OrderProcessSection from "../components/homepage/OrderProcessSection";

export default function Home() {
  const navigate = useNavigate();

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
      {/* <UtilitySidebar /> */}
      {/* Slide 1,2,3 */}
      <HeroBanner />

      <AboutSection />

      <PartnerCarousel />

      <ServicesSection />

      <OrderProcessSection />

      <PricingAboutSection />

      <CommitmentSection />

      {/* Tại sao nên chọn SpeedyShip? */}
      {/* <WhySection /> */}
      {/*  Chọn gói dịch vụ phù hợp */}
      {/* <ServicePlans onCreate={() => navigate("/customer/create")} /> */}

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
