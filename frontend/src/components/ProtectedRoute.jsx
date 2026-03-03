import { Navigate, Outlet } from "react-router-dom";

// 👇 Thêm props 'children' vào đây
const ProtectedRoute = ({ allowedRoles, children }) => {
  const token = localStorage.getItem("token");
  const rawRole = localStorage.getItem("role");
  const userRole = rawRole ? rawRole.trim().toLowerCase() : "";

  // 1. Kiểm tra đăng nhập
  if (!token) {
    return <Navigate to="/login" replace />;
  }

  // 2. Kiểm tra quyền
  if (allowedRoles && !allowedRoles.includes(userRole)) {
    return <Navigate to="/unauthorized" replace />;
  }

  // 3. 👇 SỬA ĐOẠN NÀY: Ưu tiên render children (Layout) nếu có
  return children ? children : <Outlet />;
};

export default ProtectedRoute;
