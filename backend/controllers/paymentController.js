import db from "../config/db.js";
import crypto from "crypto";
import axios from "axios";

// ============================================================
// 1. LẤY DANH SÁCH THANH TOÁN (ADMIN/QUẢN LÝ)
// ============================================================
export const getAllPayments = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT p.*, s.tracking_code, u.name AS customer_name
      FROM payments p
      JOIN shipments s ON p.shipment_id = s.id
      JOIN users u ON p.customer_id = u.id
      ORDER BY p.created_at DESC
    `);
    res.json(rows);
  } catch (err) {
    console.error("❌ Lỗi lấy danh sách thanh toán:", err);
    res.status(500).json({ message: "Lỗi server" });
  }
};

// ============================================================
// 2. TẠO THANH TOÁN THƯỜNG (TIỀN MẶT/COD)
// ============================================================
export const createPayment = async (req, res) => {
  try {
    const { shipment_id, customer_id, amount, method } = req.body;
    await db.query("UPDATE shipments SET payment_method = ? WHERE id = ?", [
      method,
      shipment_id,
    ]);

    await db.query(
      "INSERT INTO payments (shipment_id, customer_id, amount, method, status) VALUES (?, ?, ?, ?, 'pending')",
      [shipment_id, customer_id, amount, method]
    );
    res.json({ message: "✅ Tạo thanh toán thành công" });
  } catch (err) {
    console.error("❌ Lỗi tạo thanh toán:", err);
    res.status(500).json({ message: "Lỗi server khi tạo thanh toán" });
  }
};

// ============================================================
// 3. THANH TOÁN MOMO CHO ĐƠN HÀNG (SHIPMENT)
// ============================================================
export const createMomoPayment = async (req, res) => {
  try {
    const { shipment_id, customer_id, amount } = req.body;
    if (!shipment_id || !customer_id || !amount)
      return res.status(400).json({ error: "Thiếu dữ liệu thanh toán" });
    await db.query(
      "UPDATE shipments SET payment_method = 'MOMO' WHERE id = ?",
      [shipment_id]
    );
    // Config MoMo Sandbox
    const partnerCode = "MOMO";
    const accessKey = "F8BBA842ECF85";
    const secretKey = "K951B6PE1waDMi640xX08PD3vg6EkVlz";

    // Prefix SHIP để phân biệt
    const orderId = `SHIP${Date.now()}`;
    const requestId = orderId;
    const orderInfo = `Thanh toán vận đơn #${shipment_id}`;
    const redirectUrl = `http://localhost:5173/customer/payment-success?orderId=${orderId}&type=shipment`;
    const ipnUrl = "http://localhost:5000/api/payments/momo/callback";
    const requestType = "captureWallet";

    const rawSignature = `accessKey=${accessKey}&amount=${amount}&extraData=&ipnUrl=${ipnUrl}&orderId=${orderId}&orderInfo=${orderInfo}&partnerCode=${partnerCode}&redirectUrl=${redirectUrl}&requestId=${requestId}&requestType=${requestType}`;

    const signature = crypto
      .createHmac("sha256", secretKey)
      .update(rawSignature)
      .digest("hex");

    const body = {
      partnerCode,
      accessKey,
      requestId,
      amount,
      orderId,
      orderInfo,
      redirectUrl,
      ipnUrl,
      requestType,
      signature,
      extraData: "",
    };

    // Gọi MoMo API
    const momoRes = await axios.post(
      "https://test-payment.momo.vn/v2/gateway/api/create",
      body
    );

    // Lưu vào bảng payments (Shipment)
    await db.query(
      `INSERT INTO payments (order_id, shipment_id, customer_id, amount, method, status) VALUES (?, ?, ?, ?, ?, 'pending')`,
      [orderId, shipment_id, customer_id, amount, "Momo"]
    );

    res.json({ ...momoRes.data, payUrl: momoRes.data.payUrl });
  } catch (err) {
    console.error("❌ MoMo Shipment error:", err.message);
    res.status(500).json({ error: "Lỗi tạo thanh toán MoMo" });
  }
};

