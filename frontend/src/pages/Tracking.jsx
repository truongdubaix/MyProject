import { useState, useEffect } from "react";
import { useSearchParams, Link } from "react-router-dom";
import API from "../services/api";
import {
  MapContainer,
  TileLayer,
  Marker,
  Popup,
  Polyline,
  useMap,
} from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import AOS from "aos";
import "aos/dist/aos.css";
import {
  FaSearch,
  FaBoxOpen,
  FaMapMarkerAlt,
  FaPhoneAlt,
  FaCalendarAlt,
  FaTruck,
  FaCheckCircle,
  FaTimesCircle,
  FaClock,
} from "react-icons/fa";

// --- CẤU HÌNH ICON MAP ---
const iconDriver = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
  iconSize: [45, 45],
  iconAnchor: [22, 45],
  popupAnchor: [0, -40],
});

const iconPickup = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/2991/2991112.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
  popupAnchor: [0, -35],
});

const iconDelivery = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/235/235861.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
  popupAnchor: [0, -35],
});

// Component Zoom tự động
function FitBounds({ points }) {
  const map = useMap();
  useEffect(() => {
    if (points.length > 1) map.fitBounds(points, { padding: [80, 80] });
  }, [points]);
  return null;
}

export default function Tracking() {
  const [searchParams] = useSearchParams();
  const initialCode = searchParams.get("code") || "";

  const [code, setCode] = useState(initialCode);
  const [last4, setLast4] = useState("");
  const [shipment, setShipment] = useState(null);

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);
  const [driverPos, setDriverPos] = useState(null);

  useEffect(() => {
    AOS.init({ duration: 800, once: true });
    window.scrollTo(0, 0);
  }, []);

  useEffect(() => {
    if (initialCode) handleSearch();
  }, [initialCode]);

  // --- HÀM XỬ LÝ TRẠNG THÁI TIẾNG VIỆT & MÀU SẮC ---
  const getStatusInfo = (status) => {
    if (!status)
      return {
        text: "Không xác định",
        color: "text-gray-500",
        bg: "bg-gray-100",
        icon: <FaClock />,
      };

    const s = status.toLowerCase();

    if (
      s.includes("pending") ||
      s.includes("created") ||
      s === "chờ lấy hàng"
    ) {
      return {
        text: "Đang chờ lấy hàng",
        color: "text-blue-600",
        bg: "bg-blue-50",
        icon: <FaClock />,
      };
    }
    if (s.includes("picked") || s.includes("taking") || s === "đã lấy hàng") {
      return {
        text: "Đã lấy hàng",
        color: "text-indigo-600",
        bg: "bg-indigo-50",
        icon: <FaBoxOpen />,
      };
    }
    if (
      s.includes("transit") ||
      s.includes("shipping") ||
      s === "đang vận chuyển"
    ) {
      return {
        text: "Đang vận chuyển",
        color: "text-orange-500",
        bg: "bg-orange-50",
        icon: <FaTruck />,
      };
    }
    if (
      s.includes("delivered") ||
      s.includes("success") ||
      s.includes("completed") ||
      s === "giao hàng thành công"
    ) {
      return {
        text: "Giao hàng thành công",
        color: "text-green-600",
        bg: "bg-green-50",
        icon: <FaCheckCircle />,
      };
    }
    if (s.includes("cancel") || s === "đã hủy") {
      return {
        text: "Đã hủy",
        color: "text-red-600",
        bg: "bg-red-50",
        icon: <FaTimesCircle />,
      };
    }
    if (s.includes("return") || s === "trả hàng") {
      return {
        text: "Đang hoàn hàng",
        color: "text-yellow-600",
        bg: "bg-yellow-50",
        icon: <FaTruck />,
      };
    }

    return {
      text: status,
      color: "text-[#113e48]",
      bg: "bg-gray-100",
      icon: <FaBoxOpen />,
    };
  };

  const handleSearch = async () => {
    setError("");
    setSuccess("");
    setShipment(null);

    if (!code.trim()) {
      setError("⚠️ Vui lòng nhập mã vận đơn!");
      return;
    }

    const customerId = localStorage.getItem("customer_id");
    setLoading(true);

    try {
      let url = `/customers/track/${code.trim()}`;

      if (customerId) {
        url += `?customer_id=${customerId}`;
      } else {
        if (!last4 || last4.length !== 4) {
          setError("⚠️ Vui lòng nhập 4 số cuối SĐT người nhận!");
          setLoading(false);
          return;
        }
        url += `?last4=${last4.trim()}`;
      }

      const res = await API.get(url);

      if (!res.data) {
        setError("❌ Không tìm thấy đơn hàng!");
        return;
      }

      setShipment(res.data);
      setSuccess("✅ Tra cứu thành công!");
    } catch (err) {
      setError("❌ Mã vận đơn không hợp lệ hoặc không có quyền!");
    } finally {
      setLoading(false);
    }
  };

  const pickup =
    shipment?.pickup_lat && shipment?.pickup_lng
      ? [Number(shipment.pickup_lat), Number(shipment.pickup_lng)]
      : [16.0471, 108.2068];
  const delivery =
    shipment?.delivery_lat && shipment?.delivery_lng
      ? [Number(shipment.delivery_lat), Number(shipment.delivery_lng)]
      : [10.7769, 106.7009];
  const routePoints = [pickup, delivery];

  useEffect(() => {
    if (!shipment) return;
    let progress = 0;
    const interval = setInterval(() => {
      progress += 0.005;
      if (progress > 1) progress = 0;
      const lat = pickup[0] + (delivery[0] - pickup[0]) * progress;
      const lng = pickup[1] + (delivery[1] - pickup[1]) * progress;
      setDriverPos([lat, lng]);
    }, 100);
    return () => clearInterval(interval);
  }, [shipment]);

  const statusInfo = shipment ? getStatusInfo(shipment.status) : null;

  return (
    <div className="font-sans bg-slate-50 min-h-screen text-slate-700">
      {/* 1. HERO SECTION */}
      <section className="relative pt-24 pb-32 bg-[#113e48] text-white overflow-hidden">
        <div
          className="absolute inset-0 opacity-10"
          style={{
            backgroundImage: "radial-gradient(#ffffff 1px, transparent 1px)",
            backgroundSize: "30px 30px",
          }}
        ></div>

        <div className="relative z-10 max-w-4xl mx-auto px-6 text-center">
          <span
            className="inline-block py-1.5 px-4 rounded-full bg-white/10 border border-white/20 text-orange-400 text-sm font-bold mb-6 uppercase tracking-wider backdrop-blur-md"
            data-aos="fade-down"
          >
            Realtime Tracking System
          </span>
          <h1
            className="text-3xl md:text-5xl font-extrabold mb-4"
            data-aos="fade-up"
          >
            Tra Cứu Hành Trình Đơn Hàng
          </h1>
          <p
            className="text-blue-100 text-lg mb-8"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            Theo dõi vị trí thực tế và trạng thái đơn hàng của bạn mọi lúc, mọi
            nơi.
          </p>
        </div>
      </section>

      {/* 2. SEARCH BAR */}
      <section className="-mt-16 relative z-20 px-6">
        <div
          className="max-w-3xl mx-auto bg-white p-6 rounded-3xl shadow-xl border border-gray-100"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <div className="grid grid-cols-1 md:grid-cols-12 gap-4">
            <div className="md:col-span-5 relative">
              <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <FaBoxOpen className="text-gray-400" />
              </div>
              <input
                value={code}
                onChange={(e) => setCode(e.target.value.toUpperCase())}
                placeholder="Mã vận đơn (VD: SP123)"
                className="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500 font-bold text-gray-700"
              />
            </div>

            {!localStorage.getItem("role") && (
              <div className="md:col-span-4 relative">
                <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <FaPhoneAlt className="text-gray-400" />
                </div>
                <input
                  value={last4}
                  onChange={(e) => setLast4(e.target.value.replace(/\D/g, ""))}
                  maxLength={4}
                  placeholder="4 số cuối SĐT nhận"
                  className="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-orange-500 font-bold text-gray-700"
                />
              </div>
            )}

            <div
              className={`${
                !localStorage.getItem("role")
                  ? "md:col-span-3"
                  : "md:col-span-7"
              }`}
            >
              <button
                onClick={handleSearch}
                disabled={loading}
                className={`w-full h-full py-3 rounded-xl font-bold text-white shadow-lg transition-all flex items-center justify-center gap-2
                  ${
                    loading
                      ? "bg-gray-400 cursor-not-allowed"
                      : "bg-gradient-to-r from-orange-500 to-red-500 hover:shadow-orange-500/30 hover:-translate-y-1"
                  }`}
              >
                {loading ? (
                  "Đang xử lý..."
                ) : (
                  <>
                    <FaSearch /> Tra cứu ngay
                  </>
                )}
              </button>
            </div>
          </div>

          {error && (
            <div className="mt-4 p-3 bg-red-50 text-red-600 rounded-lg text-sm font-medium flex items-center gap-2 animate-pulse">
              ⚠️ {error}
            </div>
          )}
          {success && (
            <div className="mt-4 p-3 bg-green-50 text-green-600 rounded-lg text-sm font-medium flex items-center gap-2">
              ✅ {success}
            </div>
          )}
        </div>
      </section>

      {/* 3. RESULT SECTION */}
      {shipment && statusInfo && (
        <section className="py-16 px-6 max-w-7xl mx-auto">
          <div className="grid lg:grid-cols-3 gap-8">
            {/* Cột trái: Thông tin chi tiết */}
            <div className="lg:col-span-1 space-y-6" data-aos="fade-right">
              {/* Card trạng thái */}
              <div
                className={`p-6 rounded-3xl shadow-lg border-l-8 ${
                  statusInfo.bg
                } border-l-[${statusInfo.color.split("-")[1]}-500]`}
              >
                <h3 className="text-gray-500 text-sm font-bold uppercase mb-2">
                  Trạng thái hiện tại
                </h3>
                <div
                  className={`flex items-center gap-3 text-2xl font-black ${statusInfo.color}`}
                >
                  {statusInfo.icon}
                  <span>{statusInfo.text}</span>
                </div>
                <p className="text-sm text-gray-500 mt-3 flex items-center gap-1">
                  <FaCalendarAlt /> Cập nhật:{" "}
                  {new Date(shipment.created_at).toLocaleString("vi-VN")}
                </p>
              </div>

              {/* Card thông tin chi tiết */}
              <div className="bg-white p-6 rounded-3xl shadow-lg border border-gray-100">
                <h3 className="text-lg font-bold text-[#113e48] mb-4 flex items-center gap-2">
                  <FaBoxOpen className="text-orange-500" /> Thông tin kiện hàng
                </h3>
                <div className="space-y-4">
                  <div className="flex justify-between border-b border-gray-100 pb-2">
                    <span className="text-gray-500 text-sm">Mã đơn</span>
                    <span className="font-bold text-[#113e48]">
                      {shipment.tracking_code}
                    </span>
                  </div>
                  <div className="flex justify-between border-b border-gray-100 pb-2">
                    <span className="text-gray-500 text-sm">Người gửi</span>
                    <span className="font-bold text-[#113e48]">
                      {shipment.sender_name}
                    </span>
                  </div>
                  <div className="flex justify-between border-b border-gray-100 pb-2">
                    <span className="text-gray-500 text-sm">Người nhận</span>
                    <span className="font-bold text-[#113e48]">
                      {shipment.receiver_name}
                    </span>
                  </div>
                  {/* --- PHẦN TIỀN COD ĐÃ SỬA --- */}
                  <div className="flex justify-between items-center border-b border-gray-100 pb-2">
                    <span className="text-gray-500 text-sm">Thu hộ (COD)</span>
                    <span className="font-bold text-green-600 bg-green-50 px-2 py-1 rounded-md">
                      {parseInt(shipment.cod_amount || 0).toLocaleString(
                        "vi-VN"
                      )}{" "}
                      VNĐ
                    </span>
                  </div>
                  {/* --------------------------- */}
                </div>

                <div className="mt-6 pt-4 border-t border-gray-100">
                  <h4 className="font-bold text-gray-700 mb-2 flex items-center gap-2 text-sm">
                    <FaMapMarkerAlt className="text-red-500" /> Địa chỉ nhận
                    hàng
                  </h4>
                  <p className="text-gray-600 text-sm leading-relaxed bg-gray-50 p-3 rounded-xl">
                    {shipment.delivery_address}
                  </p>
                </div>
              </div>
            </div>

            {/* Cột phải: Bản đồ */}
            <div className="lg:col-span-2" data-aos="fade-left">
              <div className="bg-white p-2 rounded-3xl shadow-xl border border-gray-200 h-[600px] relative z-0">
                <MapContainer
                  center={pickup}
                  zoom={6}
                  style={{
                    height: "100%",
                    width: "100%",
                    borderRadius: "1.5rem",
                  }}
                  scrollWheelZoom={false}
                >
                  <TileLayer
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    attribution="&copy; OpenStreetMap"
                  />
                  <Marker position={pickup} icon={iconPickup}>
                    <Popup className="font-sans font-bold">
                      📦 Điểm lấy hàng
                    </Popup>
                  </Marker>
                  <Marker position={delivery} icon={iconDelivery}>
                    <Popup className="font-sans font-bold">
                      🏠 Điểm giao hàng
                    </Popup>
                  </Marker>
                  {driverPos && (
                    <Marker position={driverPos} icon={iconDriver}>
                      <Popup className="font-sans">
                        <div className="text-center">
                          <b>Đang vận chuyển</b>
                          <br />
                          <span className="text-xs text-gray-500">
                            Tốc độ: 60km/h
                          </span>
                        </div>
                      </Popup>
                    </Marker>
                  )}
                  <Polyline
                    positions={routePoints}
                    pathOptions={{
                      color: "#f97316",
                      weight: 5,
                      opacity: 0.8,
                      dashArray: "10, 10",
                    }}
                  />
                  <FitBounds points={routePoints} />
                </MapContainer>

                <div className="absolute bottom-6 left-6 z-[1000] bg-white/90 backdrop-blur-sm p-4 rounded-2xl shadow-lg max-w-xs">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                      <FaTruck />
                    </div>
                    <div>
                      <p className="text-xs text-gray-500 font-bold uppercase">
                        Dự kiến giao
                      </p>
                      <p className="font-bold text-[#113e48]">
                        Trong ngày hôm nay
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      )}

      {/* 4. FOOTER CTA */}
      <section className="py-20 bg-white border-t border-gray-100 mt-10">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-2xl font-bold text-[#113e48] mb-4">
            Cần hỗ trợ về đơn hàng này?
          </h2>
          <p className="text-gray-500 mb-8">
            Nếu có bất kỳ vấn đề gì về lộ trình hoặc thời gian giao hàng, vui
            lòng liên hệ CSKH.
          </p>
          <div className="flex justify-center gap-4">
            <Link
              to="/contact"
              className="px-8 py-3 bg-[#113e48] text-white font-bold rounded-full hover:bg-orange-500 transition-all shadow-lg flex items-center gap-2"
            >
              <FaPhoneAlt /> Liên hệ hỗ trợ
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
