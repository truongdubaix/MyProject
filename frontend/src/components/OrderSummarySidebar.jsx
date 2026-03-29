import { CheckCircle } from "lucide-react";

export default function OrderSummarySidebar({
  serviceType,
  setServiceType,
  distanceKm,
  estimatedFee,
  creating,
  SERVICE_PRICE
}) {
  const services = [
    { key: "standard", label: "Tiêu chuẩn", time: "2-3 ngày", price: 0 },
    { key: "express", label: "Nhanh", time: "1-2 ngày", price: 20000 },
    { key: "fast", label: "Hỏa tốc", time: "Trong ngày", price: 40000 },
  ];

  return (
    <div className="lg:col-span-1">
      <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 sticky top-6">
        <h3 className="text-lg font-bold text-[#113e48] mb-4">Chọn dịch vụ</h3>
        <div className="space-y-3">
          {services.map((opt) => (
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
                <p className={`font-bold ${serviceType === opt.key ? "text-orange-700" : "text-gray-700"}`}>
                  {opt.label}
                </p>
                <p className="text-xs text-gray-500">{opt.time}</p>
              </div>
              {serviceType === opt.key && <CheckCircle size={20} className="text-orange-500" />}
            </div>
          ))}
        </div>

        <div className="mt-6 pt-6 border-t border-gray-100">
          <div className="flex justify-between mb-2 text-sm text-gray-600">
            <span>Phí vận chuyển ({distanceKm}km)</span>
            <span>{(estimatedFee - (SERVICE_PRICE[serviceType] || 0)).toLocaleString()} ₫</span>
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
  );
}