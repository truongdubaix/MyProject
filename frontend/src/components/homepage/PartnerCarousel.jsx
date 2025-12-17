import React from "react";
import { motion } from "framer-motion";
import "@fortawesome/react-fontawesome";

// Danh sách logo mới: Đã thêm Shopee, Lazada, Tiki, TikTok, Amazon...
const partners = [
  {
    name: "Shopee",
    src: "https://upload.wikimedia.org/wikipedia/commons/f/fe/Shopee.svg",
  },
  {
    name: "Lazada",
    src: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Lazada_%282019%29.svg",
  },
  {
    name: "TikTok Shop",
    src: "https://upload.wikimedia.org/wikipedia/en/a/a9/TikTok_logo.svg",
  },
  {
    name: "Amazon",
    src: "https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg",
  },
  {
    name: "Tiki",
    src: "https://upload.wikimedia.org/wikipedia/commons/4/43/Logo_Tiki_2023.png",
  }, // Tiki dùng tạm PNG vì SVG hiếm
  {
    name: "Adidas",
    src: "https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg",
  },
  {
    name: "Nike",
    src: "https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg",
  },
  {
    name: "Apple",
    src: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg",
  },
  {
    name: "Samsung",
    src: "https://upload.wikimedia.org/wikipedia/commons/2/24/Samsung_Logo.svg",
  },
  {
    name: "H&M",
    src: "https://upload.wikimedia.org/wikipedia/commons/5/53/H%26M-Logo.svg",
  },
];

export default function PartnerCarousel() {
  return (
    <section className="py-10 bg-white border-t border-b border-gray-100 overflow-hidden select-none">
      <div className="max-w-7xl mx-auto px-4 mb-8 text-center">
        <p className="text-sm font-bold text-gray-400 uppercase tracking-[0.2em]">
          Đối tác vận chuyển & Thương mại điện tử
        </p>
      </div>

      {/* Container che phần thừa */}
      <div className="relative w-full overflow-hidden mask-gradient">
        {/* Lớp phủ mờ 2 bên (Fade) */}
        <div className="absolute top-0 left-0 w-32 h-full bg-gradient-to-r from-white to-transparent z-10 pointer-events-none"></div>
        <div className="absolute top-0 right-0 w-32 h-full bg-gradient-to-l from-white to-transparent z-10 pointer-events-none"></div>

        {/* Track chứa logo */}
        <div className="flex">
          <motion.div
            className="flex items-center gap-12 pr-12 w-max" // w-max: Quan trọng để không bị co dòng
            animate={{ x: "-50%" }}
            transition={{
              duration: 30, // Tốc độ chạy (càng lớn càng chậm)
              ease: "linear",
              repeat: Infinity,
            }}
          >
            {/* Render LẦN 1 */}
            {partners.map((logo, index) => (
              <PartnerLogo key={`1-${index}`} logo={logo} />
            ))}

            {/* Render LẦN 2 (Bản sao để nối tiếp) */}
            {partners.map((logo, index) => (
              <PartnerLogo key={`2-${index}`} logo={logo} />
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
}

// Tách component con cho gọn và dễ chỉnh style chung
const PartnerLogo = ({ logo }) => (
  <div className="relative group flex justify-center items-center w-[120px] md:w-[160px] h-20 cursor-pointer">
    {/* Ảnh gốc (Grayscale) */}
    <img
      src={logo.src}
      alt={logo.name}
      className="max-w-full max-h-12 object-contain grayscale opacity-40 transition-all duration-300 group-hover:grayscale-0 group-hover:opacity-100 group-hover:scale-110"
      onError={(e) => {
        // Fallback nếu ảnh lỗi thì hiện text
        e.target.style.display = "none";
        e.target.nextSibling.style.display = "block";
      }}
    />
    {/* Text dự phòng nếu ảnh lỗi */}
    <span className="hidden text-sm font-bold text-gray-400">{logo.name}</span>
  </div>
);
