import { NavLink, Outlet, useNavigate, useLocation } from "react-router-dom";
import {
  LogOut,
  Home,
  PlusCircle,
  Search,
  Clock,
  User,
  LayoutDashboard,
  ChevronRight,
  Bell,
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

  // Style cho Link: Sử dụng màu Cam thương hiệu khi Active
  const navLinkClasses = ({ isActive }) => `
    flex items-center gap-3 px-4 py-3.5 text-sm font-medium rounded-xl transition-all duration-300 group
    ${
      isActive
        ? "bg-orange-500 text-white shadow-lg shadow-orange-500/30 translate-x-1" // Active: Màu cam nổi bật
        : "text-blue-100 hover:bg-white/10 hover:text-white" // Inactive: Màu trắng mờ
    }
  `;

  // Title Header
  const getPageTitle = () => {
    switch (location.pathname) {
      case "/customer":
        return "Tổng quan dashboard";
      case "/customer/create":
        return "Tạo đơn hàng mới";
      case "/customer/track":
        return "Tra cứu vận đơn";
      case "/customer/history":
        return "Lịch sử đơn hàng";
      case "/customer/profile":
        return "Hồ sơ cá nhân";
      default:
        return "Bảng điều khiển";
    }
  };

  return (
    <div className="flex h-screen bg-[#F8FAFC] overflow-hidden font-sans">
      {/* --- SIDEBAR (Màu Xanh Dự Án #113e48) --- */}
      <aside className="w-72 bg-[#113e48] text-white flex flex-col shadow-2xl relative z-20">
        {/* 1. Brand Logo */}
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

        {/* 2. Navigation Menu */}
        <div className="flex-1 overflow-y-auto py-8 px-4 space-y-1 custom-scrollbar">
          <p className="px-4 mb-4 text-xs font-bold text-blue-200/60 uppercase tracking-widest">
            Main Menu
          </p>

          <nav className="flex flex-col space-y-1.5">
            <NavLink to="/customer" end className={navLinkClasses}>
              <Home size={20} /> <span>Tổng quan</span>
            </NavLink>

            <NavLink to="/customer/create" className={navLinkClasses}>
              <PlusCircle size={20} /> <span>Tạo đơn hàng</span>
            </NavLink>

            <NavLink to="/customer/track" className={navLinkClasses}>
              <Search size={20} /> <span>Tra cứu đơn</span>
            </NavLink>

            <NavLink to="/customer/history" className={navLinkClasses}>
              <Clock size={20} /> <span>Lịch sử đơn</span>
            </NavLink>

            <p className="px-4 mt-8 mb-4 text-xs font-bold text-blue-200/60 uppercase tracking-widest">
              Cài đặt & Tài khoản
            </p>
            <NavLink to="/customer/profile" className={navLinkClasses}>
              <User size={20} /> <span>Hồ sơ cá nhân</span>
            </NavLink>
          </nav>
        </div>

        {/* 3. User Profile (Bottom) - Nền tối hơn chút */}
        <div className="p-4 bg-[#0d2f36] border-t border-white/5">
          <div className="flex items-center justify-between p-3 rounded-xl bg-white/5 border border-white/5">
            <div className="flex items-center gap-3 overflow-hidden">
              {/* Avatar */}
              <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-400 to-red-500 flex items-center justify-center text-sm font-bold text-white shadow-inner shrink-0">
                {username.charAt(0).toUpperCase()}
              </div>
              <div className="overflow-hidden">
                <h4 className="text-sm font-bold text-white truncate max-w-[100px]">
                  {username}
                </h4>
                <p className="text-[10px] text-blue-200">Thành viên</p>
              </div>
            </div>

            <button
              onClick={handleLogout}
              className="p-2 text-blue-200 hover:text-white hover:bg-red-500/20 rounded-lg transition-colors"
              title="Đăng xuất"
            >
              <LogOut size={18} />
            </button>
          </div>
        </div>
      </aside>

      {/* --- MAIN CONTENT --- */}
      <div className="flex-1 flex flex-col min-w-0">
        {/* Header Bar */}
        <header className="h-20 bg-white shadow-sm border-b border-gray-100 flex items-center justify-between px-8 z-10">
          {/* Title Page */}
          <div>
            <h2 className="text-2xl font-extrabold text-[#113e48]">
              {getPageTitle()}
            </h2>
            <p className="text-xs text-gray-400 mt-1">
              Quản lý vận đơn chuyên nghiệp
            </p>
          </div>

          {/* Right Actions */}
          <div className="flex items-center gap-4">
            <button className="p-2 text-gray-400 hover:text-orange-500 hover:bg-orange-50 rounded-full transition-all relative">
              <Bell size={20} />
              <span className="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full border border-white"></span>
            </button>
            <div className="h-8 w-[1px] bg-gray-200"></div>
            <button
              onClick={() => navigate("/")}
              className="flex items-center gap-2 text-sm font-bold text-[#113e48] hover:text-orange-600 transition-colors px-4 py-2 rounded-lg hover:bg-gray-50"
            >
              Trang chủ <ChevronRight size={16} />
            </button>
          </div>
        </header>

        {/* Content Outlet */}
        <main className="flex-1 overflow-x-hidden overflow-y-auto bg-[#F8FAFC] p-6 md:p-10 scroll-smooth">
          <div className="max-w-7xl mx-auto min-h-full">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
}
