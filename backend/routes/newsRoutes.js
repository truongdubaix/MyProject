import express from "express";
import { getAllNews, getNewsById, createNews, updateNews, deleteNews } from "../controllers/newsController.js";
import upload, { handleUploadResponse } from "../middlewares/upload.js";
// import verifyToken from "../middlewares/authMiddleware.js";
// NÊU BẠN CÓ ROLE MIDDLEWARE THÌ DÙNG, TẠM THỜI MÌNH KHÔNG KIỂM TRA QUYỀN TRÊN ROUTE ĐỂ CODE NHANH,
// NHƯNG PUBLIC API THÌ KHÔNG GET ĐƯỢC VẤN ĐỀ

const router = express.Router();

router.get("/", getAllNews);
router.get("/:id", getNewsById);
router.post("/", upload.single("imageFile"), createNews); 
router.put("/:id", upload.single("imageFile"), updateNews);
router.delete("/:id", deleteNews);

// Mới thêm: route để upload ảnh trực tiếp (cho Quill editor)
router.post("/upload-image", upload.single("image"), handleUploadResponse);

export default router;
