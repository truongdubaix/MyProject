import React from "react";
import { FaUser, FaComments, FaArrowRight, FaBox } from "react-icons/fa";

const newsData = [
  {
    id: 1,
    // Ảnh minh họa: Vận chuyển đường biển/quốc tế
    image:
      "https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-2-414x273.jpg",
    date: { day: "20", month: "Th12" },
    author: "Admin",
    comments: 5,
    title: "Giải pháp vận chuyển hàng hóa xuyên biên giới tối ưu 2024",
    desc: "Khám phá các phương thức vận tải đa phương thức giúp tiết kiệm chi phí và thời gian cho doanh nghiệp xuất nhập khẩu.",
  },
  {
    id: 2,
    // Ảnh minh họa: Xe tải/Giao hàng
    image:
      "https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-3-414x273.jpg",
    date: { day: "18", month: "Th12" },
    author: "SpeedyTeam",
    comments: 12,
    title: "Đừng để hàng hóa bị kẹt: Chọn đội xe tải SpeedyShip",
    desc: "Với đội xe hùng hậu và công nghệ định vị GPS real-time, chúng tôi cam kết giao hàng đúng hẹn bất chấp mọi điều kiện.",
  },
  {
    id: 3,
    // Ảnh minh họa: Kho bãi/Logistics
    image:
      "https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-4-414x273.jpg",
    date: { day: "15", month: "Th12" },
    author: "Ban Biên Tập",
    comments: 8,
    title: "Đối tác Logistics hoàn hảo: Chìa khóa bứt phá doanh thu",
    desc: "Tìm hiểu cách một hệ thống logistics chuyên nghiệp có thể giúp bạn giảm 30% chi phí vận hành và tăng trải nghiệm khách hàng.",
  },
];

export default function NewsSection() {
  return (
    <section className="py-24 bg-white font-sans">
      <div className="max-w-7xl mx-auto px-6">
        {/* --- HEADER SECTION (Giống mẫu HTML cũ nhưng style SpeedyShip) --- */}
        <div className="text-center mb-16" data-aos="fade-up">
          <div className="inline-flex items-center gap-2 mb-3">
            {/* Giả lập icon cái hộp trong HTML cũ bằng FaBox màu cam */}
            <FaBox className="text-orange-500 text-xl animate-bounce" />
            <span className="text-orange-500 font-bold uppercase tracking-widest text-sm">
              Tin tức & Blogs
            </span>
          </div>
          <h2 className="text-3xl md:text-5xl font-extrabold text-[#113e48] uppercase tracking-tight">
            Tin tức nổi bật
          </h2>
          <div className="w-20 h-1.5 bg-orange-500 mx-auto mt-4 rounded-full"></div>
        </div>

        {/* --- GRID CARDS --- */}
        <div className="grid md:grid-cols-2 xl:grid-cols-3 gap-8">
          {newsData.map((item, i) => (
            <div
              key={item.id}
              className="group relative bg-white rounded-2xl border border-gray-100 shadow-lg hover:shadow-2xl hover:shadow-[#113e48]/10 transition-all duration-300 hover:-translate-y-2 overflow-hidden"
              data-aos="fade-up"
              data-aos-delay={i * 100}
            >
              {/* 1. ẢNH & NGÀY THÁNG */}
              <div className="relative h-64 overflow-hidden">
                <img
                  src={item.image}
                  alt={item.title}
                  className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                />

                {/* Lớp phủ màu đen mờ khi hover */}
                <div className="absolute inset-0 bg-[#113e48]/20 opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>

                {/* Badge Ngày tháng (Góc trái trên - Style Elementor cũ nhưng đẹp hơn) */}
                <div className="absolute top-4 left-4 bg-white/95 backdrop-blur rounded-lg shadow-md p-2 min-w-[60px] text-center border-t-4 border-orange-500">
                  <span className="block text-2xl font-extrabold text-[#113e48] leading-none">
                    {item.date.day}
                  </span>
                  <span className="block text-xs font-bold text-gray-500 uppercase">
                    {item.date.month}
                  </span>
                </div>
              </div>

              {/* 2. NỘI DUNG CARD */}
              <div className="p-8 relative">
                {/* Thanh Meta (Tác giả & Comment) - Đè lên ảnh một chút hoặc nằm ngay dưới */}
                <div className="flex items-center gap-4 text-xs font-semibold text-gray-500 mb-4 uppercase tracking-wide">
                  <div className="flex items-center gap-2 hover:text-orange-500 transition-colors cursor-pointer">
                    <FaUser className="text-orange-500" /> {item.author}
                  </div>
                  <div className="w-1 h-1 bg-gray-300 rounded-full"></div>
                  <div className="flex items-center gap-2 hover:text-orange-500 transition-colors cursor-pointer">
                    <FaComments className="text-orange-500" /> Comments(
                    {item.comments})
                  </div>
                </div>

                {/* Tiêu đề */}
                <h3 className="text-xl font-bold text-[#113e48] mb-4 line-clamp-2 leading-snug group-hover:text-orange-500 transition-colors">
                  <a href="#">{item.title}</a>
                </h3>

                {/* Nút Xem thêm (Style gạch chân + mũi tên) */}
                <a
                  href="#"
                  className="inline-flex items-center gap-2 text-sm font-bold text-gray-400 group-hover:text-[#113e48] transition-all group/btn"
                >
                  XEM THÊM
                  <span className="bg-gray-100 group-hover:bg-orange-500 group-hover:text-white w-8 h-8 rounded-full flex items-center justify-center transition-all duration-300">
                    <FaArrowRight className="text-xs transform group-hover/btn:translate-x-0.5 transition-transform" />
                  </span>
                </a>
              </div>

              {/* Đường kẻ trang trí dưới cùng */}
              <div className="absolute bottom-0 left-0 w-0 h-1 bg-[#113e48] transition-all duration-500 group-hover:w-full"></div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
