import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Pagination, Navigation, EffectFade } from "swiper/modules";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom"; // Bỏ Link vì dùng navigate trong hàm
import axios from "axios";
import TrackingMiniPanel from "./TrackingMiniPanel";
import { motion } from "framer-motion"; // Import Animation
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"; // Import FontAwesome
import { faRocket, faRobot } from "@fortawesome/free-solid-svg-icons"; // Import Icons

import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import "swiper/css/effect-fade";

import { useChat } from "../../hooks/useChat.js";

export default function HeroBanner() {
  const navigate = useNavigate();

  const { openAIChat, openSupportChat } = useChat();

  // TRACKING STATE
  const [trackingCode, setTrackingCode] = useState("");
  const [shipment, setShipment] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [swiperRef, setSwiperRef] = useState(null);

  const getStatusDisplay = (status) => {
    switch (status) {
      case "pending":
        return { text: "Chờ xử lý", color: "text-yellow-600 font-semibold" };
      case "assigned":
        return { text: "Đã phân công", color: "text-orange-600 font-semibold" };
      case "picking":
        return { text: "Đang lấy hàng", color: "text-blue-600 font-semibold" };
      case "delivering":
        return { text: "Đang giao hàng", color: "text-blue-600 font-semibold" };
      case "completed":
        return { text: "Hoàn tất", color: "text-green-600 font-semibold" };
      case "cancelled":
        return { text: "Đã hủy", color: "text-red-600 font-semibold" };
      default:
        return { text: "Không xác định", color: "text-gray-500 font-medium" };
    }
  };

  useEffect(() => {
    if (swiperRef) {
      if (shipment || loading) {
        swiperRef.autoplay.stop();
      } else {
        swiperRef.autoplay.start();
      }
    }
  }, [shipment, loading, swiperRef]);

  useEffect(() => {
    if (!swiperRef) return;
    if (trackingCode.trim().length > 0) swiperRef.autoplay.stop();
  }, [trackingCode, swiperRef]);

  const handleTrack = async () => {
    if (!trackingCode.trim()) return;

    setLoading(true);
    setError(null);
    setShipment(null);

    try {
      const res = await axios.get(
        `http://localhost:5000/api/shipments/code/${trackingCode.trim()}`
      );
      setShipment(res.data);
    } catch (err) {
      setError("Không tìm thấy đơn hàng!");
    } finally {
      setLoading(false);
    }
  };

  // Giữ nguyên logic của bạn
  const handleCreateShipment = () => {
    const role = localStorage.getItem("role");
    if (!role || role !== "customer") return navigate("/login");
    return navigate("/customer/create");
  };

  return (
    <section className="relative min-h-[70vh] md:min-h-[80vh]">
      <Swiper
        centeredSlides
        loop
        effect="fade"
        autoplay={{ delay: 4000, disableOnInteraction: false }}
        onSwiper={setSwiperRef}
        pagination={{ clickable: true }}
        navigation
        modules={[Autoplay, Pagination, Navigation, EffectFade]}
        className="h-full"
      >
        {/* SLIDE 1 */}
        <SwiperSlide>
          <section className="relative w-full aspect-[21/9] bg-black overflow-hidden flex items-center">
            {/* BACKGROUND */}
            <img
              src="/assets/banners/banner1.png"
              className="absolute inset-0 w-full h-full object-contain object-left"
              alt="Banner"
            />

            {/* OVERLAY */}
            <div className="absolute inset-0 bg-gradient-to-r from-black/20 via-black/10 to-transparent" />

            <div className="relative z-30 w-full bottom-[20%] flex flex-col items-center text-center px-6">
              <p className="uppercase tracking-[0.3em] text-base text-blue-200">
                SpeedyShip Logistics
              </p>

              <h1 className="text-4xl md:text-6xl font-extrabold leading-tight max-w-3xl text-white drop-shadow-[0_4px_12px_rgba(0,0,0,0.45)]">
                Giao Nhanh, <span className="text-blue-400">Đúng Hẹn</span>,
                Theo Dõi Trực Tuyến.
              </h1>

              <p className="text-white text-lg max-w-lg mt-3">
                Tạo đơn trong vài giây — Theo dõi hành trình từng Km — Cập nhật
                trạng thái realtime.
              </p>

              {/* --- BUTTONS SECTION (Đã sửa lại giao diện nhưng giữ nguyên hàm onClick) --- */}
              <div className="flex flex-col sm:flex-row gap-4 mt-8">
                {/* BUTTON 1: TẠO ĐƠN NGAY */}
                <motion.div
                  initial={{ opacity: 0, x: -50 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{
                    type: "spring",
                    stiffness: 260,
                    damping: 20,
                    delay: 0.2,
                  }}
                >
                  <button
                    onClick={handleCreateShipment} // <--- GIỮ NGUYÊN HÀM CỦA BẠN
                    className="
                      relative overflow-hidden group
                      px-8 py-3.5 rounded-full
                      bg-[#113e48] text-white
                      font-bold text-lg uppercase tracking-wide
                      shadow-[0_10px_25px_rgba(17,62,72,0.4)]
                      hover:bg-orange-500 hover:shadow-orange-500/40
                      hover:-translate-y-1
                      transition-all duration-300
                      flex items-center gap-3
                    "
                  >
                    <span className="relative z-10 flex items-center gap-2">
                      <FontAwesomeIcon icon={faRocket} />
                      Tạo đơn ngay
                    </span>

                    {/* Hiệu ứng Shine Lướt sáng */}
                    <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-0"></div>
                  </button>
                </motion.div>

                {/* BUTTON 2: HỎI AI TƯ VẤN */}
                <motion.div
                  initial={{ opacity: 0, x: 50 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{
                    type: "spring",
                    stiffness: 260,
                    damping: 20,
                    delay: 0.3,
                  }}
                >
                  <button
                    onClick={openAIChat} // <--- GIỮ NGUYÊN HÀM CỦA BẠN
                    className="
                      relative overflow-hidden group
                      px-8 py-3.5 rounded-full
                      bg-white/10 backdrop-blur-md border border-white/30
                      text-white
                      font-bold text-lg
                      shadow-[0_10px_25px_rgba(0,0,0,0.1)]
                      hover:bg-white hover:text-[#113e48] hover:border-white
                      hover:-translate-y-1
                      transition-all duration-300
                      flex items-center gap-3
                    "
                  >
                    <span className="relative z-10 flex items-center gap-2">
                      <FontAwesomeIcon
                        icon={faRobot}
                        className="text-orange-400 group-hover:text-[#113e48] transition-colors"
                      />
                      Hỏi AI tư vấn
                    </span>

                    {/* Hiệu ứng Shine Lướt sáng */}
                    <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-0"></div>
                  </button>
                </motion.div>
              </div>
              {/* --- END BUTTONS --- */}

              {/* STATS */}
              <div className="flex gap-10 text-sm text-gray-200 mt-8">
                <div className="text-center">
                  <p className="font-bold text-lg text-white">2–4 giờ</p>
                  <p className="text-white/70">Nội thành hỏa tốc</p>
                </div>
                <div className="text-center">
                  <p className="font-bold text-lg text-white">98.7%</p>
                  <p className="text-white/70">Đơn đúng hẹn</p>
                </div>
                <div className="text-center">
                  <p className="font-bold text-lg text-white">+10.000</p>
                  <p className="text-white/70">Đơn mỗi tháng</p>
                </div>
              </div>
            </div>

            {/* TRACKING FORM — DƯỚI */}
            <div className="absolute left-1/2 bottom-[6%] -translate-x-1/2 z-40">
              <TrackingMiniPanel
                trackingCode={trackingCode}
                setTrackingCode={setTrackingCode}
                shipment={shipment}
                loading={loading}
                error={error}
                handleTrack={handleTrack}
                getStatusDisplay={getStatusDisplay}
              />
            </div>
          </section>
        </SwiperSlide>

        {/* Slide 2 - Mua sắm thả ga... */}
        <SwiperSlide>
          <section className="relative w-full aspect-[21/9] bg-black overflow-hidden flex items-center">
            {/* BACKGROUND */}
            <img
              src="/assets/banners/banner2.png"
              alt="SpeedyShip quốc tế"
              className="absolute inset-0 w-full h-full object-cover"
            />

            {/* OVERLAY tăng contrast chữ */}
            <div className="absolute inset-0 bg-gradient-to-r from-black/20 via-black/10 to-transparent" />

            {/* GLASS CARD BÊN PHẢI */}
            <div
              className="
    absolute right-[1%]  bottom-[50%] right-2 -translate-y-1/2
    w-[420px]
    bg-gradient-to-b from-white/65 via-white/20 to-white/5
    backdrop-blur-2xl
    border border-white/30
    rounded-3xl
    shadow-[0_20px_60px_rgba(0,0,0,0.35)]
    p-8
    z-30
    space-y-6
    text-white
  "
            >
              <h1
                className="text-3xl md:text-4xl font-extrabold leading-tight text-white
        drop-shadow-[0_4px_12px_rgba(0,0,0,0.35)]"
              >
                Mua sắm thả ga
                <br />
                <span className="text-blue-400">SpeedyShip giao tận nhà</span>
              </h1>

              <p className="text-white font-extrabold text-lg leading-relaxed ">
                Giao trọn niềm tin — Nhận ngàn uy tín
              </p>
            </div>
          </section>
        </SwiperSlide>

        {/* Slide 3 —  Giao hàng trong nước */}
        <SwiperSlide>
          <section className="relative w-full aspect-[21/9] overflow-hidden flex items-center">
            {/* BACKGROUND */}
            <img
              src="/assets/banners/banner3.png"
              className="absolute inset-0 w-full h-full object-cover"
              alt="SpeedyShip Nội Địa"
            />

            {/* GLASS CARD */}
            <div
              className="
              absolute left-[5%] bottom-[10%]
              w-[480px]    
              rounded-3xl p-8 space-y-6 text-white z-30

              bg-gradient-to-b from-white/60 via-white/20 to-white/5
              backdrop-blur-2xl
              border border-white/30
              shadow-[0_20px_60px_rgba(0,0,0,0.35)]
            "
            >
              <h2
                className="text-3xl md:text-4xl font-extrabold leading-tight text-white
        drop-shadow-[0_4px_12px_rgba(0,0,0,0.35)]"
              >
                Giao Nhanh Từng Chặng
                <br />
                <span className="text-blue-600 font-extrabold leading-tight drop-shadow-[0_4px_12px_rgba(0,0,0,0.35)">
                  {" "}
                  Theo Dõi Từng Km.
                </span>
              </h2>

              <p className=" text-base  font-extrabold  text-white leading-tight">
                Ship nội thành & liên tỉnh — cập nhật trạng thái từng chặng — hỗ
                trợ 24/7.
              </p>
            </div>
          </section>
        </SwiperSlide>

        {/* Slide 4 - Bảng giá dịch vụ */}
        <SwiperSlide>
          <section className="relative w-full aspect-[21/9] overflow-hidden flex items-center">
            {/* BACKGROUND */}
            <img
              src="/assets/banners/banner4.png"
              alt="SpeedyShip Nội Tỉnh"
              className="absolute inset-0 w-full h-full object-cover"
            />

            {/* OVERLAY (tăng chiều sâu – dễ đọc text) */}
            <div className="absolute inset-0 bg-gradient-to-r from-black/20 via-black/10 to-transparent" />

            {/* BOARD CONTENT (khung billboard bên trái 👇) */}
            <div className="absolute left-[6%] top-1/2 -translate-y-1/2 z-20"></div>
            <div
              className="
    absolute  top-[18%] right-[28%] -translate-y-1/2
    w-[300px]
    bg-gradient-to-b from-white/65 via-white/20 to-white/5
    backdrop-blur-2xl
    border border-white/30
    rounded-3xl
    shadow-[0_20px_60px_rgba(0,0,0,0.35)]
    p-6
    z-30
    space-y-2
    text-white
  "
            >
              <h1
                className="text-2xl md:text-3xl font-extrabold leading-tight text-white
        drop-shadow-[0_4px_12px_rgba(0,0,0,0.35)]"
              >
                Ship Hàng Thả Ga, Giá Chỉ Từ 15k!
              </h1>

              <p className="text-white text-lg font-extrabold leading-tight ">
                Giá rẻ bất ngờ — Chốt đơn ngay chờ chi
              </p>
            </div>
          </section>
        </SwiperSlide>

        {/* Slide 5 - Cam kết an tâm*/}
        <SwiperSlide>
          <section className="relative w-full aspect-[21/9] bg-black overflow-hidden flex items-center">
            {/* BACKGROUND */}
            <img
              src="/assets/banners/banner5.png"
              alt="Dịch vụ hoàn cước SpeedyShip"
              className="absolute inset-0 w-full h-full object-cover"
            />

            {/* GLASS CARD bên trái */}
            <div
              className="
    absolute right-[1%]  top-[13%] left-[25%] -translate-y-1/2
    w-[340px]
    bg-gradient-to-b from-white/65 via-white/20 to-white/5
    backdrop-blur-2xl
    border border-white/30
    rounded-3xl
    shadow-[0_20px_60px_rgba(0,0,0,0.35)]
    p-6
    z-30
    space-y-4
    text-white
  "
            >
              <h1
                className="text-2xl md:text-3xl font-extrabold leading-tight text-blue-400
        drop-shadow-[0_4px_12px_rgba(0,0,0,0.35)]"
              >
                Gửi Trọn Niềm Tin!
              </h1>

              <p className="text-gray-700  text-lg font-extrabold leading-tight">
                Bảo đảm quyền lợi khách hàng.
              </p>
            </div>
          </section>
        </SwiperSlide>
      </Swiper>
    </section>
  );
}
