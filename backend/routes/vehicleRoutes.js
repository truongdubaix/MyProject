import express from "express";
import {
  getAllVehicles,
  getAvailableVehicles, // Thêm hàm này vào route nếu cần dùng riêng
  createVehicle,
  updateVehicle,
  deleteVehicle,
} from "../controllers/vehicleController.js";

const router = express.Router();

router.get("/", getAllVehicles);
router.get("/available", getAvailableVehicles); // API lấy xe rảnh
router.post("/", createVehicle);
router.put("/:id", updateVehicle);
router.delete("/:id", deleteVehicle);

export default router;
