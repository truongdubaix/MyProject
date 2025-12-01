import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Pagination, Navigation, EffectFade } from "swiper/modules";
import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";

import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import "swiper/css/effect-fade";

import { useChat } from "../../hooks/useChat.js";

export default function HeroBanner() {
  const navigate = useNavigate();
  //const { openAIChat, openSupportChat } = useChat(); // ⭐⭐ FIX QUAN TRỌNG
  const { openAIChat, openSupportChat } = useChat(); // ⭐⭐ FIX CHÍNH XÁC
  // TRACKING
  const [trackingCode, setTrackingCode] = useState("");

  const handleTrack = () => {
    if (!trackingCode.trim()) return;
    navigate(`/tracking?code=${trackingCode.trim()}`);
  };

  const handleCreateShipment = () => {
    const role = localStorage.getItem("role");
    if (!role || role !== "customer") return navigate("/login");
    return navigate("/customer/create");
  };

  return (
    <section className="relative h-[90vh]">
      <Swiper
        centeredSlides
        loop
        effect="fade"
        autoplay={{ delay: 5500, disableOnInteraction: false }}
        pagination={{ clickable: true }}
        navigation
        modules={[Autoplay, Pagination, Navigation, EffectFade]}
        className="h-full"
      >
        {/* ================= SLIDE 1 ================= */}
        <SwiperSlide>
          <div className="relative h-full flex items-center">
            <img
              src="/assets/banners/banner1.png"
              className="absolute inset-0 w-full h-full object-cover object-center"
            />
            <div className="absolute inset-0 bg-gradient-to-r from-black/80 via-black/60 to-black/20" />

            <div className="relative z-10 max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center gap-10">
              {/* LEFT */}
              <div className="text-white md:w-1/2">
                <p className="uppercase tracking-[0.3em] text-sm mb-3 text-blue-200">
                  SpeedyShip Logistics
                </p>

                <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold leading-tight mb-4">
                  Giao nhanh, <span className="text-blue-400">đúng hẹn</span>,
                  theo dõi realtime.
                </h1>

                <p className="text-base md:text-lg text-gray-200 mb-6">
                  Tạo đơn trong vài giây — theo dõi hành trình từng km — cập
                  nhật trạng thái realtime.
                </p>

                {/* BUTTON */}
                <div className="flex flex-col sm:flex-row gap-3 mb-6">
                  <button
                    onClick={handleCreateShipment}
                    className="px-6 py-3 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-semibold shadow-lg shadow-blue-500/40 transition"
                  >
                    🚀 Tạo đơn ngay
                  </button>

                  <button
                    onClick={openAIChat}
                    className="px-6 py-3 rounded-xl bg-white/10 hover:bg-white/20 text-white font-semibold border border-white/20 backdrop-blur transition"
                  >
                    🤖 Hỏi AI tư vấn
                  </button>
                </div>

                {/* STAT */}
                <div className="flex flex-wrap gap-6 text-sm text-gray-200">
                  <div>
                    <p className="font-semibold text-white">2–4 giờ</p>
                    <p>Nội thành hỏa tốc</p>
                  </div>
                  <div>
                    <p className="font-semibold text-white">98.7%</p>
                    <p>Đơn đúng hẹn</p>
                  </div>
                  <div>
                    <p className="font-semibold text-white">+10.000</p>
                    <p>Đơn mỗi tháng</p>
                  </div>
                </div>
              </div>

              {/* TRACKING BOX */}
              <div className="md:w-1/2 flex justify-end">
                <div className="w-full max-w-md bg-white rounded-2xl shadow-2xl p-6 space-y-4">
                  <h2 className="text-xl font-bold text-gray-800">
                    🔍 Tra cứu đơn hàng
                  </h2>
                  <p className="text-sm text-gray-500">
                    Nhập mã vận đơn để xem trạng thái mới nhất.
                  </p>

                  <div className="flex flex-col gap-3">
                    <input
                      value={trackingCode}
                      onChange={(e) => setTrackingCode(e.target.value)}
                      placeholder="Ví dụ: SSP123456789"
                      className="border rounded-xl px-4 py-3 text-gray-800 text-sm focus:ring-2 focus:ring-blue-500"
                    />
                    <button
                      onClick={handleTrack}
                      className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-3 rounded-xl"
                    >
                      Xem trạng thái
                    </button>
                  </div>

                  <div className="mt-2 border-t pt-3 flex justify-between text-xs text-gray-500">
                    <span>Hỗ trợ 24/7</span>
                    <button
                      onClick={openSupportChat}
                      className="px-4 py-2 rounded-xl border border-gray-300 text-gray-700 hover:bg-gray-100 font-medium"
                    >
                      💬 Chat điều phối viên
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </SwiperSlide>
        {/* Slide 2 — Công nghệ realtime */}
        <SwiperSlide>
          <div className="relative h-full flex items-center justify-center">
            <img
              src="/assets/banners/banner2.png"
              alt="Theo dõi trạng thái đơn hàng realtime"
              className="absolute inset-0 w-full h-full object-cover object-center"
            />
            <div className="absolute inset-0 bg-gradient-to-r from-black/80 via-black/60 to-black/10" />

            <div
              className="relative z-10 max-w-4xl text-center px-6"
              data-aos="fade-up"
            >
              <h2 className="text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow-xl">
                Theo dõi trạng thái realtime
              </h2>
              <p className="text-lg md:text-xl text-gray-200 mb-6">
                Cập nhật hành trình từng km — từ lúc nhận hàng đến giao thành
                công.
              </p>

              <div className="flex flex-wrap items-center justify-center gap-4 text-white text-sm opacity-90">
                <span className="px-4 py-2 border border-white/30 rounded-xl">
                  GPS Tracking
                </span>
                <span className="px-4 py-2 border border-white/30 rounded-xl">
                  Thông báo tự động
                </span>
                <span className="px-4 py-2 border border-white/30 rounded-xl">
                  Lịch sử vận đơn
                </span>
              </div>

              <Link
                to="/tracking"
                className="mt-6 inline-block px-6 py-3 bg-blue-600 rounded-xl text-white font-semibold hover:bg-blue-700 shadow-md"
              >
                🔍 Tra cứu đơn ngay
              </Link>
            </div>
          </div>
        </SwiperSlide>

        {/* Slide 3 — Đối tác & bảo chứng chất lượng */}
        <SwiperSlide>
          <div className="relative h-full flex items-center justify-center">
            <img
              src="/assets/banners/banner3.png"
              alt="Đối tác vận chuyển SpeedyShip"
              className="absolute inset-0 w-full h-full object-cover object-center"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/50 to-black/10" />

            <div
              className="relative z-10 max-w-4xl text-center px-6"
              data-aos="fade-up"
            >
              <h2 className="text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow">
                Đồng hành cùng hàng nghìn doanh nghiệp
              </h2>
              <p className="text-lg text-gray-200 mb-6">
                SpeedyShip hỗ trợ shop nhỏ, sàn TMĐT, doanh nghiệp lớn — vận
                hành chuyên nghiệp.
              </p>

              <div className="flex flex-wrap justify-center gap-5">
                {[
                  "shopee.png",
                  "tiktok.png",
                  "lazada.png",
                  "applelogo.png",
                  "samsung.png",
                  "vivo.png",
                  "oppo.png",
                ].map((logo, i) => (
                  <img
                    key={i}
                    src={`/assets/logo/${logo}`}
                    className="h-12 md:h-14 grayscale hover:grayscale-0 transition duration-300"
                  />
                ))}
              </div>

              <Link
                to="/contact"
                className="mt-8 inline-block px-6 py-3 bg-white/10 backdrop-blur border border-white/30 text-white font-semibold rounded-xl hover:bg-white/20 transition"
              >
                🤝 Liên hệ hợp tác
              </Link>
            </div>
          </div>
        </SwiperSlide>
      </Swiper>
    </section>
  );
}
