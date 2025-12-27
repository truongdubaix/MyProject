import express from "express";
import {
  getAllPayments,
  createPayment,
  createMomoPayment,
  createWalletDepositMomo,
  momoIPN,
  updatePaymentStatus,
  deletePayment,
  payShipmentByWallet,
} from "../controllers/paymentController.js";

const router = express.Router();

// ==========================================
// 1. CÁC ROUTES QUẢN LÝ THANH TOÁN CHUNG
// ==========================================
// Lấy tất cả lịch sử thanh toán
router.get("/", getAllPayments);

// Tạo thanh toán thủ công (COD/Tiền mặt)
router.post("/", createPayment);

// Cập nhật trạng thái thanh toán thủ công (Pending -> Completed)
router.put("/:id", updatePaymentStatus);

// Xóa thanh toán
router.delete("/:id", deletePayment);

// ==========================================
// 2. CÁC ROUTES LIÊN QUAN ĐẾN MOMO
// ==========================================

// A. Thanh toán đơn hàng vận chuyển (Shipment)
// Frontend gọi: API.post("/payments/momo", { shipment_id, ... })
router.post("/momo", createMomoPayment);

// B. Nạp tiền vào Ví (Wallet Deposit) - TÍNH NĂNG MỚI
// Frontend gọi: API.post("/payments/momo-deposit", { wallet_id, amount })
router.post("/momo-deposit", createWalletDepositMomo);

// C. Callback IPN (MoMo gọi ngược về Server để báo kết quả)
router.post("/momo/callback", momoIPN);

// 3. Thanh Toán Bằng tiền Ví
router.post("/wallet-pay", payShipmentByWallet);

export default router;
