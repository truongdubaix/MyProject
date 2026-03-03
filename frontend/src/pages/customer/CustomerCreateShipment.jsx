import { useState, useEffect } from "react";
import API from "../../services/api";
import toast from "react-hot-toast";
import { useNavigate } from "react-router-dom";
import AOS from "aos";
import "aos/dist/aos.css";
import DiaChiSelector from "../../components/DiaChiSelector.jsx";
import MapPicker from "../../components/MapPicker.jsx";
import {
  Package,
  MapPin,
  User,
  Truck,
  CheckCircle,
  Map,
  Hash,
  Scale,
  DollarSign,
  Book,
  X,
  Phone,
  Home,
} from "lucide-react";

export default function CustomerCreateShipment() {
  const navigate = useNavigate();

  // --- STATE FORM ---
  const [form, setForm] = useState({
    sender_name: "",
    sender_phone: "",
    receiver_name: "",
    receiver_phone: "",
    pickup_address: "",
    pickup_lat: null,
    pickup_lng: null,
    delivery_address: "",
    delivery_lat: null,
    delivery_lng: null,
    item_name: "",
    quantity: 1,
    weight_kg: "",
    cod_amount: "",
    shipping_fee: 0,
  });
  async function reverseGeocode(lat, lng) {
    const url = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}`;
    const res = await fetch(url);
    const data = await res.json();
    return data?.display_name || "";
  }

  const [pickupOption, setPickupOption] = useState("sender");
  const [creating, setCreating] = useState(false);
  const [estimatedFee, setEstimatedFee] = useState(0);
  const [distanceKm, setDistanceKm] = useState(0);

  const [serviceType, setServiceType] = useState("standard");
  const SERVICE_PRICE = {
    standard: 0,
    express: 20000,
    fast: 40000,
  };

  // State Map
  const [showPickupMap, setShowPickupMap] = useState(false);
  const [showDeliveryMap, setShowDeliveryMap] = useState(false);

  // --- STATE SỔ ĐỊA CHỈ ---
  const [showAddressModal, setShowAddressModal] = useState(false);
  const [addressTarget, setAddressTarget] = useState(null);
  const [savedAddresses, setSavedAddresses] = useState([]);
  const [loadingAddresses, setLoadingAddresses] = useState(false);

  // Hàm reset địa chỉ
  const handleResetAddress = (type) => {
    if (type === "pickup") {
      setForm((prev) => ({
        ...prev,
        pickup_address: "",
        pickup_lat: null,
        pickup_lng: null,
      }));
    } else {
      setForm((prev) => ({
        ...prev,
        delivery_address: "",
        delivery_lat: null,
        delivery_lng: null,
      }));
    }
  };

  // Lấy ID user
  const getUserId = () => {
    const userStr = localStorage.getItem("user");
    if (userStr) {
      try {
        return JSON.parse(userStr).id;
      } catch (e) {
        return localStorage.getItem("userId");
      }
    }
    return localStorage.getItem("userId");
  };
  const customerId = getUserId();

  useEffect(() => {
    AOS.init({
      duration: 500,
      easing: "ease-out-cubic",
      once: true,
      offset: 50,
    });
  }, []);

  // Tính khoảng cách Demo
  useEffect(() => {
    if (!form.delivery_address) return;
    const km = Math.floor(Math.random() * 30) + 5;
    setDistanceKm(km);
  }, [form.delivery_address]);

  // Tính phí vận chuyển
  useEffect(() => {
    if (!form.delivery_address) return;
    const baseFee = 15000;
    const distanceFee = distanceKm * 1000;
    const weightFee = (parseFloat(form.weight_kg) || 0) * 5000;
    const serviceFee = SERVICE_PRICE[serviceType];

    const total = baseFee + distanceFee + weightFee + serviceFee;
    setEstimatedFee(total);
    setForm((prev) => ({ ...prev, shipping_fee: total }));
  }, [distanceKm, form.weight_kg, serviceType, form.delivery_address]);

  const handleChange = (e) =>
    setForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));

  // --- HÀM XỬ LÝ SỔ ĐỊA CHỈ ---
  const openAddressBook = async (target) => {
    setAddressTarget(target);
    setShowAddressModal(true);

    if (savedAddresses.length === 0) {
      setLoadingAddresses(true);
      try {
        // Gọi API lấy danh sách địa chỉ
        const res = await API.get(`/addresses/${customerId}`);
        setSavedAddresses(res.data);
      } catch (error) {
        console.error("Lỗi lấy sổ địa chỉ:", error);
        toast.error("Không tải được sổ địa chỉ");
      } finally {
        setLoadingAddresses(false);
      }
    }
  };

  const handleSelectAddress = (addr) => {
    if (addressTarget === "pickup") {
      setForm((prev) => ({
        ...prev,
        sender_name: addr.name,
        sender_phone: addr.phone,
        pickup_address: addr.address,
        pickup_lat: addr.lat || null,
        pickup_lng: addr.lng || null,
      }));
    } else {
      setForm((prev) => ({
        ...prev,
        receiver_name: addr.name,
        receiver_phone: addr.phone,
        delivery_address: addr.address,
        delivery_lat: addr.lat || null,
        delivery_lng: addr.lng || null,
      }));
    }
    setShowAddressModal(false);
    toast.success("Đã điền thông tin từ sổ địa chỉ!");
  };

  // --- SUBMIT: TẠO ĐƠN -> CHUYỂN QUA THANH TOÁN ---
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!customerId) return toast.error("⚠️ Bạn chưa đăng nhập!");
    if (!form.pickup_lat || !form.delivery_lat) {
      toast.error("Vui lòng chọn vị trí lấy và giao hàng");
      return;
    }
    setCreating(true);
    try {
      const payload = {
        ...form,
        customer_id: Number(customerId),
        payment_method: "COD",
        pickup_option: pickupOption,
        shipping_fee: estimatedFee,
        service_type: serviceType,
        status: "pending",
        quantity: Number(form.quantity),
      };

      // 1. Gọi API tạo đơn
      const res = await API.post("/shipments", payload);

      // 2. Lấy ID đơn hàng vừa tạo
      // Lưu ý: Backend cần trả về id hoặc insertId
      const newShipmentId =
        res.data.id || res.data.shipmentId || res.data.insertId;

      if (!newShipmentId) {
        // Fallback: Nếu backend chưa trả về ID, tạm thời thông báo thành công và về lịch sử
        toast.success("Tạo đơn thành công (Chưa lấy được ID để thanh toán)");
        navigate("/customer/history");
        return;
      }

      toast.success("🎉 Tạo đơn thành công! Đang chuyển sang thanh toán...");

      // 3. CHUYỂN HƯỚNG SANG TRANG THANH TOÁN KÈM DỮ LIỆU
      navigate("/customer/payment", {
        state: {
          shipment_id: newShipmentId,
          amount: estimatedFee,
          cod: form.cod_amount,
        },
      });
    } catch (err) {
      console.error(err);
      toast.error("❌ Không thể tạo đơn hàng. Vui lòng thử lại!");
    } finally {
      setCreating(false);
    }
  };

  return (
    <div className="animate-in fade-in duration-500 pb-20 max-w-6xl mx-auto px-4">
      {/* Header */}
      <div className="mb-8 text-center pt-6">
        <h1 className="text-3xl font-extrabold text-[#113e48]">
          Tạo đơn hàng mới
        </h1>
        <p className="text-gray-500 text-sm mt-2">
          Điền thông tin chi tiết để chúng tôi phục vụ bạn tốt nhất.
        </p>
      </div>

      <form
        onSubmit={handleSubmit}
        className="grid grid-cols-1 lg:grid-cols-3 gap-8"
      >
        {/* --- CỘT TRÁI --- */}
        <div className="lg:col-span-2 space-y-6">
          {/* 1. THÔNG TIN NGƯỜI GỬI */}
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 relative overflow-hidden">
            <div className="absolute top-0 left-0 w-1 h-full bg-blue-500"></div>
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-bold text-[#113e48] flex items-center gap-2">
                <div className="p-2 bg-blue-100 rounded-lg text-blue-600">
                  <User size={20} />
                </div>
                Thông tin người gửi
              </h3>
              <button
                type="button"
                onClick={() => openAddressBook("pickup")}
                className="text-sm font-bold text-blue-600 bg-blue-50 hover:bg-blue-100 px-3 py-1.5 rounded-lg flex items-center gap-2 transition-colors"
              >
                <Book size={16} /> Chọn từ sổ địa chỉ
              </button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Họ tên
                </label>
                <input
                  name="sender_name"
                  value={form.sender_name}
                  onChange={handleChange}
                  placeholder="Nguyễn Văn A"
                  className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-blue-500 focus:bg-white transition-all"
                  required
                />
              </div>
              <div>
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Số điện thoại
                </label>
                <input
                  name="sender_phone"
                  value={form.sender_phone}
                  onChange={handleChange}
                  placeholder="0901234567"
                  className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-blue-500 focus:bg-white transition-all"
                  required
                  maxLength={10}
                />
              </div>
            </div>

            <div className="mb-4">
              <label className="text-xs font-bold text-gray-500 ml-1 mb-2 block">
                Hình thức lấy hàng
              </label>
              <div className="flex gap-4">
                <label
                  className={`flex-1 flex items-center justify-center gap-2 p-3 rounded-xl border cursor-pointer transition-all ${
                    pickupOption === "sender"
                      ? "border-orange-500 bg-orange-50 text-orange-700 font-bold"
                      : "border-gray-200 hover:bg-gray-50 text-gray-600"
                  }`}
                >
                  <input
                    type="radio"
                    name="pickup"
                    className="hidden"
                    checked={pickupOption === "sender"}
                    onChange={() => setPickupOption("sender")}
                  />
                  <Truck size={18} /> Lấy tận nơi
                </label>
                <label
                  className={`flex-1 flex items-center justify-center gap-2 p-3 rounded-xl border cursor-pointer transition-all ${
                    pickupOption === "warehouse"
                      ? "border-orange-500 bg-orange-50 text-orange-700 font-bold"
                      : "border-gray-200 hover:bg-gray-50 text-gray-600"
                  }`}
                >
                  <input
                    type="radio"
                    name="pickup"
                    className="hidden"
                    checked={pickupOption === "warehouse"}
                    onChange={() => setPickupOption("warehouse")}
                  />
                  <Package size={18} /> Gửi tại bưu cục
                </label>
              </div>
            </div>

            {form.pickup_address ? (
              <div className="relative group">
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Địa chỉ lấy hàng chi tiết
                </label>
                <textarea
                  value={form.pickup_address}
                  onChange={(e) =>
                    setForm({ ...form, pickup_address: e.target.value })
                  }
                  className="w-full p-3 border border-orange-300 bg-orange-50 rounded-xl outline-none focus:border-orange-500 transition-all font-medium resize-none"
                  rows={3}
                />
                <button
                  type="button"
                  onClick={() => handleResetAddress("pickup")}
                  className="absolute top-8 right-2 p-1 bg-gray-200 hover:bg-red-100 hover:text-red-600 rounded-full transition-all"
                  title="Chọn lại địa chỉ khác"
                >
                  <X size={16} />
                </button>
              </div>
            ) : (
              <div className="relative">
                <DiaChiSelector
                  label="Địa chỉ lấy hàng"
                  required
                  onChange={(data) => {
                    setForm((prev) => ({
                      ...prev,
                      pickup_address: data.address,
                      pickup_lat: data.lat,
                      pickup_lng: data.lng,
                    }));
                  }}
                />
                <button
                  type="button"
                  onClick={() => setShowPickupMap(true)}
                  className="absolute top-0 right-0 mt-1 text-xs font-bold text-blue-600 hover:underline flex items-center gap-1"
                >
                  <Map size={14} /> Chọn trên bản đồ
                </button>
              </div>
            )}
          </div>

          {/* 2. THÔNG TIN NGƯỜI NHẬN */}
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 relative overflow-hidden">
            <div className="absolute top-0 left-0 w-1 h-full bg-green-500"></div>
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-bold text-[#113e48] mb-4 flex items-center gap-2">
                <div className="p-2 bg-green-100 rounded-lg text-green-600">
                  <MapPin size={20} />
                </div>
                Thông tin người nhận
              </h3>
              <button
                type="button"
                onClick={() => openAddressBook("delivery")}
                className="text-sm font-bold text-green-600 bg-green-50 hover:bg-green-100 px-3 py-1.5 rounded-lg flex items-center gap-2 transition-colors"
              >
                <Book size={16} /> Chọn từ sổ địa chỉ
              </button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Họ tên
                </label>
                <input
                  name="receiver_name"
                  value={form.receiver_name}
                  onChange={handleChange}
                  placeholder="Trần Thị B"
                  className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-green-500 focus:bg-white transition-all"
                  required
                />
              </div>
              <div>
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Số điện thoại
                </label>
                <input
                  name="receiver_phone"
                  value={form.receiver_phone}
                  onChange={handleChange}
                  placeholder="0912345678"
                  className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-green-500 focus:bg-white transition-all"
                  required
                  maxLength={10}
                />
              </div>
            </div>

            {form.delivery_address ? (
              <div className="relative group">
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Địa chỉ giao hàng chi tiết
                </label>
                <textarea
                  value={form.delivery_address}
                  onChange={(e) =>
                    setForm({ ...form, delivery_address: e.target.value })
                  }
                  className="w-full p-3 border border-green-300 bg-green-50 rounded-xl outline-none focus:border-green-500 transition-all font-medium resize-none"
                  rows={3}
                />
                <button
                  type="button"
                  onClick={() => handleResetAddress("delivery")}
                  className="absolute top-8 right-2 p-1 bg-gray-200 hover:bg-red-100 hover:text-red-600 rounded-full transition-all"
                  title="Chọn lại địa chỉ khác"
                >
                  <X size={16} />
                </button>
              </div>
            ) : (
              <div className="relative">
                <DiaChiSelector
                  label="Địa chỉ giao hàng"
                  required
                  onChange={(data) => {
                    setForm((prev) => ({
                      ...prev,
                      delivery_address: data.address,
                      delivery_lat: data.lat,
                      delivery_lng: data.lng,
                    }));
                  }}
                />
                <button
                  type="button"
                  onClick={() => setShowDeliveryMap(true)}
                  className="absolute top-0 right-0 mt-1 text-xs font-bold text-green-600 hover:underline flex items-center gap-1"
                >
                  <Map size={14} /> Chọn trên bản đồ
                </button>
              </div>
            )}
          </div>

          {/* 3. THÔNG TIN HÀNG HÓA */}
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 relative overflow-hidden">
            <div className="absolute top-0 left-0 w-1 h-full bg-orange-500"></div>
            <h3 className="text-lg font-bold text-[#113e48] mb-4 flex items-center gap-2">
              <div className="p-2 bg-orange-100 rounded-lg text-orange-600">
                <Package size={20} />
              </div>
              Thông tin hàng hóa
            </h3>

            <div className="space-y-4">
              <div>
                <label className="text-xs font-bold text-gray-500 ml-1 mb-1 block">
                  Tên hàng hóa chi tiết
                </label>
                <input
                  name="item_name"
                  value={form.item_name}
                  onChange={handleChange}
                  placeholder="VD: Quần áo, Sách vở..."
                  className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-orange-500 focus:bg-white transition-all font-medium"
                  required
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                <div>
                  <label className="text-xs font-bold text-gray-500 ml-1 mb-1 flex items-center gap-1">
                    <Hash size={12} /> Số kiện
                  </label>
                  <input
                    type="number"
                    name="quantity"
                    value={form.quantity}
                    onChange={handleChange}
                    placeholder="1"
                    min="1"
                    className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-orange-500 focus:bg-white transition-all text-center font-bold"
                    required
                  />
                </div>

                <div>
                  <label className="text-xs font-bold text-gray-500 ml-1 mb-1 flex items-center gap-1">
                    <Scale size={12} /> Khối lượng (kg)
                  </label>
                  <input
                    type="number"
                    name="weight_kg"
                    value={form.weight_kg}
                    onChange={handleChange}
                    placeholder="0.5"
                    step="0.1"
                    min="0.1"
                    className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-orange-500 focus:bg-white transition-all text-center font-bold"
                    required
                  />
                </div>

                <div>
                  <label className="text-xs font-bold text-gray-500 ml-1 mb-1 flex items-center gap-1">
                    <DollarSign size={12} /> Thu hộ (COD)
                  </label>
                  <input
                    type="number"
                    name="cod_amount"
                    value={form.cod_amount}
                    onChange={handleChange}
                    placeholder="0"
                    min="0"
                    className="w-full p-3 border border-gray-200 rounded-xl bg-gray-50 outline-none focus:border-orange-500 focus:bg-white transition-all text-right font-bold text-orange-600"
                    required
                  />
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* --- CỘT PHẢI: DỊCH VỤ --- */}
        <div className="lg:col-span-1">
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 sticky top-6">
            <h3 className="text-lg font-bold text-[#113e48] mb-4">
              Chọn dịch vụ
            </h3>
            <div className="space-y-3">
              {[
                {
                  key: "standard",
                  label: "Tiêu chuẩn",
                  time: "2-3 ngày",
                  price: 0,
                },
                {
                  key: "express",
                  label: "Nhanh",
                  time: "1-2 ngày",
                  price: 20000,
                },
                {
                  key: "fast",
                  label: "Hỏa tốc",
                  time: "Trong ngày",
                  price: 40000,
                },
              ].map((opt) => (
                <div
                  key={opt.key}
                  onClick={() => setServiceType(opt.key)}
                  className={`p-4 rounded-xl border-2 cursor-pointer transition-all flex justify-between items-center ${
                    serviceType === opt.key
                      ? "border-orange-500 bg-orange-50"
                      : "border-gray-100 hover:border-orange-200"
                  }`}
                >
                  <div>
                    <p
                      className={`font-bold ${
                        serviceType === opt.key
                          ? "text-orange-700"
                          : "text-gray-700"
                      }`}
                    >
                      {opt.label}
                    </p>
                    <p className="text-xs text-gray-500">{opt.time}</p>
                  </div>
                  {serviceType === opt.key && (
                    <CheckCircle size={20} className="text-orange-500" />
                  )}
                </div>
              ))}
            </div>

            <div className="mt-6 pt-6 border-t border-gray-100">
              <div className="flex justify-between mb-2 text-sm text-gray-600">
                <span>Phí vận chuyển ({distanceKm}km)</span>
                <span>
                  {(
                    estimatedFee - (SERVICE_PRICE[serviceType] || 0)
                  ).toLocaleString()}
                  ₫
                </span>
              </div>
              <div className="flex justify-between mb-4 text-sm text-gray-600">
                <span>Phí dịch vụ</span>
                <span>{SERVICE_PRICE[serviceType]?.toLocaleString()}₫</span>
              </div>
              <div className="flex justify-between items-end">
                <span className="font-bold text-[#113e48]">Tổng phí</span>
                <span className="text-3xl font-extrabold text-orange-600">
                  {estimatedFee.toLocaleString()}₫
                </span>
              </div>
            </div>

            <button
              type="submit"
              disabled={creating}
              className="w-full mt-6 bg-[#113e48] hover:bg-[#0d2f36] text-white py-4 rounded-xl font-bold text-lg shadow-xl shadow-blue-900/20 transition-all flex items-center justify-center gap-2 disabled:opacity-70 hover:scale-[1.02]"
            >
              {creating ? "Đang xử lý..." : "Tạo đơn & Thanh toán"}
            </button>
          </div>
        </div>
      </form>

      {/* --- MAP MODALS --- */}
      {showPickupMap && (
        <div className="fixed inset-0 bg-black/60 z-[9999] flex items-center justify-center backdrop-blur-sm p-4">
          <div className="bg-white rounded-2xl overflow-hidden w-full max-w-3xl h-[500px] shadow-2xl relative">
            <MapPicker
              defaultPos={[
                form.pickup_lat || 16.047,
                form.pickup_lng || 108.206,
              ]}
              onConfirm={async (pos) => {
                const addr = await reverseGeocode(pos.lat, pos.lng);

                setForm((prev) => ({
                  ...prev,
                  pickup_lat: pos.lat,
                  pickup_lng: pos.lng,
                  pickup_address: addr, // ✅ ĐỊA CHỈ TỰ ĐIỀN
                }));

                setShowPickupMap(false);
              }}
              onCancel={() => setShowPickupMap(false)}
            />
          </div>
        </div>
      )}

      {showDeliveryMap && (
        <div className="fixed inset-0 bg-black/60 z-[9999] flex items-center justify-center backdrop-blur-sm p-4">
          <div className="bg-white rounded-2xl overflow-hidden w-full max-w-3xl h-[500px] shadow-2xl relative">
            <MapPicker
              defaultPos={[
                form.delivery_lat || 16.047,
                form.delivery_lng || 108.206,
              ]}
              onConfirm={async (pos) => {
                const addr = await reverseGeocode(pos.lat, pos.lng);

                setForm((prev) => ({
                  ...prev,
                  delivery_lat: pos.lat,
                  delivery_lng: pos.lng,
                  delivery_address: addr, // ✅ ĐÚNG FIELD
                }));

                setShowDeliveryMap(false); // ✅ ĐÚNG MODAL
              }}
              onCancel={() => setShowDeliveryMap(false)}
            />
          </div>
        </div>
      )}

      {/* --- MODAL SỔ ĐỊA CHỈ (MỚI) --- */}
      {showAddressModal && (
        <div className="fixed inset-0 bg-black/60 z-[9999] flex items-center justify-center backdrop-blur-sm p-4 animate-in fade-in duration-200">
          <div className="bg-white rounded-2xl w-full max-w-md shadow-2xl overflow-hidden flex flex-col max-h-[80vh]">
            <div className="p-4 border-b border-gray-100 flex justify-between items-center bg-gray-50">
              <h3 className="font-bold text-[#113e48] flex items-center gap-2">
                <Book size={18} /> Chọn địa chỉ{" "}
                {addressTarget === "pickup" ? "gửi" : "nhận"}
              </h3>
              <button
                onClick={() => setShowAddressModal(false)}
                className="p-1 hover:bg-gray-200 rounded-full transition"
              >
                <X size={20} />
              </button>
            </div>

            <div className="flex-1 overflow-y-auto p-4 space-y-3">
              {loadingAddresses ? (
                <p className="text-center text-gray-500 py-8">
                  Đang tải danh sách...
                </p>
              ) : savedAddresses.length > 0 ? (
                savedAddresses.map((addr) => (
                  <div
                    key={addr.id}
                    onClick={() => handleSelectAddress(addr)}
                    className="p-4 border border-gray-200 rounded-xl hover:border-orange-500 hover:bg-orange-50 cursor-pointer transition-all group"
                  >
                    <div className="flex justify-between items-start mb-1">
                      <span className="font-bold text-[#113e48] group-hover:text-orange-700">
                        {addr.name}
                      </span>
                      <span className="text-xs bg-gray-200 text-gray-600 px-2 py-0.5 rounded uppercase font-bold">
                        {addr.type}
                      </span>
                    </div>
                    <div className="text-sm text-gray-600 flex items-center gap-2 mb-1">
                      <Phone size={14} /> {addr.phone}
                    </div>
                    <div className="text-sm text-gray-500 flex items-start gap-2">
                      <MapPin size={14} className="mt-0.5 flex-shrink-0" />
                      <span className="line-clamp-2">{addr.address}</span>
                    </div>
                  </div>
                ))
              ) : (
                <div className="text-center py-8">
                  <Home size={40} className="mx-auto text-gray-300 mb-2" />
                  <p className="text-gray-500">Bạn chưa lưu địa chỉ nào.</p>
                  <button
                    onClick={() => navigate("/customer/addresses")}
                    className="text-blue-600 font-bold hover:underline mt-2"
                  >
                    Thêm địa chỉ mới
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
