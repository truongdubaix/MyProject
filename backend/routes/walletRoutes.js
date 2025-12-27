import express from "express";
// 👇 Import cụ thể từng hàm (Nhớ có đuôi .js)
import {
  getWallet,
  getTransactions,
  depositMoney,
} from "../controllers/walletController.js";

const router = express.Router();

// 1. Lấy thông tin ví & số dư (Dựa theo User ID)
router.get("/:user_id", getWallet);

// 2. Lấy lịch sử giao dịch (Dựa theo Wallet ID)
router.get("/transactions/:wallet_id", getTransactions);

// 3. Nạp tiền vào ví
router.post("/deposit", depositMoney);

export default router;
