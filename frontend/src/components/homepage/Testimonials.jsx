import { useState } from "react";

export default function Testimonials() {
  const list = [
    { n: "Shop LUNA", c: "Giao nội thành siêu nhanh." },
    { n: "Anh Minh", c: "Realtime giảm hỏi khách rất nhiều." },
    { n: "Chị Hương", c: "Hỏa tốc 2–4h là chân ái." },
  ];

  return (
    <section className="py-20 bg-white">
      <div className="max-w-6xl mx-auto px-6">
        <h3 className="text-3xl font-bold text-center mb-10" data-aos="fade-up">
          Khách hàng nói gì về <span className="text-blue-600">SpeedyShip</span>
          ?
        </h3>

        <div className="grid md:grid-cols-3 gap-8">
          {[
            {
              name: "Shop thời trang LUNA",
              content:
                "Giao nội thành trong ngày, đơn COD đối soát rõ ràng. Tụi mình đã chuyển hết đơn sang SpeedyShip.",
            },
            {
              name: "Anh Minh – Chủ cửa hàng điện tử",
              content:
                "Thích nhất là tracking realtime, khách không còn hỏi 'Đơn em đâu rồi?' liên tục nữa.",
            },
            {
              name: "Chị Hương – Chủ cửa hàng bánh",
              content:
                "Giao bánh tươi cần đúng giờ. Dịch vụ hỏa tốc 2–4h giúp mình yên tâm giao trong nội thành.",
            },
          ].map((t, i) => (
            <div
              key={t.name}
              className="bg-gray-50 rounded-2xl p-6"
              data-aos="fade-up"
              data-aos-delay={i * 100}
            >
              <p className="text-sm text-gray-700 mb-4">“{t.content}”</p>
              <p className="text-sm font-semibold text-gray-900">{t.name}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
