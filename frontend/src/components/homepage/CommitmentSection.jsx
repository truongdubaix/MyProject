import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faCheck,
  faArrowRight,
  faBox,
} from "@fortawesome/free-solid-svg-icons";

// Dữ liệu danh sách cam kết
const commitmentList = [
  {
    title: "Chất lượng hàng đầu",
    desc: "Dịch vụ cam kết cung cấp chất lượng cao, đáp ứng và vượt qua mong đợi của khách hàng.",
  },
  {
    title: "Hỗ trợ tận tâm",
    desc: "Dịch vụ cam kết cung cấp sự hỗ trợ toàn diện và tận tâm cho khách hàng 24/7.",
  },
  {
    title: "Đáp ứng thời gian",
    desc: "Dịch vụ cam kết tuân thủ tiến độ và đảm bảo thời gian giao nhận chính xác.",
  },
];

const CommitmentSection = () => {
  return (
    <section className="py-24 bg-white overflow-hidden relative">
      {/* Họa tiết trang trí chấm bi */}
      <div className="absolute top-10 left-0 opacity-30 pointer-events-none">
        <div
          className="w-48 h-48"
          style={{
            backgroundImage: "radial-gradient(#113e48 2px, transparent 2px)",
            backgroundSize: "20px 20px",
          }}
        ></div>
      </div>

      <div className="max-w-[1400px] mx-auto px-6 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          {/* --- CỘT TRÁI: NỘI DUNG --- */}
          <div>
            <div className="mb-10">
              {/* Badge */}
              <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-orange-100 text-orange-600 mb-4 border border-orange-200">
                <FontAwesomeIcon
                  icon={faBox}
                  className="text-orange-500 text-xl"
                />
                <span className="font-bold text-xl uppercase tracking-wider">
                  Cam kết
                </span>
              </div>

              {/* Heading */}
              <h2 className="text-2xl md:text-3xl font-extrabold text-[#113e48] uppercase leading-tight">
                Cam kết của chúng tôi
              </h2>
              <p className="text-slate-600 max-w-lg">
                Các cam kết này giúp xây dựng lòng tin và đảm bảo chất lượng
                dịch vụ, đồng thời tạo sự hài lòng và trải nghiệm tốt cho khách
                hàng.
              </p>
            </div>

            {/* Danh sách cam kết */}
            <div className="space-y-6 mb-10">
              {commitmentList.map((item, index) => (
                <div
                  key={index}
                  className="flex gap-5 group p-4 rounded-xl hover:bg-slate-50 transition-colors duration-300 relative overflow-hidden"
                >
                  {/* === HIỆU ỨNG SÁNG CHO LIST ITEM (Mới thêm) === */}
                  {/* Màu nhẹ (slate-400/10) để không làm chói mắt trên nền trắng */}
                  <div className="absolute top-0 -left-[100%] w-full h-full bg-gradient-to-r from-transparent via-slate-400/10 to-transparent skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-0"></div>

                  {/* Icon Check màu cam */}
                  <div className="relative z-10 flex-shrink-0 w-6 h-6 mt-1 flex items-center justify-center text-orange-500 text-xl group-hover:scale-110 transition-transform duration-300">
                    <FontAwesomeIcon icon={faCheck} />
                  </div>

                  {/* Nội dung text */}
                  <div className="relative z-10">
                    <h3 className="text-lg font-bold text-[#113e48] mb-2 group-hover:text-orange-600 transition-colors">
                      {item.title}
                    </h3>
                    <p className="text-slate-600 text-sm leading-relaxed border-b border-gray-100 pb-4 last:border-0 last:pb-0 group-hover:border-transparent transition-colors">
                      {item.desc}
                    </p>
                  </div>
                </div>
              ))}
            </div>

            {/* Button */}
            <div className="mt-6">
              <a href="/about/">
                <button className="relative overflow-hidden group inline-flex items-center gap-2 bg-[#113e48] text-white px-8 py-3.5 rounded-full font-bold uppercase text-sm tracking-wide hover:bg-orange-500 transition-all duration-300 shadow-xl shadow-[#113e48]/20 hover:shadow-orange-500/30 transform hover:-translate-y-1">
                  <span className="relative z-10 flex items-center gap-2">
                    Khám phá
                    <FontAwesomeIcon
                      icon={faArrowRight}
                      className="transform group-hover:translate-x-1 transition-transform"
                    />
                  </span>

                  {/* === HIỆU ỨNG SÁNG CHO BUTTON === */}
                  {/* Chuẩn: skew 45 độ, duration 0.7s */}
                  <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out"></div>
                </button>
              </a>
            </div>
          </div>

          {/* --- CỘT PHẢI: HÌNH ẢNH GHÉP (COLLAGE) --- */}
          <div className="relative h-full min-h-[500px] flex gap-4">
            {/* Cột ảnh 1 (Bên trái) */}
            <div className="w-1/2 relative flex flex-col justify-end">
              <div className="relative h-[85%] w-full overflow-hidden rounded-lg shadow-md group cursor-pointer">
                <img
                  src="https://vantaidongnai.com.vn/wp-content/uploads/xe-tai-cho-hang-quan-10-da-dang-tai-trong-phuc-vu-24-7-nkp-logistics-anh-4.webp"
                  alt="Kỹ sư Logistics"
                  className="w-full h-full object-cover transform group-hover:scale-105 transition-transform duration-700"
                />
                {/* Overlay tối khi hover */}
                <div className="absolute inset-0 bg-[#113e48]/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300 mix-blend-multiply"></div>

                {/* === HIỆU ỨNG SÁNG CHO ẢNH 1 === */}
                <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-20"></div>

                {/* Overlay Box 10+ Năm - Có hiệu ứng Auto Shimmer */}
                <div className="absolute bottom-0 left-0 right-0 bg-[#113e48] text-white p-6 md:p-8 flex flex-col items-center justify-center text-center overflow-hidden relative z-30">
                  {/* Hiệu ứng lấp lánh tự động chạy */}
                  <div className="absolute top-0 -left-[150%] w-full h-full bg-gradient-to-r from-transparent via-white/10 to-transparent skew-x-[45deg] animate-[shimmer_4s_infinite]"></div>

                  <h3 className="text-4xl md:text-5xl font-black mb-1 relative z-10">
                    10+
                  </h3>
                  <p className="text-xs font-bold uppercase tracking-wider text-gray-300 relative z-10">
                    Năm kinh nghiệm
                  </p>
                </div>
              </div>
            </div>

            {/* Cột ảnh 2 (Bên phải) */}
            <div className="w-1/2 relative">
              <div className="h-full w-full overflow-hidden rounded-lg shadow-md group cursor-pointer relative">
                <img
                  src="https://vantaidongnai.com.vn/wp-content/uploads/dich-vu-thue-xe-tai-dong-nai-giao-hang-lien-tinh-noi-tinh-gia-tot-nhat-anh-dai-dien.webp"
                  alt="Tàu vận chuyển Container"
                  className="w-full h-full object-cover transform group-hover:scale-105 transition-transform duration-700"
                />
                {/* Overlay tối khi hover */}
                <div className="absolute inset-0 bg-[#113e48]/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300 mix-blend-multiply"></div>

                {/* === HIỆU ỨNG SÁNG CHO ẢNH 2 === */}
                <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-20"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default CommitmentSection;