// ============================================================
// 4. NẠP TIỀN VÀO VÍ (WALLET DEPOSIT) - TÍNH NĂNG MỚI
// ============================================================
export const createWalletDepositMomo = async (req, res) => {
  try {
    const { wallet_id, amount } = req.body;

    if (!wallet_id || !amount)
      return res.status(400).json({ error: "Thiếu dữ liệu nạp tiền" });

    // Config MoMo Sandbox
    const partnerCode = "MOMO";
    const accessKey = "F8BBA842ECF85";
    const secretKey = "K951B6PE1waDMi640xX08PD3vg6EkVlz";

    // Prefix WALLET để phân biệt với SHIP
    const orderId = `WALLET${Date.now()}`;
    const requestId = orderId;
    const orderInfo = `Nạp tiền vào ví #${wallet_id}`;

    // Redirect về trang Ví trên Frontend
    const redirectUrl = `http://localhost:5173/customer/wallet?orderId=${orderId}&resultCode=0&type=wallet`;
    const ipnUrl = "http://localhost:5000/api/payments/momo/callback"; // Dùng chung callback
    const requestType = "captureWallet";

    // Tạo chữ ký
    const rawSignature = `accessKey=${accessKey}&amount=${amount}&extraData=&ipnUrl=${ipnUrl}&orderId=${orderId}&orderInfo=${orderInfo}&partnerCode=${partnerCode}&redirectUrl=${redirectUrl}&requestId=${requestId}&requestType=${requestType}`;
    const signature = crypto
      .createHmac("sha256", secretKey)
      .update(rawSignature)
      .digest("hex");

    const body = {
      partnerCode,
      accessKey,
      requestId,
      amount,
      orderId,
      orderInfo,
      redirectUrl,
      ipnUrl,
      requestType,
      signature,
      extraData: "",
    };

    // Gọi API MoMo
    const momoRes = await axios.post(
      "https://test-payment.momo.vn/v2/gateway/api/create",
      body
    );

    // 🧾 Lưu vào bảng TRANSACTIONS (Ví) với trạng thái pending
    // LƯU Ý: Bảng transactions phải có cột order_id (VARCHAR) để đối soát
    await db.query(
      `INSERT INTO transactions (order_id, wallet_id, type, amount, description, status) 
       VALUES (?, ?, 'deposit', ?, ?, 'pending')`,
      [orderId, wallet_id, amount, `Nạp tiền qua MoMo #${orderId}`]
    );

    res.json({ ...momoRes.data, payUrl: momoRes.data.payUrl });
  } catch (err) {
    console.error("❌ MoMo Deposit error:", err.message);
    res.status(500).json({ error: "Lỗi tạo giao dịch nạp tiền" });
  }
};

// ============================================================
// 5. XỬ LÝ CALLBACK (IPN) - TỰ ĐỘNG CỘNG TIỀN/CẬP NHẬT TRẠNG THÁI
// ============================================================
export const momoIPN = async (req, res) => {
  try {
    const { orderId, resultCode } = req.body;
    if (!orderId) return res.status(400).json({ message: "Thiếu orderId" });

    const status = resultCode === 0 ? "success" : "failed";

    // 🟢 TRƯỜNG HỢP 1: THANH TOÁN SHIPMENT (SHIP...)
    if (orderId.startsWith("SHIP")) {
      await db.query("UPDATE payments SET status=? WHERE order_id=?", [
        status === "success" ? "completed" : "failed",
        orderId,
      ]);
      console.log(`📦 Đơn hàng ${orderId}: ${status}`);
    }

    // 🟢 TRƯỜNG HỢP 2: NẠP TIỀN VÍ (WALLET...)
    else if (orderId.startsWith("WALLET")) {
      // A. Cập nhật trạng thái transaction
      await db.query("UPDATE transactions SET status=? WHERE order_id=?", [
        status,
        orderId,
      ]);
      console.log(`💰 Giao dịch ví ${orderId}: ${status}`);

      // B. Nếu thành công -> CỘNG TIỀN VÀO VÍ THẬT
      if (status === "success") {
        // Lấy thông tin giao dịch để biết nạp bao nhiêu và vào ví nào
        const [trans] = await db.query(
          "SELECT wallet_id, amount FROM transactions WHERE order_id = ?",
          [orderId]
        );

        // Chỉ cộng tiền nếu tìm thấy giao dịch
        if (trans.length > 0) {
          const { wallet_id, amount } = trans[0];

          // Thực hiện cộng tiền
          await db.query(
            "UPDATE wallets SET balance = balance + ? WHERE id = ?",
            [amount, wallet_id]
          );
          console.log(`✅ Đã cộng ${amount} VND vào ví ID ${wallet_id}`);
        }
      }
    }

    // Auto redirect (Cho môi trường Dev localhost để trải nghiệm mượt hơn)
    if (process.env.NODE_ENV !== "production") {
      let redirectUrl = "";
      if (orderId.startsWith("WALLET")) {
        redirectUrl = `http://localhost:5173/customer/wallet?orderId=${orderId}&resultCode=${resultCode}`;
      } else {
        redirectUrl = `http://localhost:5173/customer/payment-success?orderId=${orderId}&resultCode=${resultCode}`;
      }

      // Delay nhỏ để đảm bảo DB cập nhật xong trước khi redirect
      setTimeout(() => {
        res.redirect(redirectUrl);
      }, 1500);
      return;
    }

    res.json({ message: "IPN received", orderId, status });
  } catch (err) {
    console.error("❌ Lỗi IPN:", err);
    res.status(500).json({ message: "Lỗi xử lý IPN" });
  }
};

