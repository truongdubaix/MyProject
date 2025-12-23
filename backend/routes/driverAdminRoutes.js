import express from "express";
import {
  getAllDrivers,
  getDriverById,
  createDriver,
  updateDriver,
  deleteDriver,
  updateDriverStatus,
  assignVehicleToDriver,
  getDriverApplications,
  approveApplication,
  rejectApplication,
  // applyDriver,
} from "../controllers/driverAdminController.js";

const router = express.Router();

// ==========================================
// 1. QUẢN LÝ HỒ SƠ ỨNG VIÊN (APPLICATIONS)
// ❗ Quan trọng: Đặt route này TRƯỚC route /:id để tránh conflict
// ==========================================

// Lấy danh sách hồ sơ đang chờ/đã duyệt
router.get("/applications", getDriverApplications);

// Duyệt hồ sơ → Tạo tài xế thật
router.post("/applications/:id/approve", approveApplication);

// Từ chối hồ sơ
router.post("/applications/:id/reject", rejectApplication);

// ==========================================
// 2. QUẢN LÝ TÀI XẾ (CRUD)
// ==========================================

// Lấy danh sách tất cả tài xế
router.get("/", getAllDrivers);

// Lấy chi tiết 1 tài xế
router.get("/:id", getDriverById);

// Thêm tài xế mới (Thủ công bởi Admin)
router.post("/", createDriver);

// Sửa thông tin tài xế
router.put("/:id", updateDriver);

// Xóa tài xế
router.delete("/:id", deleteDriver);

// Cập nhật trạng thái (Rảnh/Bận)
router.patch("/:id/status", updateDriverStatus);

// ✨ GÁN XE CHO TÀI XẾ (MỚI)
router.put("/:id/vehicle", assignVehicleToDriver);

export default router;
