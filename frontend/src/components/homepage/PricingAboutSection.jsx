import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faTruckFast,
  faClock,
  faUserTie,
  faBoxOpen,
  faPaperPlane,
  faWarehouse,
} from "@fortawesome/free-solid-svg-icons";

// --- DỮ LIỆU ---
const featuresData = [
  {
    icon: faTruckFast,
    title: "Phí vận chuyển quốc tế",
    desc: "Chi phí vận chuyển tối ưu từ quốc gia xuất xứ đến kho nhập khẩu.",
  },
  {
    icon: faClock,
    title: "Phí xử lý hải quan",
    desc: "Bao gồm làm hồ sơ, khai báo, kiểm tra và thông quan hàng hóa.",
  },
  {
    icon: faWarehouse,
    title: "Phí lưu kho",
    desc: "Linh hoạt theo diện tích và thời gian lưu trữ thực tế của hàng hóa.",
  },
  {
    icon: faBoxOpen,
    title: "Phí xử lý nội địa",
    desc: "Gồm xử lý, đóng gói, dán nhãn và giao hàng tận nơi.",
  },
  {
    icon: faUserTie,
    title: "Phí bảo hiểm hàng hóa",
    desc: "Bảo hiểm 100% giá trị hàng hóa trước mọi rủi ro vận chuyển.",
  },
];

const statsData = [
  { number: "10+", label: "Năm kinh nghiệm" },
  { number: "6+", label: "Kho hàng" },
  { number: "12k+", label: "Khách hàng" },
];