// ============================================================
// 6. CẬP NHẬT TRẠNG THÁI THỦ CÔNG & XÓA
// ============================================================
export const updatePaymentStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    await db.query("UPDATE payments SET status = ? WHERE id = ?", [status, id]);
    res.json({ message: "✅ Cập nhật trạng thái thành công" });
  } catch (err) {
    console.error("❌ Lỗi cập nhật thanh toán:", err);
    res.status(500).json({ message: "Lỗi server khi cập nhật" });
  }
};

export const deletePayment = async (req, res) => {
  try {
    const { id } = req.params;
    await db.query("DELETE FROM payments WHERE id = ?", [id]);
    res.json({ message: "🗑️ Đã xóa thanh toán" });
  } catch (err) {
    console.error("❌ Lỗi xóa thanh toán:", err);
    res.status(500).json({ message: "Lỗi server khi xóa thanh toán" });
  }
};

// --- 7. THANH TOÁN ĐƠN HÀNG BẰNG VÍ ---
export const payShipmentByWallet = async (req, res) => {
  const { shipment_id, user_id, amount } = req.body;
  let connection; // 1. Khai báo biến kết nối

  try {
    // 2. Lấy 1 kết nối cụ thể từ Pool
    connection = await db.getConnection();

    // 3. Bắt đầu Transaction trên kết nối này
    await connection.beginTransaction();

    // --- Bắt đầu thực hiện các truy vấn (Dùng 'connection' thay vì 'db') ---

    // A. Lấy thông tin ví (để check số dư)
    // Lưu ý: Dùng `FOR UPDATE` để khóa dòng này lại tránh xung đột nếu có nhiều request cùng lúc
    const [wallets] = await connection.query(
      "SELECT * FROM wallets WHERE user_id = ? FOR UPDATE",
      [user_id]
    );

    if (wallets.length === 0) {
      await connection.rollback(); // Hoàn tác nếu lỗi logic
      return res.status(404).json({ error: "Không tìm thấy ví" });
    }

    const wallet = wallets[0];

    // B. Kiểm tra số dư
    if (Number(wallet.balance) < Number(amount)) {
      await connection.rollback();
      return res.status(400).json({ error: "Số dư ví không đủ để thanh toán" });
    }

    // C. Trừ tiền ví
    await connection.query(
      "UPDATE wallets SET balance = balance - ?, updated_at = NOW() WHERE id = ?",
      [amount, wallet.id]
    );

    // D. Lưu lịch sử giao dịch ví
    const transactionId = `TRANS${Date.now()}`;
    await connection.query(
      "INSERT INTO transactions (wallet_id, order_id, amount, type, description, status, created_at) VALUES (?, ?, ?, 'payment', ?, 'success', NOW())",
      [wallet.id, transactionId, amount, `Thanh toán đơn hàng #${shipment_id}`]
    );

    // E. Cập nhật trạng thái đơn hàng (shipments) -> Đã thanh toán (Wallet)
    await connection.query(
      "UPDATE shipments SET payment_method = 'WALLET', status = 'pending' WHERE id = ?",
      [shipment_id]
    );

    // F. Lưu vào bảng payments (Để thống kê)
    await connection.query(
      "INSERT INTO payments (shipment_id, customer_id, amount, method, status, order_id) VALUES (?, ?, ?, 'WALLET', 'completed', ?)",
      [shipment_id, user_id, amount, transactionId]
    );

    // 4. Commit (Lưu tất cả thay đổi)
    await connection.commit();

    res.json({ message: "Thanh toán thành công", transactionId });
  } catch (err) {
    // 5. Rollback (Hoàn tác nếu có lỗi sập server hoặc SQL sai)
    if (connection) await connection.rollback();

    console.error("Lỗi thanh toán ví:", err);
    res.status(500).json({ error: "Lỗi xử lý thanh toán ví" });
  } finally {
    // 6. Trả kết nối về Pool (Rất quan trọng, nếu quên sẽ bị treo server)
    if (connection) connection.release();
  }
};
