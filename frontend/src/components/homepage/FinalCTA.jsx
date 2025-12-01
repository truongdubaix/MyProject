import { Link } from "react-router-dom";
import ChatBubble from "../ChatBubble.jsx";
import { useState } from "react";

export default function FinalCTA({ onChat }) {
  const [showChatSupport, setShowChatSupport] = useState(false); // chat tư vấn
  return (
    <section className="py-16 bg-gradient-to-r from-blue-600 via-blue-500 to-indigo-600 text-white">
      <div className="max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center justify-between gap-6">
        <div>
          <h3 className="text-3xl md:text-4xl font-bold mb-3">
            Sẵn sàng tăng tốc cùng SpeedyShip?
          </h3>
          <p className="text-sm md:text-base text-blue-100">
            Tạo đơn chỉ mất chưa đến 30 giây. Giao hàng nhanh, minh bạch, hỗ trợ
            tận tâm.
          </p>
        </div>
        <div className="flex flex-col sm:flex-row gap-3">
          <Link
            to="/customer/create"
            className="px-6 py-3 rounded-xl bg-white text-blue-700 font-semibold hover:bg-blue-50 text-center"
          >
            🚀 Tạo đơn ngay
          </Link>
          <button
            type="button"
            onClick={() => setShowChatSupport(true)}
            className="px-6 py-3 rounded-xl border border-white/60 text-white font-semibold hover:bg-white/10 text-center"
          >
            💬 Chat tư vấn
          </button>
        </div>
      </div>
      {showChatSupport && (
        <ChatBubble onClose={() => setShowChatSupport(false)} />
      )}
    </section>
  );
}
