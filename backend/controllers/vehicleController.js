import db from "../config/db.js";

// ==========================================
// 1. LẤY DỮ LIỆU XE
// ==========================================

export const getAllVehicles = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        v.id, 
        v.plate_no, 
        v.type, 
        v.capacity_kg,  -- ✅ Sửa đúng tên cột trong DB
        v.status,
        d.name AS driver_name
      FROM vehicles v
      LEFT JOIN drivers d ON d.vehicle_id = v.id
      ORDER BY v.id DESC
    `);

    // Map lại key để frontend dễ dùng (capacity_kg -> capacity) nếu muốn,
    // hoặc frontend dùng trực tiếp capacity_kg
    const data = rows.map((r) => ({
      ...r,
      capacity: r.capacity_kg, // Frontend đang dùng .capacity nên map lại cho khớp
    }));

    res.json(data);
  } catch (error) {
    console.error("❌ Lỗi getAllVehicles:", error);
    res.status(500).json({ message: "Lỗi khi lấy danh sách xe" });
  }
};

export const getAvailableVehicles = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT v.*, v.capacity_kg AS capacity -- ✅ Alias về capacity cho khớp frontend
      FROM vehicles v
      LEFT JOIN drivers d ON d.vehicle_id = v.id
      WHERE d.vehicle_id IS NULL AND v.status = 'available'
      ORDER BY v.id DESC
    `);
    res.json(rows);
  } catch (error) {
    console.error("❌ Lỗi getAvailableVehicles:", error);
    res.status(500).json({ message: "Lỗi khi lấy danh sách xe trống" });
  }
};

// ==========================================
// 2. CHỨC NĂNG THÊM / SỬA / XÓA (CRUD)
// ==========================================

// 🔹 Thêm xe mới
export const createVehicle = async (req, res) => {
  try {
    // Frontend gửi lên: { plate_no, type, capacity, status }
    const { plate_no, type, capacity, status } = req.body;

    // Validate cơ bản
    if (!plate_no || !type) {
      return res
        .status(400)
        .json({ message: "Thiếu thông tin biển số hoặc loại xe" });
    }

    // Kiểm tra biển số trùng
    const [exist] = await db.query(
      "SELECT id FROM vehicles WHERE plate_no = ?",
      [plate_no]
    );
    if (exist.length > 0) {
      return res.status(400).json({ message: "Biển số xe đã tồn tại!" });
    }

    // Xử lý capacity (nếu rỗng thì cho = 0)
    const capValue = capacity ? parseFloat(capacity) : 0;

    // ✅ SỬA: Đổi 'capacity' thành 'capacity_kg' trong câu INSERT
    await db.query(
      "INSERT INTO vehicles (plate_no, type, capacity_kg, status, created_at) VALUES (?, ?, ?, ?, NOW())",
      [plate_no, type, capValue, status || "available"]
    );

    res.json({ message: "✅ Thêm phương tiện thành công" });
  } catch (err) {
    console.error("❌ Lỗi createVehicle:", err); // Xem log này trong terminal VS Code để biết chi tiết lỗi
    res.status(500).json({ message: "Lỗi khi thêm xe: " + err.message });
  }
};

// 🔹 Cập nhật thông tin xe
export const updateVehicle = async (req, res) => {
  try {
    const { plate_no, type, capacity, status } = req.body;
    const { id } = req.params;

    // Kiểm tra biển số trùng (nếu thay đổi biển số)
    const [exist] = await db.query(
      "SELECT id FROM vehicles WHERE plate_no = ? AND id != ?",
      [plate_no, id]
    );
    if (exist.length > 0)
      return res.status(400).json({ message: "Biển số xe đã tồn tại!" });

    const capValue = capacity ? parseFloat(capacity) : 0;

    // ✅ SỬA: Đổi 'capacity' thành 'capacity_kg'
    await db.query(
      "UPDATE vehicles SET plate_no=?, type=?, capacity_kg=?, status=?, updated_at=NOW() WHERE id=?",
      [plate_no, type, capValue, status, id]
    );

    res.json({ message: "✅ Cập nhật xe thành công" });
  } catch (err) {
    console.error("❌ Lỗi updateVehicle:", err);
    res.status(500).json({ message: "Lỗi khi cập nhật xe" });
  }
};

// 🔹 Xóa xe
export const deleteVehicle = async (req, res) => {
  try {
    const { id } = req.params;

    // Kiểm tra xe đang được dùng không
    const [driver] = await db.query(
      "SELECT id, name FROM drivers WHERE vehicle_id = ?",
      [id]
    );
    if (driver.length > 0) {
      return res.status(400).json({
        message: `Không thể xóa! Xe đang được sử dụng bởi tài xế: ${driver[0].name}`,
      });
    }

    await db.query("DELETE FROM vehicles WHERE id=?", [id]);
    res.json({ message: "🗑️ Đã xóa phương tiện" });
  } catch (err) {
    console.error("❌ Lỗi deleteVehicle:", err);
    res.status(500).json({ message: "Lỗi khi xóa xe" });
  }
};
