import { useState, useEffect } from "react";
import { MapContainer, TileLayer, Marker, useMap } from "react-leaflet";
import L from "leaflet";
//import ChatPopupTop from "../ChatPopupTop.jsx";
import { useChat } from "../../hooks/useChat.js";

export default function AIRealtimeSection({ onChat }) {
  const [driverPos, setDriverPos] = useState([16.0678, 108.2208]);

  //const [showChatAi, setShowChatAi] = useState(false);
  const { openAIChat } = useChat();
  // 📌 update mock
  useEffect(() => {
    const timer = setInterval(() => {
      setDriverPos((prev) => [
        prev[0] + (Math.random() - 0.5) * 0.005,
        prev[1] + (Math.random() - 0.5) * 0.005,
      ]);
    }, 3000);

    return () => clearInterval(timer);
  }, []);

  // 📌 icon radar
  const radarIcon = L.divIcon({
    className: "",
    html: `
      <div class="radar-wrapper">
        <div class="radar-core"></div>
        <div class="radar-wave"></div>
        <div class="radar-wave"></div>
        <div class="radar-wave"></div>
      </div>
    `,
    iconSize: [30, 30],
    iconAnchor: [15, 15],
  });

  // 📌 Auto follow map
  function FollowView({ pos }) {
    const map = useMap();
    useEffect(() => {
      map.flyTo(pos, map.getZoom(), { duration: 0.8 });
    }, [pos]);
    return null;
  }

  return (
    <section className="py-20 bg-blue-50">
      <div className="max-w-6xl mx-auto px-6 grid md:grid-cols-2 gap-10 items-center">
        <div data-aos="fade-right">
          <h3 className="text-3xl font-bold mb-4">
            🤖 Trợ lý AI & theo dõi realtime
          </h3>
          <p className="text-gray-700 mb-4">
            Chatbot AI của SpeedyShip giúp bạn tra cứu mã vận đơn, gợi ý gói
            dịch vụ phù hợp và trả lời các câu hỏi thường gặp – 24/7.
          </p>
          <ul className="space-y-2 text-sm text-gray-700 mb-6">
            <li>• Nhận trạng thái đơn ngay khi hỏi “Đơn SSP123 đang ở đâu?”</li>
            <li>• Gợi ý gói giao phù hợp với loại hàng & thời gian bạn cần.</li>
            <li>• Kết nối ngay điều phối viên khi cần hỗ trợ.</li>
          </ul>
          <button
            type="button"
            onClick={openAIChat}
            className="px-6 py-3 rounded-xl bg-blue-600 text-white font-semibold hover:bg-blue-700 transition inline-flex items-center gap-2"
          >
            🤖 Mở chat AI
          </button>
        </div>

        {/* RIGHT */}
        <div data-aos="fade-left">
          <div className="bg-white rounded-2xl shadow-xl p-6 space-y-4">
            <div className="flex justify-between">
              <p className="text-sm font-semibold text-gray-700">
                Đơn hàng đang giao hôm nay
              </p>
              <span className="text-xs px-2 py-1 bg-green-100 text-green-700 rounded-full">
                Realtime
              </span>
            </div>

            <p className="text-3xl font-extrabold text-blue-600">3,214</p>

            <div className="h-64 rounded-xl overflow-hidden relative">
              <MapContainer
                center={driverPos}
                zoom={13}
                scrollWheelZoom
                className="w-full h-full"
              >
                <TileLayer
                  attribution="&copy; OpenStreetMap contributors"
                  url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />

                <FollowView pos={driverPos} />

                <Marker position={driverPos} icon={radarIcon} />
              </MapContainer>

              <div className="pointer-events-none absolute inset-0 bg-blue-900/10" />
            </div>
            {/* {showChatAi && (
              <ChatPopupTop onClose={() => setShowChatAi(false)} />
            )} */}
          </div>
        </div>
      </div>
    </section>
  );
}
