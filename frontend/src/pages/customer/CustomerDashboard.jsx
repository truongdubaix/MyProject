import { useEffect, useState } from "react";
import API from "../../services/api";
import toast from "react-hot-toast";
import AOS from "aos";
import "aos/dist/aos.css";
import {
  Package,
  Truck,
  CheckCircle,
  DollarSign,
  PieChart as PieChartIcon, // Đổi tên icon để tránh trùng với Recharts
} from "lucide-react";
import {
  PieChart,
  Pie,
  Cell,
  Tooltip,
  ResponsiveContainer,
  Legend,
} from "recharts";

// Hàm lấy User ID
function getCurrentUserId() {
  const keys = ["user", "userId", "userid", "user_id", "customer_id"];
  for (const key of keys) {
    const value = localStorage.getItem(key);
    if (!value) continue;
    if (key === "user") {
      try {
        const parsed = JSON.parse(value);
        if (parsed?.id) return parsed.id;
      } catch (err) {
        console.error(err);
      }
    } else return value;
  }
  return null;
}

export default function CustomerDashboard() {
  const [shipments, setShipments] = useState([]);
  const [stats, setStats] = useState({
    total: 0,
    delivering: 0,
    completed: 0,
    pending: 0,
    totalCod: 0,
  });
  const [chartData, setChartData] = useState([]);
  const [loading, setLoading] = useState(true);
  const userId = getCurrentUserId();

  useEffect(() => {
    AOS.init({ duration: 600, easing: "ease-out-cubic", once: true });

    if (!userId) {
      toast.error("❌ Không tìm thấy thông tin người dùng!");
      return;
    }

    const fetchData = async () => {
      try {
        setLoading(true);
        const res = await API.get(`/customers/${userId}/shipments`);
        const data = res.data || [];
        setShipments(data);

        // Tính toán thống kê
        const total = data.length;
        const delivering = data.filter((s) =>
          ["delivering", "picking"].includes(s.status)
        ).length;
        const completed = data.filter((s) =>
          ["delivered", "completed"].includes(s.status)
        ).length;
        const pending = data.filter((s) => s.status === "pending").length;
        const failed = total - (pending + delivering + completed); // Các trạng thái còn lại
        const totalCod = data.reduce(
          (sum, s) => sum + (Number(s.cod_amount) || 0),
          0
        );

        setStats({ total, delivering, completed, pending, totalCod });

        // Xử lý dữ liệu cho Pie Chart (Chỉ lấy các mục có giá trị > 0)
        const rawChartData = [
          { name: "Chờ xử lý", value: pending, color: "#F59E0B" }, // Vàng
          { name: "Đang giao", value: delivering, color: "#3B82F6" }, // Xanh dương
          { name: "Hoàn tất", value: completed, color: "#10B981" }, // Xanh lá
          { name: "Thất bại/Hủy", value: failed, color: "#EF4444" }, // Đỏ
        ];
        // Lọc bỏ các trạng thái = 0 để biểu đồ đẹp hơn
        setChartData(rawChartData.filter((item) => item.value > 0));
      } catch (err) {
        console.error(err);
        toast.error("Không thể tải dữ liệu!");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [userId]);

  if (loading) {
    return (
      <div className="p-8 space-y-6 animate-pulse">
        <div className="h-8 w-48 bg-gray-200 rounded"></div>
        <div className="grid grid-cols-4 gap-6">
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="h-32 bg-gray-200 rounded-2xl"></div>
          ))}
        </div>
        <div className="h-64 bg-gray-200 rounded-2xl"></div>
      </div>
    );
  }

  return (
    <div className="space-y-8 animate-in fade-in duration-500 pb-10">
      {/* 1. Header Welcome */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
        <div>
          <h1 className="text-2xl font-extrabold text-[#113e48] flex items-center gap-2">
            Xin chào,{" "}
            <span className="text-orange-500">
              {localStorage.getItem("username") || "Khách hàng"}
            </span>{" "}
            👋
          </h1>
          <p className="text-sm text-gray-500 mt-1">
            Đây là tổng quan tình hình vận đơn của bạn hôm nay.
          </p>
        </div>
        <button className="bg-white border border-gray-200 text-gray-600 px-4 py-2 rounded-xl text-sm font-bold shadow-sm hover:bg-gray-50 transition-colors">
          {new Date().toLocaleDateString("vi-VN", {
            weekday: "long",
            year: "numeric",
            month: "long",
            day: "numeric",
          })}
        </button>
      </div>

      {/* 2. Stats Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <StatCard
          title="Tổng đơn hàng"
          value={stats.total}
          icon={<Package size={24} className="text-blue-600" />}
          bg="bg-blue-50"
        />
        <StatCard
          title="Đang vận chuyển"
          value={stats.delivering}
          icon={<Truck size={24} className="text-orange-600" />}
          bg="bg-orange-50"
        />
        <StatCard
          title="Giao thành công"
          value={stats.completed}
          icon={<CheckCircle size={24} className="text-green-600" />}
          bg="bg-green-50"
        />
        <StatCard
          title="Tổng tiền COD"
          value={stats.totalCod.toLocaleString("vi-VN") + "₫"}
          icon={<DollarSign size={24} className="text-purple-600" />}
          bg="bg-purple-50"
        />
      </div>

      {/* 3. Charts & Recent Orders */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Left: Pie Chart (Biểu đồ tròn) */}
        <div className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 lg:col-span-1 flex flex-col">
          <h3 className="text-lg font-bold text-[#113e48] mb-2 flex items-center gap-2">
            <PieChartIcon size={20} className="text-gray-400" /> Tỷ lệ trạng
            thái
          </h3>

          {/* Vùng chứa biểu đồ */}
          <div className="flex-1 min-h-[300px] relative">
            {chartData.length > 0 ? (
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={chartData}
                    cx="50%"
                    cy="50%"
                    innerRadius={60} // Tạo lỗ rỗng ở giữa (Donut Chart)
                    outerRadius={80}
                    paddingAngle={5} // Khoảng cách giữa các miếng
                    dataKey="value"
                  >
                    {chartData.map((entry, index) => (
                      <Cell
                        key={`cell-${index}`}
                        fill={entry.color}
                        stroke="none"
                      />
                    ))}
                  </Pie>
                  <Tooltip
                    contentStyle={{
                      borderRadius: "12px",
                      border: "none",
                      boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                    }}
                    itemStyle={{ fontWeight: "bold", color: "#333" }}
                  />
                  <Legend
                    verticalAlign="bottom"
                    height={36}
                    iconType="circle"
                    wrapperStyle={{ fontSize: "12px", fontWeight: "500" }}
                  />
                </PieChart>
              </ResponsiveContainer>
            ) : (
              <div className="flex flex-col items-center justify-center h-full text-gray-400">
                <Package size={40} className="mb-2 opacity-20" />
                <p className="text-sm">Chưa có dữ liệu</p>
              </div>
            )}

            {/* Số tổng ở giữa biểu đồ Donut */}
            {chartData.length > 0 && (
              <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-center pointer-events-none pb-8">
                <p className="text-3xl font-extrabold text-[#113e48]">
                  {stats.total}
                </p>
                <p className="text-[10px] text-gray-400 uppercase font-bold tracking-wider">
                  Đơn hàng
                </p>
              </div>
            )}
          </div>
        </div>

        {/* Right: Recent Orders Table */}
        <div className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 lg:col-span-2">
          <div className="flex justify-between items-center mb-6">
            <h3 className="text-lg font-bold text-[#113e48]">
              Đơn hàng mới nhất
            </h3>
            <button className="text-xs font-bold text-blue-600 hover:underline">
              Xem tất cả
            </button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left">
              <thead className="text-xs text-gray-400 uppercase bg-gray-50/50 border-b border-gray-100">
                <tr>
                  <th className="px-4 py-3 rounded-tl-lg">Mã vận đơn</th>
                  <th className="px-4 py-3">Người nhận</th>
                  <th className="px-4 py-3 text-center">Trạng thái</th>
                  <th className="px-4 py-3 text-right">COD</th>
                  <th className="px-4 py-3 rounded-tr-lg text-right">
                    Ngày tạo
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {shipments.slice(0, 5).map((s) => (
                  <tr
                    key={s.id}
                    className="hover:bg-gray-50/50 transition-colors"
                  >
                    <td className="px-4 py-4 font-bold text-[#113e48]">
                      {s.tracking_code}
                    </td>
                    <td className="px-4 py-4">
                      <div className="font-medium text-gray-900">
                        {s.receiver_name}
                      </div>
                      <div className="text-xs text-gray-400">
                        {s.receiver_phone}
                      </div>
                    </td>
                    <td className="px-4 py-4 text-center">
                      <StatusBadge status={s.status} />
                    </td>
                    <td className="px-4 py-4 text-right font-mono text-gray-600">
                      {Number(s.cod_amount).toLocaleString("vi-VN")}₫
                    </td>
                    <td className="px-4 py-4 text-right text-gray-400 text-xs">
                      {new Date(s.created_at).toLocaleDateString("vi-VN")}
                    </td>
                  </tr>
                ))}
                {shipments.length === 0 && (
                  <tr>
                    <td
                      colSpan="5"
                      className="px-4 py-8 text-center text-gray-400 italic"
                    >
                      Chưa có đơn hàng nào.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

// --- SUB COMPONENTS ---

function StatCard({ title, value, icon, bg }) {
  return (
    <div className="bg-white p-5 rounded-2xl shadow-sm border border-gray-100 flex items-center justify-between hover:shadow-md transition-shadow group">
      <div>
        <p className="text-xs font-bold text-gray-400 uppercase tracking-wide mb-1">
          {title}
        </p>
        <h3 className="text-2xl font-extrabold text-[#113e48]">{value}</h3>
      </div>
      <div
        className={`w-12 h-12 rounded-xl flex items-center justify-center ${bg} group-hover:scale-110 transition-transform`}
      >
        {icon}
      </div>
    </div>
  );
}

function StatusBadge({ status }) {
  const config = {
    pending: {
      label: "Chờ xử lý",
      color: "bg-yellow-100 text-yellow-700",
      icon: "⏳",
    },
    picking: {
      label: "Đang lấy",
      color: "bg-blue-100 text-blue-700",
      icon: "📦",
    },
    delivering: {
      label: "Đang giao",
      color: "bg-blue-100 text-blue-700",
      icon: "🚚",
    },
    delivered: {
      label: "Hoàn tất",
      color: "bg-green-100 text-green-700",
      icon: "✅",
    },
    completed: {
      label: "Hoàn tất",
      color: "bg-green-100 text-green-700",
      icon: "✅",
    },
    failed: { label: "Thất bại", color: "bg-red-100 text-red-700", icon: "❌" },
    cancelled: {
      label: "Đã hủy",
      color: "bg-gray-100 text-gray-600",
      icon: "🚫",
    },
  };

  const s = config[status] || {
    label: status,
    color: "bg-gray-100 text-gray-600",
    icon: "•",
  };

  return (
    <span
      className={`px-2.5 py-1 rounded-full text-xs font-bold ${s.color} border border-transparent whitespace-nowrap`}
    >
      {s.icon} {s.label}
    </span>
  );
}
