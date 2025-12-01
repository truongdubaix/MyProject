import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import AOS from "aos";
import "aos/dist/aos.css";
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Pagination, Navigation, EffectFade } from "swiper/modules";
//import { MapContainer, TileLayer, Marker } from "react-leaflet";
//import L from "leaflet";
//import { useMap } from "react-leaflet";
import { MapContainer, TileLayer, Marker, useMap } from "react-leaflet";

import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import "swiper/css/effect-fade";

// Chat components
import ChatBubble from "../components/ChatBubble.jsx"; // AI Bot
import ChatPopupTop from "../components/ChatPopupTop"; // Dispatcher (support)
import FloatingActions from "../components/FloatingActions";

export default function Home() {
  const navigate = useNavigate();

  const [trackingCode, setTrackingCode] = useState("");
  const [showChatBubble, setShowChatBubble] = useState(false); // AI
  const [showChatTop, setShowChatTop] = useState(false); // Human

  useEffect(() => {
    AOS.init({ duration: 800, once: true });
  }, []);

  const [driverPos, setDriverPos] = useState([16.0678, 108.2208]); // Đà Nẵng

  useEffect(() => {
    const timer = setInterval(() => {
      setDrivers((prev) =>
        prev.map((d) => ({
          ...d,
          pos: [
            d.pos[0] + (Math.random() - 0.5) * 0.02,
            d.pos[1] + (Math.random() - 0.5) * 0.02,
          ],
        }))
      );
    }, 3000);

    return () => clearInterval(timer);
  }, []);

  // const [drivers, setDrivers] = useState([
  //   { id: 1, pos: [10.8231, 106.6297] }, // HCM
  //   { id: 2, pos: [21.0278, 105.8342] }, // Hà Nội
  //   { id: 3, pos: [16.0678, 108.2208] }, // Đà Nẵng
  // ]);
  // useEffect(() => {
  //   const timer = setInterval(() => {
  //     setDriverPos((prev) => [
  //       prev[0] + (Math.random() - 0.5) * 0.01,
  //       prev[1] + (Math.random() - 0.5) * 0.01,
  //     ]);
  //   }, 3000);

  //   return () => clearInterval(timer);
  // }, []);

  //  Điều hướng tạo đơn
  const handleCreateShipment = () => {
    const role = localStorage.getItem("role");

    // Chưa đăng nhập or không phải customer → login
    if (!role || role !== "customer") {
      return navigate("/login");
    }

    // Đã là customer
    return navigate("/customer/create");
  };

  //  Điều hướng tra cứu
  const handleTrack = () => {
    if (!trackingCode.trim()) return;
    navigate(`/tracking?code=${trackingCode.trim()}`);
  };

  const driverIcon = new L.Icon({
    iconUrl: "https://cdn-icons-png.flaticon.com/512/854/854866.png",
    iconSize: [28, 28],
    iconAnchor: [14, 28],
  });

  function FollowView({ pos }) {
    const map = useMap();
    useEffect(() => {
      map.setView(pos, 13, { animate: true });
    }, [pos]);
    return null;
  }

  return (
    <>
      {/* ========== HERO ========== */}
      <section className="relative h-[90vh]">
        <Swiper
          spaceBetween={0}
          centeredSlides
          loop
          autoplay={{ delay: 6500, disableOnInteraction: false }}
          pagination={{ clickable: true }}
          navigation
          effect="fade"
          modules={[Autoplay, Pagination, Navigation, EffectFade]}
          className="h-full"
        >
          {/* Slide 1 */}
          <SwiperSlide>
            <div className="relative h-full flex items-center">
              <img
                src="/assets/banners/banner1.png"
                alt="SpeedyShip giao nhanh"
                className="absolute inset-0 w-full h-full object-cover object-center"
              />
              <div className="absolute inset-0 bg-gradient-to-r from-black/80 via-black/60 to-black/20" />

              <div className="relative z-10 max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center gap-10">
                {/* LEFT */}
                <div className="text-white md:w-1/2" data-aos="fade-right">
                  <p className="uppercase tracking-[0.3em] text-sm mb-3 text-blue-200">
                    SpeedyShip Logistics
                  </p>

                  <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold leading-tight mb-4">
                    Giao nhanh, <span className="text-blue-400">đúng hẹn</span>,
                    theo dõi realtime.
                  </h1>

                  <p className="text-base md:text-lg text-gray-200 mb-6">
                    Tạo đơn trong vài giây – theo dõi hành trình từng km – cập
                    nhật trạng thái theo thời gian thực.
                  </p>

                  {/* BUTTONS FIXED */}
                  <div className="flex flex-col sm:flex-row gap-3 mb-6">
                    <button
                      onClick={handleCreateShipment}
                      className="inline-flex items-center justify-center px-6 py-3 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-semibold shadow-lg shadow-blue-500/40 transition"
                    >
                      🚀 Tạo đơn ngay
                    </button>

                    {/* HỎI AI = ChatBubble */}
                    <button
                      onClick={() => setShowChatTop(true)}
                      className="inline-flex items-center justify-center px-6 py-3 rounded-xl bg-white/10 hover:bg-white/20 text-white font-medium border border-white/20 backdrop-blur transition"
                    >
                      🤖 Hỏi AI tư vấn
                    </button>
                  </div>

                  {/* Stats */}
                  <div className="flex flex-wrap gap-6 text-sm text-gray-200">
                    <div>
                      <p className="font-semibold text-white">2–4 giờ</p>
                      <p>Nội thành hỏa tốc</p>
                    </div>
                    <div>
                      <p className="font-semibold text-white">98.7%</p>
                      <p>Đơn giao đúng hẹn</p>
                    </div>
                    <div>
                      <p className="font-semibold text-white">+10.000</p>
                      <p>Đơn mỗi tháng</p>
                    </div>
                  </div>
                </div>

                {/* RIGHT — tracking */}
                <div className="md:w-1/2 flex justify-end" data-aos="fade-left">
                  <div className="w-full max-w-md bg-white rounded-2xl shadow-2xl p-6 space-y-4">
                    <h2 className="text-xl font-bold text-gray-800 mb-2">
                      🔍 Tra cứu đơn hàng
                    </h2>
                    <p className="text-sm text-gray-500 mb-2">
                      Nhập mã vận đơn để xem lộ trình & trạng thái mới nhất.
                    </p>

                    <div className="flex flex-col gap-3">
                      <input
                        type="text"
                        value={trackingCode}
                        onChange={(e) => setTrackingCode(e.target.value)}
                        placeholder="Ví dụ: SSP123456789"
                        className="w-full border border-gray-200 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-sm"
                      />
                      <button
                        type="button"
                        onClick={handleTrack}
                        className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-3 rounded-xl transition flex items-center justify-center gap-2"
                      >
                        Xem trạng thái
                      </button>
                    </div>

                    <div className="mt-3 border-t pt-3 text-xs text-gray-500 flex items-center justify-between">
                      <span>Hỗ trợ tra cứu 24/7</span>

                      {/* CHAT SUPPORT = HUMAN */}
                      <button
                        onClick={() => setShowChatBubble(true)}
                        className="text-blue-600 hover:underline"
                      >
                        💬 Chat với điều phối viên
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
      {/* ========== WHY SPEEDYSHIP (STATS) ========== */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-6xl mx-auto px-6">
          <h3
            className="text-3xl font-bold text-center mb-10"
            data-aos="fade-up"
          >
            Tại sao nên chọn <span className="text-blue-600">SpeedyShip?</span>
          </h3>

          <div className="grid md:grid-cols-4 gap-6">
            {[
              {
                value: "2–4h",
                label: "Giao nội thành hỏa tốc",
              },
              {
                value: "12–36h",
                label: "Liên tỉnh Bắc–Nam",
              },
              {
                value: "98.7%",
                label: "Đơn giao đúng hẹn",
              },
              {
                value: "24/7",
                label: "Theo dõi & hỗ trợ",
              },
            ].map((item, i) => (
              <div
                key={item.label}
                className="bg-white rounded-2xl shadow-sm p-6 text-center"
                data-aos="zoom-in"
                data-aos-delay={i * 80}
              >
                <p className="text-3xl font-extrabold text-blue-600 mb-2">
                  {item.value}
                </p>
                <p className="text-sm text-gray-600">{item.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ========== SERVICE PLANS ========== */}
      <section className="py-20 bg-white">
        <div className="max-w-6xl mx-auto px-6">
          <h3
            className="text-3xl font-bold text-center mb-4"
            data-aos="fade-up"
          >
            📦 Chọn gói dịch vụ phù hợp
          </h3>
          <p
            className="text-center text-gray-600 mb-10"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            Từ cá nhân đến doanh nghiệp – chúng tôi luôn có gói giao phù hợp.
          </p>

          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                name: "Chuẩn",
                time: "16–72h",
                price: "Từ 15.000đ",
                perks: ["Theo dõi GPS", "COD tận nơi", "Phù hợp shop nhỏ"],
                color: "border-gray-200",
              },
              {
                name: "Nhanh",
                time: "4–12h",
                price: "Từ 35.000đ",
                perks: [
                  "Ưu tiên tuyến",
                  "Thông báo realtime",
                  "Phù hợp sàn TMĐT",
                ],
                color: "border-blue-500 shadow-blue-100 shadow-lg",
                highlight: true,
              },
              {
                name: "Hỏa tốc",
                time: "2–4h",
                price: "Từ 65.000đ",
                perks: [
                  "Tài xế chuyên trách",
                  "Hỗ trợ tối đa giờ cao điểm",
                  "Có bảo hiểm hàng hóa",
                ],
                color: "border-red-500",
              },
            ].map((plan, i) => (
              <div
                key={plan.name}
                className={`p-8 rounded-2xl border-2 bg-white transition hover:-translate-y-1 hover:shadow-xl ${plan.color}`}
                data-aos="zoom-in"
                data-aos-delay={i * 100}
              >
                {plan.highlight && (
                  <p className="inline-block px-3 py-1 mb-4 text-xs font-semibold rounded-full bg-blue-50 text-blue-600">
                    Được chọn nhiều nhất
                  </p>
                )}
                <h4 className="text-2xl font-bold mb-1">{plan.name}</h4>
                <p className="text-sm text-gray-500 mb-3">
                  Thời gian dự kiến: {plan.time}
                </p>
                <p className="text-3xl font-extrabold mb-4 text-blue-600">
                  {plan.price}
                </p>
                <ul className="space-y-2 text-sm text-gray-700 mb-6">
                  {plan.perks.map((p) => (
                    <li key={p}>• {p}</li>
                  ))}
                </ul>
                <button
                  onClick={handleCreateShipment}
                  className={`block w-full text-center py-3 rounded-xl font-semibold ${
                    plan.highlight
                      ? "bg-blue-600 text-white hover:bg-blue-700"
                      : "bg-gray-100 hover:bg-gray-200 text-gray-800"
                  }`}
                >
                  Tạo đơn với gói này
                </button>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ========== AI & REALTIME BLOCK ========== */}
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
              <li>
                • Nhận trạng thái đơn ngay khi hỏi “Đơn SSP123 đang ở đâu?”
              </li>
              <li>
                • Gợi ý gói giao phù hợp với loại hàng & thời gian bạn cần.
              </li>
              <li>• Kết nối ngay điều phối viên khi cần hỗ trợ.</li>
            </ul>
            <button
              type="button"
              onClick={() => setShowChatTop(true)}
              className="px-6 py-3 rounded-xl bg-blue-600 text-white font-semibold hover:bg-blue-700 transition inline-flex items-center gap-2"
            >
              💬 Mở chat AI
            </button>
          </div>

          <div data-aos="fade-left">
            <div className="bg-white rounded-2xl shadow-xl p-6 space-y-4">
              <div className="flex items-center justify-between">
                <p className="text-sm font-semibold text-gray-700">
                  Đơn hàng đang giao hôm nay
                </p>
                <span className="text-xs px-2 py-1 rounded-full bg-green-100 text-green-700">
                  Realtime
                </span>
              </div>

              <p className="text-3xl font-extrabold text-blue-600">3,214</p>
              <p className="text-xs text-gray-500">
                Cập nhật liên tục mỗi vài giây từ hệ thống định vị của tài xế.
              </p>

              <div className="mt-4 h-64 rounded-xl overflow-hidden relative">
                <MapContainer
                  center={driverPos}
                  zoom={13}
                  scrollWheelZoom={true}
                  className="w-full h-full"
                >
                  <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />

                  <FollowView pos={driverPos} />

                  <Marker position={driverPos} icon={driverIcon} />
                </MapContainer>

                {/* overlay giống UI cũ */}
                <div className="pointer-events-none absolute inset-0 bg-blue-900/10" />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ========== TESTIMONIALS ========== */}
      <section className="py-20 bg-white">
        <div className="max-w-6xl mx-auto px-6">
          <h3
            className="text-3xl font-bold text-center mb-10"
            data-aos="fade-up"
          >
            Khách hàng nói gì về{" "}
            <span className="text-blue-600">SpeedyShip</span>?
          </h3>

          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                name: "Shop thời trang LUNA",
                content:
                  "Giao nội thành trong ngày, đơn COD đối soát rõ ràng. Tụi mình đã chuyển hết đơn sang SpeedyShip.",
              },
              {
                name: "Anh Minh – Chủ cửa hàng điện tử",
                content:
                  "Thích nhất là tracking realtime, khách không còn hỏi 'Đơn em đâu rồi?' liên tục nữa.",
              },
              {
                name: "Chị Hương – Chủ cửa hàng bánh",
                content:
                  "Giao bánh tươi cần đúng giờ. Dịch vụ hỏa tốc 2–4h giúp mình yên tâm giao trong nội thành.",
              },
            ].map((t, i) => (
              <div
                key={t.name}
                className="bg-gray-50 rounded-2xl p-6"
                data-aos="fade-up"
                data-aos-delay={i * 100}
              >
                <p className="text-sm text-gray-700 mb-4">“{t.content}”</p>
                <p className="text-sm font-semibold text-gray-900">{t.name}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ========== FINAL CTA ========== */}
      <section className="py-16 bg-gradient-to-r from-blue-600 via-blue-500 to-indigo-600 text-white">
        <div className="max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center justify-between gap-6">
          <div>
            <h3 className="text-3xl md:text-4xl font-bold mb-3">
              Sẵn sàng tăng tốc cùng SpeedyShip?
            </h3>
            <p className="text-sm md:text-base text-blue-100">
              Tạo đơn chỉ mất chưa đến 30 giây. Giao hàng nhanh, minh bạch, hỗ
              trợ tận tâm.
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <Link
              to="/customer/create-shipment"
              className="px-6 py-3 rounded-xl bg-white text-blue-700 font-semibold hover:bg-blue-50 text-center"
            >
              🚀 Tạo đơn ngay
            </Link>
            <button
              type="button"
              onClick={() => setShowChatTop(true)}
              className="px-6 py-3 rounded-xl border border-white/60 text-white font-semibold hover:bg-white/10 text-center"
            >
              💬 Chat tư vấn
            </button>
          </div>
        </div>
      </section>

      {/* ========== POPUP CHAT (REALTIME + AI) ========== */}
      {showChatBubble && (
        <ChatBubble onClose={() => setShowChatBubble(false)} />
      )}

      {showChatTop && (
        <ChatPopupTop
          onClose={() => setShowChatTop(false)}
          bubbleOpen={showChatBubble}
        />
      )}

      {/* FLOATING ACTION BUTTONS */}
      <FloatingActions
        onOpenChatBubble={() => setShowChatBubble(true)}
        onOpenChatTop={() => setShowChatTop(true)}
      />
    </>
  );
}
