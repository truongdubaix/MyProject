import db from "../config/db.js";

// GET: Lấy danh sách tin tức
export const getAllNews = async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT * FROM news ORDER BY created_at DESC"
    );
    res.json(rows);
  } catch (error) {
    console.error("Lỗi lấy danh sách tin tức:", error);
    res.status(500).json({ message: "Lỗi server khi lấy tin tức" });
  }
};

// GET: Lấy chi tiết 1 bài tin tức
export const getNewsById = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.query("SELECT * FROM news WHERE id = ?", [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: "Không tìm thấy bài viết" });
    }
    
    // Tùy chọn: Tăng view_count nếu có cột đó
    // await db.query("UPDATE news SET views = views + 1 WHERE id = ?", [id]);

    res.json(rows[0]);
  } catch (error) {
    console.error("Lỗi lấy chi tiết tin tức:", error);
    res.status(500).json({ message: "Lỗi server khi tải bài viết" });
  }
};

// POST: Tạo tin tức mới
export const createNews = async (req, res) => {
  const { title, desc, content, author } = req.body;
  // Lấy ảnh từ URL cũ (nếu có push string) hoặc dùng file upload bằng multer
  let image = req.body.image || ""; 
  
  if (req.file) {
    // Multer đặt tên file cục bộ, ta thêm prefix /uploads
    // vd: /uploads/news-123456.jpg
    image = `/uploads/${req.file.filename}`;
  }

  if (!title) {
    return res.status(400).json({ message: "Thiếu tiêu đề (title)" });
  }
  
  try {
    const [result] = await db.query(
      "INSERT INTO news (title, \`desc\`, content, image, author) VALUES (?, ?, ?, ?, ?)",
      [title, desc || "", content || "", image, author || "Admin"]
    );
    res.status(201).json({ 
      message: "Tạo tin tức thành công", 
      id: result.insertId 
    });
  } catch (error) {
    console.error("Lỗi tạo tin tức:", error);
    res.status(500).json({ message: "Lỗi server khi tạo tin tức" });
  }
};

// PUT: Cập nhật tin tức
export const updateNews = async (req, res) => {
  const { id } = req.params;
  const { title, desc, content, author } = req.body;
  
  // Dữ liệu image cũ từ form (nếu người dùng ko upload file mới, string URL cũ vẫn được gởi lên)
  let image = req.body.image || "";
  if (req.file) {
    // Người dùng upload 1 file mới -> Lấy file đó thay thế
    image = `/uploads/${req.file.filename}`;
  }
  
  if (!title) {
    return res.status(400).json({ message: "Thiếu tiêu đề (title)" });
  }
  
  try {
    const [result] = await db.query(
      "UPDATE news SET title=?, \`desc\`=?, content=?, image=?, author=? WHERE id=?",
      [title, desc || "", content || "", image, author || "Admin", id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Không tìm thấy tin tức" });
    }
    res.json({ message: "Cập nhật tin tức thành công" });
  } catch (error) {
    console.error("Lỗi cập nhật tin tức:", error);
    res.status(500).json({ message: "Lỗi server khi cập nhật tin tức" });
  }
};

// DELETE: Xóa tin tức
export const deleteNews = async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await db.query("DELETE FROM news WHERE id=?", [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Không tìm thấy tin tức" });
    }
    res.json({ message: "Xóa tin tức thành công" });
  } catch (error) {
    console.error("Lỗi xóa tin tức:", error);
    res.status(500).json({ message: "Lỗi server khi xóa tin tức" });
  }
};
