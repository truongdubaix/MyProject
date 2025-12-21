import express from "express";
import {
  getAllShipments,
  getShipmentById,
  createShipment,
  updateShipment,
  deleteShipment,
  assignShipment,
  getShipmentByCode,
  publicTracking,
} from "../controllers/shipmentController.js";

const router = express.Router();

// CRUD
router.get("/", getAllShipments);
router.get("/:id", getShipmentById);
router.post("/", createShipment);
router.put("/:id", updateShipment);
router.delete("/:id", deleteShipment);

// Dispatcher
router.post("/assign", assignShipment);

// Customer tracking (login)
router.get("/track/:code", getShipmentByCode);

// ✅ Guest tracking (PUBLIC)
router.get("/tracking", publicTracking);

export default router;
