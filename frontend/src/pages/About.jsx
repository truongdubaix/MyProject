import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import {
  FaShippingFast,
  FaShieldAlt,
  FaHandshake,
  FaGlobeAsia,
  FaUsers,
  FaChartLine,
} from "react-icons/fa";
// Nếu bạn chưa cài AOS, nhớ import và init trong useEffect hoặc ở file gốc
// import AOS from "aos";
// import "aos/dist/aos.css";

export default function About() {
  // useEffect(() => {
  //   AOS.init({ duration: 1000 });
  // }, []);

  return (
    <div className="bg-white font-sans overflow-hidden">
      {/* 1. HERO SECTION: Impressive Background */}
      <section className="relative py-32 bg-slate-600 text-white">
        {/* Background Image Overlay */}
        <div className="absolute inset-0 z-0">
          <img
            src="./assets/banners/banner3.png"
            alt="Logistics Warehouse"
            className="w-full h-full object-cover opacity-30"
          />
          <div className="absolute inset-0 "></div>
        </div>

        <div className="relative z-10 max-w-7xl mx-auto px-6 text-center">
          <span
            className="inline-block py-1 px-3 rounded-full bg-blue-600/20 border border-blue-500 text-blue-300 text-sm font-bold mb-6 tracking-wider uppercase"
            data-aos="fade-down"
          >
            Hành trình của chúng tôi
          </span>
          <h1
            className="text-4xl md:text-6xl font-extrabold mb-6 leading-tight"
            data-aos="fade-up"
          >
            Kiến tạo tương lai <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-300">
              Logistics Việt Nam
            </span>
          </h1>
          <p
            className="text-gray-300 text-lg md:text-xl max-w-3xl mx-auto mb-10"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            SpeedyShip không chỉ là giao hàng. Chúng tôi kết nối cơ hội, rút
            ngắn khoảng cách và mang lại sự thịnh vượng cho doanh nghiệp Việt
            bằng công nghệ vận chuyển tiên tiến.
          </p>
        </div>
      </section>

      {/* 2. STATS SECTION: Con số biết nói */}
      <section className="py-12 -mt-16 relative z-20 px-6">
        <div className="max-w-6xl mx-auto bg-white rounded-2xl shadow-xl border border-gray-100 p-8 md:p-12">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center divide-x divide-gray-100">
            {[
              {
                num: "5M+",
                label: "Đơn hàng hoàn tất",
                icon: <FaShippingFast />,
              },
              {
                num: "63",
                label: "Tỉnh thành phủ sóng",
                icon: <FaGlobeAsia />,
              },
              { num: "10k+", label: "Đối tác tin cậy", icon: <FaHandshake /> },
              { num: "99.9%", label: "Tỷ lệ đúng hẹn", icon: <FaChartLine /> },
            ].map((stat, idx) => (
              <div
                key={idx}
                className="flex flex-col items-center group"
                data-aos="zoom-in"
                data-aos-delay={idx * 100}
              >
                <div className="text-3xl text-blue-100 mb-2 group-hover:text-blue-600 transition-colors">
                  {stat.icon}
                </div>
                <h3 className="text-3xl md:text-4xl font-bold text-slate-800 mb-1">
                  {stat.num}
                </h3>
                <p className="text-sm text-gray-500 font-medium uppercase tracking-wide">
                  {stat.label}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* 3. MISSION & VISION: Bố cục so le */}
      <section className="py-20 max-w-7xl mx-auto px-6 space-y-24">
        {/* Block 1: Sứ mệnh */}
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <div className="relative" data-aos="fade-right">
            <div className="absolute -top-4 -left-4 w-24 h-24 bg-orange-100 rounded-full z-0"></div>
            <img
              src="https://images.unsplash.com/photo-1616401784845-180886ba9ca8?auto=format&fit=crop&w=800&q=80"
              alt="Mission"
              className="relative z-10 rounded-2xl shadow-2xl w-full object-cover h-[400px]"
            />
            <div className="absolute -bottom-6 -right-6 bg-white p-6 rounded-xl shadow-xl z-20 max-w-xs hidden md:block">
              <p className="text-sm font-bold text-slate-800">
                "Khách hàng là trọng tâm của mọi chuyến đi."
              </p>
              <div className="flex gap-1 text-yellow-400 mt-2 text-xs">
                ⭐⭐⭐⭐⭐
              </div>
            </div>
          </div>
          <div data-aos="fade-left">
            <h3 className="text-orange-600 font-bold uppercase tracking-wider text-sm mb-2">
              Về sứ mệnh
            </h3>
            <h2 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">
              Đơn giản hóa vận chuyển cho mọi người
            </h2>
            <p className="text-gray-600 text-lg leading-relaxed mb-6">
              Sứ mệnh của SpeedyShip là xóa bỏ rào cản logistics cho các doanh
              nghiệp vừa và nhỏ (SMEs). Chúng tôi cung cấp giải pháp công nghệ
              giúp bạn quản lý đơn hàng dễ dàng, chi phí minh bạch và tối ưu lợi
              nhuận.
            </p>
            <ul className="space-y-3">
              {[
                "Hệ thống theo dõi Real-time 24/7",
                "Đội ngũ tài xế được đào tạo chuyên nghiệp",
                "Bảo hiểm hàng hóa 100% giá trị",
              ].map((item, i) => (
                <li key={i} className="flex items-center gap-3 text-slate-700">
                  <span className="w-6 h-6 rounded-full bg-green-100 text-green-600 flex items-center justify-center text-xs">
                    ✔
                  </span>
                  {item}
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Block 2: Tầm nhìn */}
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <div className="order-2 md:order-1" data-aos="fade-right">
            <h3 className="text-blue-600 font-bold uppercase tracking-wider text-sm mb-2">
              Tầm nhìn 2030
            </h3>
            <h2 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">
              Số hóa nền logistics Việt Nam
            </h2>
            <p className="text-gray-600 text-lg leading-relaxed mb-6">
              Chúng tôi khao khát trở thành "Kỳ lân" công nghệ logistics, áp
              dụng AI và Big Data để giải quyết bài toán giao vận tại các đô thị
              lớn và vùng sâu vùng xa, đưa hàng hóa Việt Nam vươn tầm thế giới.
            </p>
            <Link
              to="/services"
              className="inline-flex items-center gap-2 bg-slate-900 text-white px-8 py-3 rounded-full font-bold hover:bg-orange-500 transition-all duration-300 shadow-lg hover:shadow-orange-500/30"
            >
              Khám phá dịch vụ <FaChartLine />
            </Link>
          </div>
          <div className="order-1 md:order-2 relative" data-aos="fade-left">
            <div className="absolute -bottom-4 -right-4 w-32 h-32 bg-blue-100 rounded-full z-0"></div>
            <img
              src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=800&q=80"
              alt="Vision"
              className="relative z-10 rounded-2xl shadow-2xl w-full object-cover h-[400px]"
            />
          </div>
        </div>
      </section>

      {/* 4. CORE VALUES: Thẻ Card đẹp hơn */}
      <section className="bg-slate-50 py-20">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16 max-w-2xl mx-auto">
            <h3 className="text-orange-600 font-bold uppercase mb-3">
              Giá trị cốt lõi
            </h3>
            <h2 className="text-3xl md:text-4xl font-bold text-slate-900">
              Điều gì làm nên SpeedyShip?
            </h2>
            <p className="text-gray-500 mt-4">
              Văn hóa doanh nghiệp là kim chỉ nam cho mọi hành động của chúng
              tôi.
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                t: "Tốc độ (Speed)",
                d: "Thời gian là vàng. Chúng tôi tối ưu từng giây trong quy trình vận hành để hàng hóa đến tay khách sớm nhất.",
                icon: <FaShippingFast />,
                color: "bg-blue-100 text-blue-600",
              },
              {
                t: "Minh bạch (Transparency)",
                d: "Không phí ẩn, không mập mờ. Mọi hành trình đơn hàng đều được cập nhật công khai trên hệ thống.",
                icon: <FaShieldAlt />,
                color: "bg-green-100 text-green-600",
              },
              {
                t: "Con người (People)",
                d: "Tài xế và nhân viên là tài sản quý giá nhất. Chúng tôi xây dựng môi trường làm việc hạnh phúc.",
                icon: <FaUsers />,
                color: "bg-orange-100 text-orange-600",
              },
            ].map((v, i) => (
              <div
                key={i}
                className="bg-white p-8 rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 border border-gray-100 group"
                data-aos="fade-up"
                data-aos-delay={i * 100}
              >
                <div
                  className={`w-16 h-16 rounded-xl flex items-center justify-center text-3xl mb-6 ${v.color} group-hover:scale-110 transition-transform duration-300`}
                >
                  {v.icon}
                </div>
                <h4 className="font-bold text-slate-800 text-xl mb-3 group-hover:text-blue-600 transition-colors">
                  {v.t}
                </h4>
                <p className="text-gray-600 leading-relaxed">{v.d}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* 5. TEAM SECTION (Mới) */}
      <section className="py-20 max-w-7xl mx-auto px-6">
        <h2 className="text-3xl font-bold text-center text-slate-900 mb-12">
          Đội ngũ lãnh đạo
        </h2>
        <div className="grid md:grid-cols-4 gap-6">
          {[
            {
              name: "Nguyễn Văn A",
              role: "CEO & Founder",
              img: "https://randomuser.me/api/portraits/men/32.jpg",
            },
            {
              name: "Trần Thị B",
              role: "Head of Logistics",
              img: "https://randomuser.me/api/portraits/women/44.jpg",
            },
            {
              name: "Lê Văn C",
              role: "CTO",
              img: "https://randomuser.me/api/portraits/men/85.jpg",
            },
            {
              name: "Phạm Thị D",
              role: "Customer Success",
              img: "https://randomuser.me/api/portraits/women/65.jpg",
            },
          ].map((member, i) => (
            <div
              key={i}
              className="text-center group"
              data-aos="flip-left"
              data-aos-delay={i * 100}
            >
              <div className="relative overflow-hidden rounded-2xl mb-4 aspect-[3/4]">
                <img
                  src={member.img}
                  alt={member.name}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity flex items-end justify-center pb-4">
                  <span className="text-white font-medium">
                    Connect on LinkedIn
                  </span>
                </div>
              </div>
              <h3 className="font-bold text-lg text-slate-800">
                {member.name}
              </h3>
              <p className="text-sm text-blue-600">{member.role}</p>
            </div>
          ))}
        </div>
      </section>

      {/* 6. CTA BOTTOM */}
      <section className="py-20 bg-gradient-to-br from-blue-900 to-slate-900 text-white text-center px-6">
        <div className="max-w-4xl mx-auto" data-aos="zoom-in">
          <h2 className="text-3xl md:text-5xl font-bold mb-6">
            Sẵn sàng vận chuyển cùng SpeedyShip?
          </h2>
          <p className="text-blue-200 text-lg mb-8 max-w-2xl mx-auto">
            Đăng ký ngay hôm nay để trải nghiệm dịch vụ giao hàng siêu tốc và
            nhận ưu đãi dành cho khách hàng mới.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/register"
              className="bg-orange-500 hover:bg-orange-600 text-white px-8 py-4 rounded-full font-bold text-lg transition shadow-lg shadow-orange-500/30"
            >
              Đăng ký miễn phí
            </Link>
            <Link
              to="/contact"
              className="bg-transparent border border-white hover:bg-white hover:text-slate-900 text-white px-8 py-4 rounded-full font-bold text-lg transition"
            >
              Liên hệ tư vấn
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
