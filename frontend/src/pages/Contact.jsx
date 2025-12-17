import { useEffect, useState } from "react";
import AOS from "aos";
import "aos/dist/aos.css";
import { MapContainer, TileLayer, Marker, Popup, useMap } from "react-leaflet";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import API from "../services/api";
import toast, { Toaster } from "react-hot-toast";
import {
  FaMapMarkerAlt,
  FaPhoneAlt,
  FaEnvelope,
  FaClock,
  FaPaperPlane,
} from "react-icons/fa";

// 🗺️ Icon marker văn phòng (Custom Marker đẹp hơn)
const officeIcon = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/684/684908.png", // Bạn có thể thay bằng icon logo cty nếu có
  iconSize: [40, 40],
  iconAnchor: [20, 40],
  popupAnchor: [0, -40],
});

function ZoomToOffice() {
  const map = useMap();
  useEffect(() => {
    map.setView([16.0544, 108.2022], 14, { animate: true });
  }, [map]);
  return null;
}

export default function Contact() {
  const [form, setForm] = useState({
    name: "",
    email: "",
    phone: "",
    message: "",
  });

  const [loading, setLoading] = useState(false);

  useEffect(() => {
    AOS.init({ duration: 800, once: true });
  }, []);

  const handleChange = (e) =>
    setForm({ ...form, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      await API.post("/contact", form);
      toast.success("✅ Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ.");
      setForm({ name: "", email: "", phone: "", message: "" });
    } catch {
      toast.error("❌ Không thể gửi yêu cầu, vui lòng thử lại sau!");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="font-sans bg-gray-50">
      <Toaster position="top-center" />

      {/* 1. HERO HEADER: Xanh đậm + Cam */}
      <section className="pt-32 pb-20 bg-[#113e48] text-white text-center relative overflow-hidden">
        {/* Background Pattern */}
        <div className="absolute inset-0 opacity-10 pointer-events-none">
          <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
            <pattern
              id="grid-pattern"
              width="40"
              height="40"
              patternUnits="userSpaceOnUse"
            >
              <path
                d="M0 40L40 0H20L0 20M40 40V20L20 40"
                stroke="currentColor"
                strokeWidth="1"
                fill="none"
              />
            </pattern>
            <rect width="100%" height="100%" fill="url(#grid-pattern)" />
          </svg>
        </div>

        <div className="relative z-10 px-6">
          <span
            className="text-orange-500 font-bold uppercase tracking-widest text-sm mb-4 block"
            data-aos="fade-down"
          >
            Hỗ trợ 24/7
          </span>
          <h2
            className="text-4xl md:text-5xl font-extrabold mb-6"
            data-aos="fade-up"
          >
            Liên hệ & Hỗ trợ
          </h2>
          <p
            className="text-gray-300 max-w-2xl mx-auto text-lg leading-relaxed"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            SpeedyShip Đà Nẵng luôn sẵn sàng lắng nghe và hỗ trợ bạn mọi lúc mọi
            nơi. Hãy để lại lời nhắn, chúng tôi sẽ phản hồi ngay lập tức.
          </p>
        </div>
      </section>

      {/* 2. MAIN SECTION: Info & Form */}
      <section className="max-w-7xl mx-auto py-20 px-6 grid lg:grid-cols-2 gap-12 -mt-10 relative z-20">
        {/* LEFT: THÔNG TIN LIÊN HỆ & BẢN ĐỒ */}
        <div
          data-aos="fade-right"
          className="bg-white p-8 rounded-2xl shadow-xl shadow-[#113e48]/5 border border-gray-100 h-full flex flex-col"
        >
          <h3 className="text-2xl font-bold mb-8 text-[#113e48] flex items-center gap-3">
            <span className="w-2 h-8 bg-orange-500 rounded-full"></span>
            Thông tin liên hệ
          </h3>

          <div className="space-y-6 mb-8 text-gray-600">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-blue-50 text-blue-600 rounded-full flex items-center justify-center text-lg shrink-0">
                <FaMapMarkerAlt />
              </div>
              <div>
                <h4 className="font-bold text-[#113e48]">Văn phòng chính</h4>
                <p>55 Nguyễn Văn Linh, Quận Hải Châu, TP. Đà Nẵng</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-orange-50 text-orange-600 rounded-full flex items-center justify-center text-lg shrink-0">
                <FaPhoneAlt />
              </div>
              <div>
                <h4 className="font-bold text-[#113e48]">Hotline hỗ trợ</h4>
                <p className="text-lg font-bold text-orange-600">
                  1900 888 999
                </p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-green-50 text-green-600 rounded-full flex items-center justify-center text-lg shrink-0">
                <FaEnvelope />
              </div>
              <div>
                <h4 className="font-bold text-[#113e48]">Email</h4>
                <p>support@speedyship.com</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-gray-100 text-gray-600 rounded-full flex items-center justify-center text-lg shrink-0">
                <FaClock />
              </div>
              <div>
                <h4 className="font-bold text-[#113e48]">Giờ làm việc</h4>
                <p>Thứ 2 - Thứ 7 (8:00 - 18:00)</p>
              </div>
            </div>
          </div>

          {/* Bản đồ Leaflet */}
          <div className="rounded-xl shadow-inner overflow-hidden h-[300px] border border-gray-200 mt-auto">
            <MapContainer
              center={[16.0544, 108.2022]}
              zoom={13}
              scrollWheelZoom={false}
              style={{ height: "100%", width: "100%" }}
            >
              <TileLayer
                attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              />
              <Marker position={[16.0544, 108.2022]} icon={officeIcon}>
                <Popup>
                  <div className="text-center">
                    <strong className="text-orange-600">
                      SpeedyShip Đà Nẵng
                    </strong>
                    <br />
                    55 Nguyễn Văn Linh
                  </div>
                </Popup>
              </Marker>
              <ZoomToOffice />
            </MapContainer>
          </div>
        </div>

        {/* RIGHT: FORM LIÊN HỆ */}
        <div
          data-aos="fade-left"
          className="bg-white p-8 md:p-10 rounded-2xl shadow-xl shadow-[#113e48]/5 border border-gray-100"
        >
          <h3 className="text-2xl font-bold mb-2 text-[#113e48]">
            ✉️ Gửi thắc mắc cho chúng tôi
          </h3>
          <p className="text-gray-500 mb-8">
            Nếu bạn có câu hỏi hoặc cần tư vấn dịch vụ, vui lòng điền vào biểu
            mẫu dưới đây.
          </p>

          <form className="space-y-5" onSubmit={handleSubmit}>
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Họ và tên *
              </label>
              <input
                type="text"
                name="name"
                value={form.name}
                onChange={handleChange}
                placeholder="Nhập tên của bạn..."
                className="w-full border border-gray-200 bg-gray-50 p-3.5 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500/20 focus:border-orange-500 transition-all"
                required
              />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">
                  Email *
                </label>
                <input
                  type="email"
                  name="email"
                  value={form.email}
                  onChange={handleChange}
                  placeholder="example@email.com"
                  className="w-full border border-gray-200 bg-gray-50 p-3.5 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500/20 focus:border-orange-500 transition-all"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">
                  Số điện thoại
                </label>
                <input
                  type="tel"
                  name="phone"
                  value={form.phone}
                  onChange={handleChange}
                  placeholder="0905..."
                  className="w-full border border-gray-200 bg-gray-50 p-3.5 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500/20 focus:border-orange-500 transition-all"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Nội dung tin nhắn *
              </label>
              <textarea
                rows="5"
                name="message"
                value={form.message}
                onChange={handleChange}
                placeholder="Bạn cần hỗ trợ vấn đề gì?..."
                className="w-full border border-gray-200 bg-gray-50 p-3.5 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500/20 focus:border-orange-500 transition-all resize-none"
                required
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className={`w-full bg-[#113e48] hover:bg-orange-500 text-white py-4 rounded-xl font-bold uppercase tracking-wide transition-all shadow-lg hover:shadow-orange-500/30 flex items-center justify-center gap-2 transform hover:-translate-y-1
              ${loading ? "opacity-70 cursor-not-allowed" : ""}`}
            >
              {loading ? (
                "Đang gửi..."
              ) : (
                <>
                  <FaPaperPlane /> Gửi yêu cầu ngay
                </>
              )}
            </button>
          </form>
        </div>
      </section>

      {/* 3. FOOTER CTA: Nhẹ nhàng hơn */}
      <section className="bg-white py-16 border-t border-gray-100 text-center">
        <div className="max-w-4xl mx-auto px-6" data-aos="fade-up">
          <h4 className="text-2xl font-bold mb-4 text-[#113e48]">
            Vẫn chưa tìm thấy câu trả lời?
          </h4>
          <p className="text-gray-500 mb-8 max-w-xl mx-auto">
            Đừng ngần ngại liên hệ trực tiếp với tổng đài hoặc gửi email cho bộ
            phận hỗ trợ khách hàng của chúng tôi.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="tel:1900888999"
              className="inline-flex items-center justify-center gap-2 bg-orange-100 text-orange-600 px-8 py-3 rounded-full font-bold hover:bg-orange-200 transition"
            >
              <FaPhoneAlt /> Gọi 1900 888 999
            </a>
            <a
              href="mailto:support@speedyship.com"
              className="inline-flex items-center justify-center gap-2 bg-gray-100 text-gray-700 px-8 py-3 rounded-full font-bold hover:bg-gray-200 transition"
            >
              <FaEnvelope /> support@speedyship.com
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}
