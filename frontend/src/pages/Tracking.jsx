import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
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

// 🧭 Icon tài xế
const iconDriver = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
});

// 📦 Icon điểm lấy hàng
const iconPickup = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/2991/2991112.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
});

// 🏠 Icon điểm giao hàng
const iconDelivery = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/235/235861.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
});

// 🗺️ Auto zoom
function FitBounds({ points }) {
  const map = useMap();
  useEffect(() => {
    if (points.length > 1) map.fitBounds(points, { padding: [60, 60] });
  }, [points]);
  return null;
}

export default function Tracking() {
  const [searchParams] = useSearchParams();
  const initialCode = searchParams.get("code") || "";

  const [code, setCode] = useState(initialCode);
  const [last4, setLast4] = useState(""); // public
  const [shipment, setShipment] = useState(null);

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);

  const [driverPos, setDriverPos] = useState(null);

  // init animation
  useEffect(() => {
    AOS.init({ duration: 800, once: true });
  }, []);

  // auto-search khi có tham số từ Home
  useEffect(() => {
    if (initialCode) handleSearch();
  }, [initialCode]);

  // ==========================
  // ⭐⭐ HÀM TRA CỨU CHUẨN ⭐⭐
  // ==========================
  const handleSearch = async () => {
    setError("");
    setSuccess("");
    setShipment(null);

    if (!code.trim()) {
      setError("⚠️ Vui lòng nhập mã vận đơn!");
      return;
    }

    const role = localStorage.getItem("role");
    const isCustomer = role === "customer";

    setLoading(true);

    try {
      let res;

      // ── 🔐 CUSTOMER LOGIN ──
      if (isCustomer) {
        res = await API.get(`/customer/track/${code.trim()}`);
      }

      // ── 🌍 GUEST (PUBLIC) ──
      else {
        if (!last4 || last4.length !== 4) {
          setError("⚠️ Nhập 4 số cuối SĐT người nhận!");
          return;
        }

        res = await API.get(
          `/tracking?code=${code.trim()}&last4=${last4.trim()}`
        );
      }

      if (!res.data) {
        setError("❌ Không tìm thấy đơn hàng!");
        return;
      }

      setShipment(res.data);
      setSuccess("🎉 Tra cứu thành công!");
    } catch (err) {
      console.log(err);
      setError("❌ Mã đơn không hợp lệ hoặc bạn không có quyền!");
    } finally {
      setLoading(false);
    }
  };

  // ==========================
  // Map data
  // ==========================
  const pickup =
    shipment?.pickup_lat && shipment?.pickup_lng
      ? [Number(shipment.pickup_lat), Number(shipment.pickup_lng)]
      : [16.0471, 108.2068]; // Đà Nẵng

  const delivery =
    shipment?.delivery_lat && shipment?.delivery_lng
      ? [Number(shipment.delivery_lat), Number(shipment.delivery_lng)]
      : [10.7769, 106.7009]; // HCM

  const routePoints = [pickup, delivery];

  // render tài xế chạy giả lập
  useEffect(() => {
    if (!shipment) return;

    let progress = 0;
    const interval = setInterval(() => {
      progress += 0.002;
      if (progress > 1) progress = 0;
      const lat = pickup[0] + (delivery[0] - pickup[0]) * progress;
      const lng = pickup[1] + (delivery[1] - pickup[1]) * progress;
      setDriverPos([lat, lng]);
    }, 600);

    return () => clearInterval(interval);
  }, [shipment]);

  return (
    <>
      {/* Header */}
      <section className="pt-28 pb-10 bg-gradient-to-r from-blue-600 to-sky-500 text-white text-center">
        <h2 className="text-3xl font-bold mb-4" data-aos="fade-down">
          Tra cứu trạng thái vận đơn
        </h2>
        <p className="mb-6 text-blue-100" data-aos="fade-up">
          Nhập mã đơn hàng để xem thông tin chi tiết và bản đồ hành trình
        </p>

        <div
          className="flex flex-col md:flex-row items-center justify-center gap-3 max-w-2xl mx-auto px-4"
          data-aos="zoom-in"
        >
          <input
            value={code}
            onChange={(e) => setCode(e.target.value)}
            placeholder="VD: SP123456"
            className="w-full md:w-3/4 p-3 rounded text-gray-700 focus:outline-none shadow"
          />

          {/* public only */}
          {!localStorage.getItem("role") && (
            <input
              value={last4}
              onChange={(e) => setLast4(e.target.value.replace(/\D/g, ""))}
              maxLength={4}
              placeholder="4 số cuối SĐT"
              className="w-full md:w-1/2 p-3 rounded text-gray-700 focus:outline-none shadow"
            />
          )}

          <button
            onClick={handleSearch}
            disabled={loading}
            className={`px-6 py-3 rounded-lg font-semibold text-white
              ${loading ? "bg-gray-400" : "bg-orange-500 hover:bg-orange-600"}`}
          >
            {loading ? "Đang tra cứu..." : "Tra cứu"}
          </button>
        </div>

        {error && <p className="mt-4 text-red-200 font-medium">{error}</p>}
        {success && (
          <p className="mt-4 text-green-200 font-medium">{success}</p>
        )}
      </section>

      {/* Kết quả */}
      {shipment && (
        <section className="max-w-5xl mx-auto py-16 px-6" data-aos="fade-up">
          <div className="bg-white rounded-lg shadow-lg p-6 mb-10">
            <h3 className="text-2xl font-bold text-gray-700 mb-4">
              📦 Thông tin đơn hàng
            </h3>
            <div className="grid md:grid-cols-2 gap-4 text-sm">
              <div>
                <p>
                  <b>Mã đơn:</b> {shipment.tracking_code}
                </p>
                <p>
                  <b>Người gửi:</b> {shipment.sender_name}
                </p>
                <p>
                  <b>Người nhận:</b> {shipment.receiver_name}
                </p>
                <p>
                  <b>Địa chỉ giao:</b> {shipment.delivery_address}
                </p>
              </div>
              <div>
                <p>
                  <b>Trạng thái:</b> {shipment.status}
                </p>
                <p>
                  <b>COD:</b> ₫{shipment.cod_amount?.toLocaleString("vi-VN")}
                </p>
                <p>
                  <b>Ngày tạo:</b>{" "}
                  {new Date(shipment.created_at).toLocaleString("vi-VN")}
                </p>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-lg p-6">
            <h3 className="text-2xl font-bold text-gray-700 mb-4">
              🗺️ Bản đồ hành trình
            </h3>
            <div className="h-[500px] rounded-lg overflow-hidden shadow-md">
              <MapContainer
                center={pickup}
                zoom={6}
                style={{ height: "100%", width: "100%" }}
              >
                <TileLayer
                  url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                  attribution="&copy; OpenStreetMap contributors"
                />

                <Marker position={pickup} icon={iconPickup}>
                  <Popup>📦 Nơi lấy hàng</Popup>
                </Marker>

                <Marker position={delivery} icon={iconDelivery}>
                  <Popup>🏠 Nơi giao hàng</Popup>
                </Marker>

                {driverPos && (
                  <Marker position={driverPos} icon={iconDriver}>
                    <Popup>🚛 Tài xế đang di chuyển</Popup>
                  </Marker>
                )}

                <Polyline
                  positions={routePoints}
                  pathOptions={{ color: "blue", weight: 4 }}
                />
                <FitBounds points={routePoints} />
              </MapContainer>
            </div>
          </div>
        </section>
      )}
    </>
  );
}