export default function PricingAboutSection() {
  return (
    <section className="py-24 bg-white overflow-hidden relative">
      {/* 1. HỌA TIẾT TRANG TRÍ */}
      <div className="absolute top-10 right-0 md:right-10 opacity-30 pointer-events-none animate-pulse">
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
              <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-orange-100 text-orange-600 mb-4 border border-orange-200">
                <FontAwesomeIcon icon={faBoxOpen} className="text-xl" />
                <span className="font-bold text-xl uppercase tracking-wider">
                  Bảng giá dịch vụ
                </span>
              </div>
              <h2 className="text-3xl font-extrabold uppercase text-[#113e48] mb-4 leading-tight">
                Phí dịch vụ nhập hàng <br />
                <span className="text-orange-500">Uy tín & Trọn gói</span>
              </h2>
              <p className="text-slate-600 max-w-lg">
                Cam kết bảng giá minh bạch, không phát sinh chi phí ẩn. Tùy
                chỉnh linh hoạt theo nhu cầu cụ thể của từng doanh nghiệp.
              </p>
            </div>

            {/* List Features */}
            <div className="space-y-4">
              {featuresData.map((item, index) => (
                <div
                  key={index}
                  className="flex gap-5 group p-4 rounded-2xl hover:bg-slate-50 transition-all duration-300 relative overflow-hidden cursor-default"
                >
                  {/* === HIỆU ỨNG SÁNG CHO LIST ITEM === */}
                  {/* Áp dụng skew-x-[45deg] và duration-700. Dùng màu xám nhạt vì nền trắng */}
                  <div className="absolute top-0 -left-[100%] w-full h-full bg-gradient-to-r from-transparent via-slate-400/10 to-transparent skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-0"></div>

                  <div className="relative z-10 flex-shrink-0 w-14 h-14 rounded-xl bg-white border border-gray-100 shadow-lg text-orange-500 flex items-center justify-center text-xl transition-all duration-300 group-hover:bg-[#113e48] group-hover:text-white">
                    <FontAwesomeIcon icon={item.icon} />
                  </div>
                  <div className="relative z-10">
                    <h3 className="text-lg font-bold text-[#113e48] mb-2 group-hover:text-orange-600 transition-colors">
                      {item.title}
                    </h3>
                    <p className="text-slate-600 text-base leading-relaxed">
                      {item.desc}
                    </p>
                  </div>
                </div>
              ))}
            </div>

            {/* Button */}
            <div className="mt-10">
              <button className="relative overflow-hidden group inline-flex items-center gap-2 bg-[#113e48] text-white px-8 py-3.5 rounded-full font-bold uppercase text-sm tracking-wide hover:bg-orange-500 transition-all duration-300 shadow-xl shadow-[#113e48]/20 hover:shadow-orange-500/30 transform hover:-translate-y-1">
                <span className="relative z-10 flex items-center gap-2">
                  Xem chi tiết
                  <FontAwesomeIcon icon={faPaperPlane} />
                </span>

                {/* === HIỆU ỨNG SÁNG CHO BUTTON === */}
                {/* Chuẩn theo mẫu: skew 45 độ, 0.7s, trắng 20% */}
                <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out"></div>
              </button>
            </div>
          </div>

          {/* --- CỘT PHẢI: ẢNH MINH HỌA --- */}
          <div className="relative mt-12 lg:mt-0 h-full min-h-[500px] flex items-center justify-end px-4 lg:px-0">
            <div className="relative w-full md:w-[90%] lg:pl-12">
              {/* 2. ẢNH CHÍNH */}
              <div className="relative rounded-[40px] overflow-hidden shadow-2xl border-[6px] border-white z-10 group">
                <img
                  src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                  alt="Kho bãi Logistics"
                  className="w-full h-auto object-cover transform group-hover:scale-105 transition-transform duration-700"
                />
                {/* Lớp phủ màu */}
                <div className="absolute inset-0 bg-[#113e48]/10 mix-blend-multiply"></div>

                {/* === HIỆU ỨNG SÁNG QUÉT QUA ẢNH === */}
                {/* Đồng bộ: skew 45 độ, 0.7s */}
                <div className="absolute top-0 -left-[100%] w-full h-full bg-white/20 skew-x-[45deg] group-hover:left-[100%] transition-all duration-700 ease-in-out z-20"></div>
              </div>

              {/* 3. ẢNH PHỤ */}
              <div className="absolute -bottom-10 -right-4 md:-right-10 w-[60%] border-[6px] border-white rounded-[20px] shadow-2xl overflow-hidden z-20 hidden md:block animate-[bounce_3s_infinite]">
                <img
                  src="https://images.unsplash.com/photo-1616401784845-180882ba9ba8?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                  alt="Nhân viên kiểm hàng"
                  className="w-full h-full object-cover"
                />
              </div>

              {/* 4. VÒNG TRÒN TRANG TRÍ */}
              <div className="absolute -top-10 -right-10 z-0 hidden lg:block pointer-events-none">
                <div className="w-40 h-40 rounded-full border-2 border-dashed border-[#113e48]/20 flex items-center justify-center animate-[spin_10s_linear_infinite]">
                  <div className="w-32 h-32 rounded-full bg-orange-500/5"></div>
                </div>
              </div>

              {/* 5. BOX THỐNG KÊ */}
              <div className="absolute top-1/2 -translate-y-1/2 -left-2 md:-left-8 z-30">
                <div className="bg-[#113e48] text-white py-10 px-6 rounded-r-3xl rounded-l-xl shadow-[20px_20px_60px_rgba(0,0,0,0.3)] border-l-[6px] border-orange-500 flex flex-col gap-8 relative overflow-hidden group">
                  {/* Hiệu ứng ánh sáng tự động chạy (Shimmer) - Cập nhật góc nghiêng cho đồng bộ */}
                  <div className="absolute top-0 -left-[150%] w-full h-full bg-gradient-to-r from-transparent via-white/10 to-transparent skew-x-[45deg] animate-[shimmer_4s_infinite]"></div>

                  {statsData.map((stat, idx) => (
                    <div
                      key={idx}
                      className="flex flex-col items-center text-center relative z-10"
                    >
                      <h3 className="text-4xl font-black text-white mb-1 tracking-tight">
                        {stat.number}
                      </h3>
                      <p className="text-[10px] font-bold text-gray-300 uppercase tracking-widest">
                        {stat.label}
                      </p>

                      {idx !== statsData.length - 1 && (
                        <div className="w-10 h-[1px] bg-gradient-to-r from-transparent via-orange-500/70 to-transparent mt-8"></div>
                      )}
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
