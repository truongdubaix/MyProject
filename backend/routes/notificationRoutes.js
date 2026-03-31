import express from "express";
import {
  getDriverNotifications,
  getDispatcherNotifications,
  getCustomerNotifications,
  markNotificationRead,
  markAllCustomerRead,
} from "../controllers/notificationController.js";

const router = express.Router();

// Lấy thông báo cho DRIVER
router.get("/driver/:id", getDriverNotifications);

// Lấy thông báo cho DISPATCHER
router.get("/dispatcher/:id", getDispatcherNotifications);

// Lấy thông báo cho CUSTOMER
router.get("/customer/:id", getCustomerNotifications);

// Đánh dấu đã đọc
router.put("/:id/read", markNotificationRead);

// Đánh dấu tất cả đã đọc cho customer
router.put("/customer/:id/read-all", markAllCustomerRead);

export default router;
