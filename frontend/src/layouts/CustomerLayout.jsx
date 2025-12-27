import { NavLink, Outlet, useNavigate, useLocation } from "react-router-dom";
import {
  LogOut,
  Home,
  PlusCircle,
  Search,
  Clock,
  User,
  Bell,
  ChevronRight,
  // 👇 Import thêm các icon mới
  MapPin, // Sổ địa chỉ
  Wallet, // Ví tiền
  Headphones, // Hỗ trợ
  Gift, // Khuyến mãi (Optional)
} from "lucide-react";

export default function CustomerLayout() {
  const navigate = useNavigate();
  const location = useLocation();
  const username = localStorage.getItem("username") || "Khách hàng";

  const handleLogout = () => {
    if (window.confirm("Bạn có chắc chắn muốn đăng xuất?")) {
      localStorage.clear();
      navigate("/login");
    }
  };

  const navLinkClasses = ({ isActive }) => `
    flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-xl transition-all duration-300 group relative
    ${
      isActive
        ? "bg-orange-500 text-white shadow-lg shadow-orange-500/30 translate-x-1"
        : "text-blue-100 hover:bg-white/10 hover:text-white"
    }
  `;

  // Title Header Mapping
  const getPageTitle = () => {
    switch (location.pathname) {
      case "/customer":
        return "Dashboard";
      case "/customer/create":
        return "Tạo đơn hàng mới";
      case "/customer/track":
        return "Tra cứu vận đơn";
      case "/customer/history":
        return "Lịch sử đơn hàng";
      case "/customer/addresses":
        return "Sổ địa chỉ"; // ✨ Mới
      case "/customer/wallet":
        return "Ví & Thanh toán"; // ✨ Mới
      case "/customer/support":
        return "Hỗ trợ khách hàng"; // ✨ Mới
      case "/customer/profile":
        return "Hồ sơ cá nhân";
      default:
        return "Bảng điều khiển";
    }
  };

  return (
    <div className="flex h-screen bg-[#F8FAFC] overflow-hidden font-sans">
      {/* --- SIDEBAR --- */}
      <aside className="w-72 bg-[#113e48] text-white flex flex-col shadow-2xl relative z-20">
        {/* Brand Logo */}
        <div className="h-20 flex items-center px-8 border-b border-white/10">
          <div
            className="flex items-center gap-2 cursor-pointer"
            onClick={() => navigate("/")}
          >
            <div className="bg-orange-500 p-1.5 rounded-lg">
              <img
                src="/assets/logo/logoSpeedyShip.png"
                alt="Logo"
                className="w-6 h-6 object-contain brightness-0 invert"
              />
            </div>
            <span className="text-xl font-extrabold tracking-tight">
              Speedy<span className="text-orange-500">Ship</span>
            </span>
          </div>
        </div>

        {/* Navigation Menu */}
        <div className="flex-1 overflow-y-auto py-6 px-4 space-y-6 custom-scrollbar">
          {/* GROUP 1: CHỨC NĂNG CHÍNH */}
          <div>
            <p className="px-4 mb-2 text-[10px] font-bold text-blue-200/50 uppercase tracking-widest">
              Quản lý vận đơn
            </p>
            <nav className="flex flex-col space-y-1">
              <NavLink to="/customer" end className={navLinkClasses}>
                <Home size={18} /> <span>Tổng quan</span>
              </NavLink>
              <NavLink to="/customer/create-order" className={navLinkClasses}>
                <PlusCircle size={18} /> <span>Tạo đơn hàng</span>
              </NavLink>
              <NavLink to="/customer/track" className={navLinkClasses}>
                <Search size={18} /> <span>Tra cứu đơn</span>
              </NavLink>
              <NavLink to="/customer/history" className={navLinkClasses}>
                <Clock size={18} /> <span>Lịch sử đơn</span>
              </NavLink>
            </nav>
          </div>

          {/* GROUP 2: TIỆN ÍCH (✨ MỚI THÊM) */}
          <div>
            <p className="px-4 mb-2 text-[10px] font-bold text-blue-200/50 uppercase tracking-widest">
              Tiện ích
            </p>
            <NavLink to="/customer/addresses" className={navLinkClasses}>
              <MapPin size={18} /> <span>Sổ địa chỉ</span>
            </NavLink>

            <NavLink to="/customer/wallet" className={navLinkClasses}>
              <Wallet size={20} /> <span>Ví & Thanh toán</span>
            </NavLink>

            <NavLink to="/customer/support" className={navLinkClasses}>
              <Headphones size={20} /> <span>Hỗ trợ</span>
            </NavLink>
          </div>

          {/* GROUP 3: TÀI KHOẢN */}
          <div>
            <p className="px-4 mb-2 text-[10px] font-bold text-blue-200/50 uppercase tracking-widest">
              Cài đặt
            </p>
            <nav className="flex flex-col space-y-1">
              <NavLink to="/customer/profile" className={navLinkClasses}>
                <User size={18} /> <span>Hồ sơ cá nhân</span>
              </NavLink>
              <NavLink to="/customer/support" className={navLinkClasses}>
                <Headphones size={18} /> <span>Hỗ trợ & Khiếu nại</span>
              </NavLink>
            </nav>
          </div>
        </div>

        {/* User Profile Footer */}
        <div className="p-4 bg-[#0d2f36] border-t border-white/5">
          <div className="flex items-center justify-between p-3 rounded-xl bg-white/5 border border-white/5 hover:bg-white/10 transition-colors cursor-pointer group">
            <div className="flex items-center gap-3 overflow-hidden">
              <div className="w-9 h-9 rounded-full bg-gradient-to-br from-orange-400 to-red-500 flex items-center justify-center text-sm font-bold text-white shadow-inner shrink-0">
                {username.charAt(0).toUpperCase()}
              </div>
              <div className="overflow-hidden">
                <h4 className="text-sm font-bold text-white truncate max-w-[100px] group-hover:text-orange-400 transition-colors">
                  {username}
                </h4>
                <p className="text-[10px] text-blue-200">Thành viên Bạc</p>
              </div>
            </div>
            <button
              onClick={handleLogout}
              className="text-blue-200 hover:text-red-400 transition-colors"
            >
              <LogOut size={18} />
            </button>
          </div>
        </div>
      </aside>

      {/* --- MAIN CONTENT --- */}
      <div className="flex-1 flex flex-col min-w-0">
        <header className="h-16 bg-white shadow-sm border-b border-gray-100 flex items-center justify-between px-8 z-10 sticky top-0">
          <div>
            <h2 className="text-xl font-extrabold text-[#113e48]">
              {getPageTitle()}
            </h2>
          </div>
          <div className="flex items-center gap-4">
            <button className="p-2 text-gray-400 hover:text-orange-500 hover:bg-orange-50 rounded-full transition-all relative">
              <Bell size={20} />
              <span className="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full border border-white animate-pulse"></span>
            </button>
            <div className="h-6 w-[1px] bg-gray-200"></div>
            <button
              onClick={() => navigate("/")}
              className="flex items-center gap-1 text-xs font-bold text-[#113e48] hover:text-orange-600 transition-colors px-3 py-1.5 rounded-lg hover:bg-gray-50"
            >
              Trang chủ <ChevronRight size={14} />
            </button>
          </div>
        </header>

        <main className="flex-1 overflow-x-hidden overflow-y-auto bg-[#F8FAFC] p-6 md:p-8 scroll-smooth">
          <div className="max-w-7xl mx-auto min-h-full">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
}
