import { useState } from "react";
import {
  MapPin,
  Plus,
  Edit2,
  Trash2,
  Home,
  Briefcase,
  MoreVertical,
} from "lucide-react";
import toast from "react-hot-toast";

export default function CustomerAddress() {
  // Mock data
  const [addresses, setAddresses] = useState([
    {
      id: 1,
      name: "Kho Chính HCM",
      phone: "0909123456",
      address: "123 Đường Lê Lợi, Phường Bến Thành, Quận 1, TP.HCM",
      type: "office",
      isDefault: true,
    },
    {
      id: 2,
      name: "Nhà Riêng Hà Nội",
      phone: "0912345678",
      address: "45 Ngõ 102 Trường Chinh, Đống Đa, Hà Nội",
      type: "home",
      isDefault: false,
    },
  ]);

  const handleDelete = (id) => {
    if (confirm("Bạn muốn xóa địa chỉ này?")) {
      setAddresses(addresses.filter((a) => a.id !== id));
      toast.success("Đã xóa địa chỉ");
    }
  };

  return (
    <div className="space-y-6 animate-in fade-in duration-500">
      {/* HEADER */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
        <div>
          <h1 className="text-xl font-bold text-[#113e48] flex items-center gap-2">
            <MapPin className="text-orange-500" /> Sổ địa chỉ
          </h1>
          <p className="text-sm text-gray-500 mt-1">
            Quản lý danh sách địa chỉ nhận/gửi hàng thường xuyên.
          </p>
        </div>
        <button className="flex items-center gap-2 bg-orange-500 hover:bg-orange-600 text-white px-5 py-2.5 rounded-xl font-bold shadow-lg shadow-orange-500/20 transition-all transform hover:-translate-y-1">
          <Plus size={18} /> Thêm địa chỉ mới
        </button>
      </div>

      {/* ADDRESS GRID */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {addresses.map((addr) => (
          <div
            key={addr.id}
            className="group bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md hover:border-orange-200 transition-all relative"
          >
            {/* Badge Default */}
            {addr.isDefault && (
              <span className="absolute top-4 right-4 bg-green-100 text-green-700 text-[10px] font-bold px-2 py-1 rounded-full border border-green-200">
                Mặc định
              </span>
            )}

            {/* Icon Type */}
            <div className="w-12 h-12 rounded-full bg-blue-50 flex items-center justify-center text-blue-600 mb-4 group-hover:bg-blue-100 transition-colors">
              {addr.type === "home" ? (
                <Home size={24} />
              ) : (
                <Briefcase size={24} />
              )}
            </div>

            <h3 className="font-bold text-[#113e48] text-lg mb-1">
              {addr.name}
            </h3>
            <p className="text-sm text-gray-500 mb-4">{addr.phone}</p>

            <div className="p-3 bg-gray-50 rounded-xl text-sm text-gray-700 leading-relaxed border border-gray-100 min-h-[80px]">
              {addr.address}
            </div>

            {/* Actions */}
            <div className="flex gap-2 mt-6 pt-4 border-t border-gray-100">
              <button className="flex-1 flex items-center justify-center gap-2 py-2 rounded-lg text-sm font-bold text-gray-600 hover:bg-gray-50 transition-colors">
                <Edit2 size={16} /> Sửa
              </button>
              <div className="w-[1px] bg-gray-200 h-6 my-auto"></div>
              <button
                onClick={() => handleDelete(addr.id)}
                className="flex-1 flex items-center justify-center gap-2 py-2 rounded-lg text-sm font-bold text-red-500 hover:bg-red-50 transition-colors"
              >
                <Trash2 size={16} /> Xóa
              </button>
            </div>
          </div>
        ))}

        {/* Empty State / Add New Placeholder */}
        <div className="border-2 border-dashed border-gray-200 rounded-2xl flex flex-col items-center justify-center p-6 text-gray-400 hover:border-orange-300 hover:bg-orange-50/10 cursor-pointer transition-all min-h-[300px]">
          <div className="w-16 h-16 rounded-full bg-gray-50 flex items-center justify-center mb-3">
            <Plus size={32} />
          </div>
          <p className="font-medium">Thêm địa chỉ khác</p>
        </div>
      </div>
    </div>
  );
}
