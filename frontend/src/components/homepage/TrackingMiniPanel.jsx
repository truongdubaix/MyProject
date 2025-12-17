import React from "react";
import { useChat } from "../../hooks/useChat.js";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faMagnifyingGlass,
  faComments,
  faCircleNotch,
} from "@fortawesome/free-solid-svg-icons";
import { motion, AnimatePresence } from "framer-motion";

export default function TrackingMiniPanel({
  trackingCode,
  setTrackingCode,
  shipment,
  loading,
  error,
  handleTrack,
  getStatusDisplay,
}) {
  const { openSupportChat } = useChat();

  return (
    <motion.div
      // --- 1. HIỆU ỨNG NHẢY VÀO (Entrance Animation) ---
      initial={{ scale: 0.8, opacity: 0, y: 50 }}
      animate={{ scale: 1, opacity: 1, y: 0 }}
      transition={{
        type: "spring",
        stiffness: 260,
        damping: 20,
        delay: 0.3, // Xuất hiện sau các element khác một chút
      }}
      className="
        w-[360px]
        bg-[#113e48]/90 backdrop-blur-xl
        border border-white/20
        rounded-2xl
        p-6 space-y-5
        shadow-[0_20px_50px_rgba(0,0,0,0.5)]
        relative overflow-hidden
      "
    >
      {/* Họa tiết trang trí nền mờ */}
      <div className="absolute top-0 right-0 w-40 h-40 bg-orange-500/20 rounded-full blur-[50px] pointer-events-none -translate-y-1/2 translate-x-1/2"></div>

      <h2 className="text-xl font-bold text-white flex items-center gap-2 relative z-10">
        <FontAwesomeIcon icon={faMagnifyingGlass} className="text-orange-500" />
        Tra cứu đơn hàng
      </h2>

      <div className="space-y-3 relative z-10">
        <input
          value={trackingCode}
          onChange={(e) => setTrackingCode(e.target.value)}
          placeholder="Ví dụ: SP123456"
          className="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-gray-400
                     focus:ring-2 focus:ring-orange-500 focus:border-transparent outline-none transition-all shadow-inner"
        />

        {/* --- NÚT TRA CỨU (PRIMARY BUTTON) --- */}
        <button
          onClick={handleTrack}
          disabled={loading}
          className="
            relative overflow-hidden group 
            w-full py-3 rounded-xl 
            font-bold uppercase tracking-wide 
            bg-orange-500 text-white 
            hover:bg-orange-600 
            transition-all duration-300 
            shadow-lg hover:shadow-orange-500/40
            transform hover:-translate-y-0.5
          "
        >
          <span className="relative z-10 flex items-center justify-center gap-2">
            {loading ? (
              <>
                <FontAwesomeIcon icon={faCircleNotch} spin /> Đang xử lý...
              </>
            ) : (
              "Xem trạng thái"
            )}
          </span>

          {/* === HIỆU ỨNG LƯỚT SÁNG (SHINE) === */}
          {/* skew 45 độ, duration 700ms, trắng 20% - Đồng bộ hoàn toàn */}
          <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-0"></div>
        </button>
      </div>

      {/* Thông báo lỗi */}
      <AnimatePresence>
        {error && (
          <motion.div
            initial={{ opacity: 0, height: 0, marginTop: 0 }}
            animate={{ opacity: 1, height: "auto", marginTop: 12 }}
            exit={{ opacity: 0, height: 0, marginTop: 0 }}
            className="overflow-hidden"
          >
            <p className="bg-red-500/20 border border-red-500/30 text-red-100 px-3 py-2 text-sm rounded-lg flex items-center gap-2">
              ⚠️ {error}
            </p>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Kết quả tra cứu */}
      <AnimatePresence>
        {shipment && (
          <motion.div
            initial={{ opacity: 0, y: 10, scale: 0.95 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 10, scale: 0.95 }}
            transition={{ type: "spring", stiffness: 300, damping: 25 }}
            className="bg-white/10 border border-white/20 rounded-xl p-4 text-white text-sm space-y-2 shadow-inner mt-2"
          >
            <div className="flex justify-between items-center">
              <span className="font-semibold text-gray-300">Mã đơn:</span>
              <span className="font-mono text-orange-400 font-bold bg-black/20 px-2 py-0.5 rounded tracking-wider">
                {shipment.tracking_code}
              </span>
            </div>

            <div className="flex justify-between items-center">
              <span className="font-semibold text-gray-300">Trạng thái:</span>
              <span
                className={`font-bold px-2 py-0.5 rounded text-xs uppercase shadow-sm ${
                  getStatusDisplay(shipment.status).color
                }`}
              >
                {getStatusDisplay(shipment.status).text}
              </span>
            </div>

            <div className="h-px bg-gradient-to-r from-transparent via-white/20 to-transparent my-2" />

            <div className="space-y-1.5">
              <div className="flex justify-between">
                <span className="text-gray-400">Người nhận:</span>
                <span className="font-medium text-right text-white/90">
                  {shipment.receiver_name}
                </span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-400">SĐT:</span>
                <span className="font-medium text-right text-white/90">
                  {shipment.receiver_phone}
                </span>
              </div>
              <div className="flex justify-between items-start gap-4">
                <span className="text-gray-400 whitespace-nowrap">
                  Địa chỉ:
                </span>
                <span className="font-medium text-right text-xs leading-relaxed text-white/80 line-clamp-2">
                  {shipment.delivery_address}
                </span>
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Footer Support */}
      <div className="flex justify-between items-center border-t border-white/10 pt-4 text-xs text-gray-400 relative z-10">
        <span>Cần hỗ trợ gấp?</span>

        {/* --- NÚT CHAT (SECONDARY BUTTON) --- */}
        <button
          onClick={openSupportChat}
          className="relative overflow-hidden group px-4 py-2 rounded-lg bg-white/5 border border-white/20 hover:bg-[#0d2e36] hover:border-orange-500/50 text-white transition-all duration-300"
        >
          <span className="relative z-10 flex items-center gap-2">
            <FontAwesomeIcon icon={faComments} className="text-orange-500" />
            Chat ngay
          </span>

          {/* === HIỆU ỨNG LƯỚT SÁNG NHẸ === */}
          <div className="absolute top-0 -left-[100%] w-full h-full bg-white/10 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out"></div>
        </button>
      </div>
    </motion.div>
  );
}
