import { useState, useEffect } from "react";
import { MapContainer, TileLayer, Marker, useMap } from "react-leaflet";
import L from "leaflet";
import { useChat } from "../../hooks/useChat.js";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faRobot,
  faMapLocationDot,
  faHeadset,
  faArrowRight,
} from "@fortawesome/free-solid-svg-icons";

export default function AIRealtimeSection() {
  const [driverPos, setDriverPos] = useState([16.0678, 108.2208]);
  const { openAIChat, openSupportChat } = useChat();

  // 📌 Update mock position
  useEffect(() => {
    const timer = setInterval(() => {
      setDriverPos((prev) => [
        prev[0] + (Math.random() - 0.5) * 0.005,
        prev[1] + (Math.random() - 0.5) * 0.005,
      ]);
    }, 3000);
    return () => clearInterval(timer);
  }, []);

  // 📌 Radar Icon
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
    <section className="py-24 bg-slate-50 relative overflow-hidden">
      {/* Background Decor */}
      <div className="absolute top-0 right-0 w-1/2 h-full bg-gradient-to-l from-orange-50 to-transparent pointer-events-none"></div>

      <div className="max-w-7xl mx-auto px-6 grid lg:grid-cols-2 gap-16 items-start relative z-10">
        {/* --- LEFT: CONTENT --- */}
        <div data-aos="fade-right">
          <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-orange-100 text-orange-600 mb-6 border border-orange-200">
            <FontAwesomeIcon icon={faRobot} className="text-xl" />
            <span className="font-bold text-lg uppercase tracking-wider">
              Hỗ trợ toàn diện
            </span>
          </div>

          <h3 className="text-3xl md:text-4xl font-extrabold text-[#113e48] mb-6 leading-tight">
            Công Nghệ AI & <br />
            <span className="text-orange-500">Con Người Kết Hợp</span>
          </h3>

          <p className="text-slate-600 text-lg mb-10 leading-relaxed">
            SpeedyShip mang đến trải nghiệm hỗ trợ khách hàng vượt trội nhờ sự
            kết hợp giữa tốc độ của AI và sự tận tâm của đội ngũ tư vấn viên
            chuyên nghiệp.
          </p>

          {/* --- GRID OPTIONS --- */}
          <div className="grid sm:grid-cols-2 gap-6">
            {/* OPTION 1: AI CHATBOT - HOVER CAM */}
            <div className="relative bg-white p-6 rounded-2xl shadow-md border border-[#113e48] hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group overflow-hidden">
              {/* === 1. HIỆU ỨNG NỀN TRƯỢT TỪ DƯỚI LÊN (MÀU CAM) === */}
              <div className="absolute inset-0 bg-orange-500 translate-y-full group-hover:translate-y-0 transition-transform duration-500 ease-in-out z-0"></div>

              {/* === 2. HIỆU ỨNG LƯỚT SÁNG (SHINE) === */}
              <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-1"></div>

              {/* === NỘI DUNG (Phải có z-10 để nằm trên nền màu) === */}
              <div className="relative z-10">
                {/* Icon Box: Đổi màu khi hover */}
                <div className="w-12 h-12 rounded-full bg-orange-100 text-[#113e48]  flex items-center justify-center text-xl mb-4 group-hover:scale-110 transition-transform group-hover:bg-white/20 group-hover:text-white">
                  <FontAwesomeIcon icon={faRobot} />
                </div>
                {/* Tiêu đề: Đổi sang trắng khi hover */}
                <h4 className="text-xl font-bold text-[#113e48] mb-2 group-hover:text-white transition-colors">
                  Trợ Lý AI 24/7
                </h4>
                {/* Mô tả: Đổi sang trắng mờ khi hover */}
                <p className="text-slate-500 text-sm mb-6 min-h-[60px] group-hover:text-white/90 transition-colors leading-relaxed">
                  Trả lời tức thì mọi câu hỏi về giá cước, lộ trình và trạng
                  thái đơn hàng bất kể ngày đêm.
                </p>
                {/* Nút: Đổi sang trắng khi hover */}
                <button
                  onClick={openAIChat}
                  className="text-[#113e48] font-bold text-sm uppercase tracking-wide flex items-center gap-2 group-hover:gap-3 transition-all group-hover:text-white"
                >
                  Chat với AI <FontAwesomeIcon icon={faArrowRight} />
                </button>
              </div>
            </div>

            {/* OPTION 2: HUMAN SUPPORT - HOVER XANH LÁ */}
            <div className="relative bg-white p-6 rounded-2xl shadow-md border border-orange-500 hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group overflow-hidden">
              {/* === 1. HIỆU ỨNG NỀN TRƯỢT TỪ DƯỚI LÊN (MÀU XANH LÁ) === */}
              {/* Bạn có thể đổi bg-green-500 thành bg-blue-500 nếu thích xanh dương */}
              <div className="absolute inset-0 bg-[#113e48] translate-y-full group-hover:translate-y-0 transition-transform duration-500 ease-in-out z-0"></div>

              {/* === 2. HIỆU ỨNG LƯỚT SÁNG (SHINE) === */}
              <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-1"></div>

              {/* === NỘI DUNG (Phải có z-10 để nằm trên nền màu) === */}
              <div className="relative z-10">
                {/* Icon Box: Đổi màu khi hover */}
                <div className="w-12 h-12 rounded-full bg-orange-200 text-[#113e48] flex items-center justify-center text-xl mb-4 group-hover:scale-110 transition-transform group-hover:bg-white/20 group-hover:text-white">
                  <FontAwesomeIcon icon={faHeadset} />
                </div>
                {/* Tiêu đề: Đổi sang trắng khi hover */}
                <h4 className="text-xl font-bold text-orange-500 mb-2 group-hover:text-white transition-colors">
                  Tư Vấn Viên
                </h4>
                {/* Mô tả: Đổi sang trắng mờ khi hover */}
                <p className="text-slate-500 text-sm mb-6 min-h-[60px] group-hover:text-white/90 transition-colors leading-relaxed">
                  Kết nối trực tiếp với nhân viên hỗ trợ để giải quyết các vấn
                  đề phức tạp hoặc khiếu nại.
                </p>
                {/* Nút: Đổi sang trắng khi hover */}
                <button
                  onClick={openSupportChat}
                  className="text-orange-500 font-bold text-sm uppercase tracking-wide flex items-center gap-2 group-hover:gap-3 transition-all group-hover:text-white"
                >
                  Gặp nhân viên <FontAwesomeIcon icon={faArrowRight} />
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* --- RIGHT: MAP CARD (Giữ nguyên) --- */}
        <div data-aos="fade-left" className="relative mt-8 lg:mt-0">
          <div className="bg-white rounded-[30px] shadow-[0_20px_50px_rgba(0,0,0,0.1)] p-2 border border-slate-100 relative z-10 overflow-hidden group">
            <div className="px-6 py-5 flex justify-between items-center border-b border-slate-50 bg-white relative z-20">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-blue-50 flex items-center justify-center text-blue-600">
                  <FontAwesomeIcon icon={faMapLocationDot} />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-800">
                    Hoạt động hôm nay
                  </p>
                  <p className="text-xs text-slate-500">
                    Dữ liệu thời gian thực
                  </p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-2xl font-black text-[#113e48]">3,214</p>
                <div className="flex items-center gap-1 justify-end">
                  <span className="relative flex h-2 w-2">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-2 w-2 bg-green-500"></span>
                  </span>
                  <span className="text-[10px] font-bold text-green-600 uppercase">
                    Live
                  </span>
                </div>
              </div>
            </div>

            <div className="h-[400px] w-full rounded-[24px] overflow-hidden relative mt-2">
              <MapContainer
                center={driverPos}
                zoom={13}
                scrollWheelZoom={false}
                className="w-full h-full"
                zoomControl={false}
              >
                <TileLayer
                  attribution=""
                  url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />
                <FollowView pos={driverPos} />
                <Marker position={driverPos} icon={radarIcon} />
              </MapContainer>

              <div className="pointer-events-none absolute inset-0 shadow-[inset_0_0_40px_rgba(0,0,0,0.1)] rounded-[24px] z-[400]" />

              <div className="absolute bottom-4 left-4 z-[500] bg-white/90 backdrop-blur-sm px-4 py-2 rounded-xl shadow-lg border border-white/50 text-xs font-semibold text-slate-700 flex items-center gap-2">
                <div className="w-2 h-2 rounded-full bg-orange-500 animate-pulse"></div>
                Xem hành trình trực tiếp: Xe #8392
              </div>
            </div>
          </div>

          <div className="absolute -top-10 -right-10 w-40 h-40 bg-orange-200 rounded-full blur-3xl opacity-30 animate-pulse"></div>
          <div className="absolute -bottom-10 -left-10 w-40 h-40 bg-blue-200 rounded-full blur-3xl opacity-30"></div>
        </div>
      </div>
    </section>
  );
}
