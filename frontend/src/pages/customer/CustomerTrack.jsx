import { useState, useEffect } from "react";
import API from "../../services/api";
import toast from "react-hot-toast";
import {
  Search,
  User,
  Phone,
  Truck,
  MapPin,
  Package,
  Clock,
  CheckCircle,
  AlertCircle,
} from "lucide-react";
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

// --- ICONS MAP ---
const iconDriver = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
  iconSize: [40, 40],
  iconAnchor: [20, 40],
  popupAnchor: [0, -40],
});
const iconPickup = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/3082/3082383.png",
  iconSize: [35, 35],
  iconAnchor: [17, 35],
  popupAnchor: [0, -32],
});
const iconDelivery = new L.Icon({
  iconUrl: "https://cdn-icons-png.flaticon.com/512/8700/8700621.png",
  iconSize: [35, 35],
  iconAnchor: [17, 35],
  popupAnchor: [0, -32],
});

// --- SUB COMPONENTS ---
function FitBounds({ points }) {
  const map = useMap();
  useEffect(() => {
    if (points && points.length > 0) {
      const bounds = L.latLngBounds(points);
      map.fitBounds(bounds, { padding: [50, 50] });
    }
  }, [points, map]);
  return null;
}

export default function CustomerTrack() {
  const [trackingCode, setTrackingCode] = useState("");
  const [shipment, setShipment] = useState(null);
  const [routePoints, setRoutePoints] = useState([]);
  const [waypoints, setWaypoints] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    AOS.init({ duration: 500 });
  }, []);

  // 👇 THUẬT TOÁN VẼ ĐƯỜNG "ÉP" VỀ VIỆT NAM
  const fetchRouteOSRM = async (start, end) => {
    if (!start || !end) return [];

    // OSRM dùng [Lng, Lat]
    const startStr = `${start[1]},${start[0]}`;
    const endStr = `${end[1]},${end[0]}`;

    // Tọa độ Đà Nẵng (Điểm neo để giữ đường đi ở VN)
    const midPointStr = "108.2022,16.0544";

    // Tính khoảng cách vĩ độ (Bắc - Nam)
    const latDiff = Math.abs(start[0] - end[0]);

    let url = "";

    // 💡 LOGIC THÔNG MINH:
    // Nếu khoảng cách Bắc-Nam lớn hơn 4 độ vĩ tuyến (khá xa)
    // -> Chèn thêm Đà Nẵng vào giữa để ép đường đi bám biển
    if (latDiff > 4) {
      url = `https://router.project-osrm.org/route/v1/driving/${startStr};${midPointStr};${endStr}?overview=full&geometries=geojson`;
    } else {
      // Nếu gần thì đi thẳng
      url = `https://router.project-osrm.org/route/v1/driving/${startStr};${endStr}?overview=full&geometries=geojson`;
    }

    try {
      const res = await fetch(url);
      const data = await res.json();
      if (data.code === "Ok" && data.routes.length > 0) {
        return data.routes[0].geometry.coordinates.map((coord) => [
          coord[1],
          coord[0],
        ]);
      }
    } catch (error) {
      console.error("Lỗi OSRM:", error);
    }
    // Fallback đường thẳng nếu lỗi
    return [start, end];
  };

  const handleTrack = async (e) => {
    e.preventDefault();
    if (!trackingCode.trim())
      return toast.error("⚠️ Vui lòng nhập mã vận đơn!");

    setLoading(true);
    setShipment(null);
    setRoutePoints([]);
    setWaypoints([]);

    try {
      const customerId =
        localStorage.getItem("customer_id") || localStorage.getItem("userId");
      const res = await API.get(
        `/customers/track/${trackingCode}?customer_id=${customerId}`
      );
      const data = res.data;
      setShipment(data);

      // Xử lý tọa độ
      let pickup = null;
      let delivery = null;

      if (data.pickup_lat && data.pickup_lng) {
        pickup = [Number(data.pickup_lat), Number(data.pickup_lng)];
      }
      if (data.delivery_lat && data.delivery_lng) {
        delivery = [Number(data.delivery_lat), Number(data.delivery_lng)];
      }

      // Default nếu thiếu tọa độ
      if (!pickup) pickup = [10.7769, 106.7009];
      if (!delivery) delivery = [21.0285, 105.8542];

      setWaypoints([pickup, delivery]);

      // Logic vẽ đường: Chỉ vẽ khi đang di chuyển
      if (data.status === "picking" || data.status === "delivering") {
        const realPath = await fetchRouteOSRM(pickup, delivery);
        setRoutePoints(realPath);
      } else {
        setRoutePoints([]);
      }

      toast.success("✅ Đã tìm thấy đơn hàng!");
    } catch (err) {
      toast.error("❌ Không tìm thấy đơn hàng hoặc bạn không có quyền xem!");
    } finally {
      setLoading(false);
    }
  };

  // Helper render status
  const getStatusColor = (status) => {
    switch (status) {
      case "pending":
        return "text-yellow-600 bg-yellow-50 border-yellow-200";
      case "picking":
        return "text-blue-600 bg-blue-50 border-blue-200";
      case "delivering":
        return "text-orange-600 bg-orange-50 border-orange-200";
      case "completed":
        return "text-green-600 bg-green-50 border-green-200";
      case "delivered":
        return "text-green-600 bg-green-50 border-green-200";
      case "failed":
        return "text-red-600 bg-red-50 border-red-200";
      case "cancelled":
        return "text-gray-600 bg-gray-50 border-gray-200";
      default:
        return "text-gray-600 bg-gray-50";
    }
  };

  const getStatusLabel = (status) => {
    const map = {
      pending: "Chờ xử lý",
      assigned: "Đã phân công",
      picking: "Đang lấy hàng",
      delivering: "Đang giao hàng",
      delivered: "Đã giao hàng",
      completed: "Hoàn tất",
      failed: "Giao thất bại",
      cancelled: "Đã hủy",
    };
    return map[status] || status;
  };

  return (
    <div className="min-h-screen bg-[#F8FAFC] pb-20 font-sans animate-in fade-in duration-500">
      {/* Header Search Section */}
      <div className="bg-[#113e48] pt-10 pb-24 px-4 relative overflow-hidden">
        {/* Background Decor */}
        <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full blur-3xl translate-x-1/2 -translate-y-1/2"></div>
        <div className="absolute bottom-0 left-0 w-48 h-48 bg-orange-500/10 rounded-full blur-2xl -translate-x-1/2 translate-y-1/2"></div>

        <div className="max-w-2xl mx-auto text-center relative z-10">
          <h1 className="text-3xl font-extrabold text-white mb-2">
            Tra cứu hành trình đơn hàng
          </h1>
          <p className="text-blue-200 text-sm mb-8">
            Nhập mã vận đơn để theo dõi trạng thái và vị trí tài xế theo thời
            gian thực.
          </p>

          <form
            onSubmit={handleTrack}
            className="bg-white p-2 rounded-2xl shadow-xl flex items-center gap-2 max-w-lg mx-auto transform transition-transform hover:scale-[1.02]"
          >
            <div className="pl-4 text-gray-400">
              <Search size={20} />
            </div>
            <input
              type="text"
              placeholder="VD: SP123456789"
              value={trackingCode}
              onChange={(e) => setTrackingCode(e.target.value)}
              className="flex-1 py-3 outline-none text-gray-700 font-medium placeholder:font-normal"
            />
            <button
              type="submit"
              disabled={loading}
              className="bg-orange-500 hover:bg-orange-600 text-white px-6 py-3 rounded-xl font-bold transition-colors disabled:opacity-70 flex items-center gap-2"
            >
              {loading ? (
                <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent"></div>
              ) : (
                "Tra cứu"
              )}
            </button>
          </form>
        </div>
      </div>

      {/* Result Section */}
      <div className="max-w-6xl mx-auto px-4 -mt-16 relative z-20">
        {shipment ? (
          <div
            className="grid grid-cols-1 lg:grid-cols-3 gap-6"
            data-aos="fade-up"
          >
            {/* Left Column: Info */}
            <div className="lg:col-span-1 space-y-6">
              {/* Status Card */}
              <div className="bg-white p-6 rounded-2xl shadow-lg border border-gray-100">
                <div className="flex justify-between items-center mb-4">
                  <span className="text-sm font-bold text-gray-400">
                    TRẠNG THÁI
                  </span>
                  <span
                    className={`px-3 py-1 rounded-full text-xs font-extrabold border ${getStatusColor(
                      shipment.status
                    )}`}
                  >
                    {getStatusLabel(shipment.status)}
                  </span>
                </div>
                <h2 className="text-2xl font-extrabold text-[#113e48] mb-1">
                  #{shipment.tracking_code}
                </h2>
                <p className="text-sm text-gray-500 flex items-center gap-1">
                  <Clock size={14} /> Cập nhật:{" "}
                  {new Date(shipment.updated_at).toLocaleString("vi-VN")}
                </p>
              </div>

              {/* Driver Card */}
              {shipment.driver_name ? (
                <div className="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 flex items-center gap-4">
                  <div className="w-14 h-14 rounded-full bg-gray-100 flex items-center justify-center text-2xl border-2 border-white shadow-sm">
                    👮‍♂️
                  </div>
                  <div className="flex-1">
                    <p className="text-xs font-bold text-gray-400 uppercase">
                      Tài xế phụ trách
                    </p>
                    <h3 className="font-bold text-[#113e48] text-lg">
                      {shipment.driver_name}
                    </h3>
                    <p className="text-xs text-gray-500 flex items-center gap-1 mt-0.5">
                      <Truck size={12} />{" "}
                      {shipment.plate_number || "Chưa cập nhật biển số"}
                    </p>
                  </div>
                  <a
                    href={`tel:${shipment.driver_phone}`}
                    className="bg-green-500 hover:bg-green-600 text-white p-3 rounded-full shadow-lg transition-transform hover:scale-110"
                  >
                    <Phone size={20} />
                  </a>
                </div>
              ) : (
                <div className="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 text-center py-8">
                  <div className="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-3 text-gray-400">
                    <User size={24} />
                  </div>
                  <p className="text-sm text-gray-500">
                    Đơn hàng chưa được phân công tài xế.
                  </p>
                </div>
              )}

              {/* Route Info */}
              <div className="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 space-y-6">
                <div className="flex gap-4 relative">
                  <div className="flex flex-col items-center">
                    <div className="w-3 h-3 rounded-full bg-blue-500 ring-4 ring-blue-100"></div>
                    <div className="w-0.5 h-full bg-gray-100 my-1"></div>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 font-bold uppercase mb-1">
                      Điểm lấy hàng
                    </p>
                    <p className="font-bold text-[#113e48] text-sm">
                      {shipment.sender_name}
                    </p>
                    <p className="text-xs text-gray-500 mt-0.5 leading-relaxed">
                      {shipment.pickup_address}
                    </p>
                  </div>
                </div>
                <div className="flex gap-4 relative">
                  <div className="flex flex-col items-center">
                    <div className="w-3 h-3 rounded-full bg-orange-500 ring-4 ring-orange-100"></div>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 font-bold uppercase mb-1">
                      Điểm giao hàng
                    </p>
                    <p className="font-bold text-[#113e48] text-sm">
                      {shipment.receiver_name}
                    </p>
                    <p className="text-xs text-gray-500 mt-0.5 leading-relaxed">
                      {shipment.delivery_address}
                    </p>
                  </div>
                </div>
              </div>
            </div>

            {/* Right Column: Map */}
            <div className="lg:col-span-2 h-[500px] lg:h-auto bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden relative z-0">
              <MapContainer
                center={waypoints[0] || [10.8231, 106.6297]}
                zoom={13}
                style={{ height: "100%", width: "100%" }}
                zoomControl={false}
              >
                <TileLayer
                  url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                  attribution="&copy; OpenStreetMap"
                />

                {/* Markers */}
                {waypoints[0] && (
                  <Marker position={waypoints[0]} icon={iconPickup}>
                    <Popup>Điểm lấy hàng</Popup>
                  </Marker>
                )}
                {waypoints[1] && (
                  <Marker position={waypoints[1]} icon={iconDelivery}>
                    <Popup>Điểm giao hàng</Popup>
                  </Marker>
                )}

                {/* Driver Marker - Chỉ hiện khi đang di chuyển */}
                {(shipment.status === "picking" ||
                  shipment.status === "delivering") &&
                  shipment.driver_lat && (
                    <Marker
                      position={[shipment.driver_lat, shipment.driver_lng]}
                      icon={iconDriver}
                      zIndexOffset={999}
                    >
                      <Popup>
                        <b>Tài xế đang ở đây</b>
                      </Popup>
                    </Marker>
                  )}

                {/* Route Line - Chỉ hiện khi đang di chuyển */}
                {routePoints.length > 0 && (
                  <Polyline
                    positions={routePoints}
                    color="#3B82F6"
                    weight={5}
                    opacity={0.8}
                    lineCap="round"
                    lineJoin="round"
                  />
                )}

                <FitBounds
                  points={routePoints.length > 0 ? routePoints : waypoints}
                />
              </MapContainer>

              {/* Mobile Overlay Status */}
              <div className="lg:hidden absolute top-4 left-4 right-4 bg-white/90 backdrop-blur p-3 rounded-xl shadow-lg border border-gray-100 z-[400]">
                <p className="text-xs font-bold text-gray-500 uppercase">
                  Trạng thái hiện tại
                </p>
                <p className="text-lg font-extrabold text-[#113e48]">
                  {getStatusLabel(shipment.status)}
                </p>
              </div>
            </div>
          </div>
        ) : (
          // Empty State
          !loading && (
            <div
              className="bg-white rounded-2xl shadow-lg p-12 text-center border border-gray-100"
              data-aos="fade-up"
            >
              <div className="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-4 text-gray-300">
                <Package size={40} />
              </div>
              <h3 className="text-lg font-bold text-gray-700">
                Chưa có kết quả tra cứu
              </h3>
              <p className="text-sm text-gray-500 mt-2">
                Vui lòng nhập đúng mã vận đơn để xem chi tiết hành trình.
              </p>
            </div>
          )
        )}
      </div>
    </div>
  );
}
