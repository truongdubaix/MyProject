import { useState } from "react";
import {
  Wallet,
  CreditCard,
  ArrowUpRight,
  ArrowDownLeft,
  History,
  TrendingUp,
} from "lucide-react";

export default function CustomerWallet() {
  const [transactions, setTransactions] = useState([
    {
      id: 101,
      type: "deposit",
      amount: 5000000,
      date: "2024-03-15",
      status: "success",
      desc: "Nạp tiền qua MoMo",
    },
    {
      id: 102,
      type: "payment",
      amount: 150000,
      date: "2024-03-16",
      status: "success",
      desc: "Thanh toán đơn #DH001",
    },
    {
      id: 103,
      type: "payment",
      amount: 320000,
      date: "2024-03-18",
      status: "pending",
      desc: "Thanh toán đơn #DH005",
    },
  ]);

  return (
    <div className="space-y-6 animate-in fade-in duration-500">
      {/* 1. Wallet Card Section */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {/* Main Card */}
        <div className="md:col-span-2 bg-gradient-to-br from-[#113e48] to-[#0f2a30] p-8 rounded-3xl text-white shadow-2xl relative overflow-hidden">
          {/* Background Decor */}
          <div className="absolute top-0 right-0 w-64 h-64 bg-white/5 rounded-full blur-3xl translate-x-1/2 -translate-y-1/2"></div>

          <div className="relative z-10 flex justify-between items-start">
            <div>
              <p className="text-blue-200 text-sm font-medium mb-1">
                Số dư khả dụng
              </p>
              <h2 className="text-4xl font-bold tracking-tight">4.530.000 ₫</h2>
            </div>
            <div className="p-3 bg-white/10 rounded-xl backdrop-blur-md">
              <Wallet size={32} className="text-orange-400" />
            </div>
          </div>

          <div className="relative z-10 mt-10 flex gap-4">
            <button className="flex items-center gap-2 bg-orange-500 hover:bg-orange-600 text-white px-6 py-3 rounded-xl font-bold transition-all shadow-lg shadow-orange-500/20">
              <ArrowUpRight size={20} /> Nạp tiền
            </button>
            <button className="flex items-center gap-2 bg-white/10 hover:bg-white/20 text-white px-6 py-3 rounded-xl font-bold transition-all backdrop-blur-md border border-white/10">
              <CreditCard size={20} /> Rút tiền
            </button>
          </div>
        </div>

        {/* Stats Card */}
        <div className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 flex flex-col justify-center">
          <div className="flex items-center gap-3 mb-6">
            <div className="p-3 bg-green-100 text-green-600 rounded-xl">
              <TrendingUp size={24} />
            </div>
            <div>
              <p className="text-sm text-gray-500">Chi tiêu tháng này</p>
              <p className="text-xl font-bold text-[#113e48]">1.250.000 ₫</p>
            </div>
          </div>
          <div className="h-[1px] bg-gray-100 w-full mb-6"></div>
          <div className="text-sm text-gray-500">
            <p className="mb-2">
              Hạn mức tín dụng:{" "}
              <span className="font-bold text-[#113e48]">10.000.000 ₫</span>
            </p>
            <div className="w-full bg-gray-100 rounded-full h-2">
              <div
                className="bg-blue-500 h-2 rounded-full"
                style={{ width: "45%" }}
              ></div>
            </div>
          </div>
        </div>
      </div>

      {/* 2. Transaction History */}
      <div className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
        <div className="p-6 border-b border-gray-100 flex justify-between items-center">
          <h3 className="font-bold text-[#113e48] text-lg flex items-center gap-2">
            <History size={20} className="text-gray-400" /> Lịch sử giao dịch
          </h3>
          <button className="text-sm text-blue-600 font-bold hover:underline">
            Xem tất cả
          </button>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left">
            <thead className="bg-gray-50 text-gray-500 font-medium">
              <tr>
                <th className="px-6 py-4">Mã GD</th>
                <th className="px-6 py-4">Nội dung</th>
                <th className="px-6 py-4 text-center">Ngày</th>
                <th className="px-6 py-4 text-right">Số tiền</th>
                <th className="px-6 py-4 text-center">Trạng thái</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {transactions.map((t) => (
                <tr key={t.id} className="hover:bg-gray-50/50">
                  <td className="px-6 py-4 font-mono text-gray-500">#{t.id}</td>
                  <td className="px-6 py-4 font-medium text-[#113e48]">
                    <div className="flex items-center gap-2">
                      <div
                        className={`w-8 h-8 rounded-full flex items-center justify-center ${
                          t.type === "deposit"
                            ? "bg-green-100 text-green-600"
                            : "bg-red-100 text-red-600"
                        }`}
                      >
                        {t.type === "deposit" ? (
                          <ArrowDownLeft size={16} />
                        ) : (
                          <ArrowUpRight size={16} />
                        )}
                      </div>
                      {t.desc}
                    </div>
                  </td>
                  <td className="px-6 py-4 text-center text-gray-500">
                    {t.date}
                  </td>
                  <td
                    className={`px-6 py-4 text-right font-bold ${
                      t.type === "deposit" ? "text-green-600" : "text-red-600"
                    }`}
                  >
                    {t.type === "deposit" ? "+" : "-"}
                    {t.amount.toLocaleString()} ₫
                  </td>
                  <td className="px-6 py-4 text-center">
                    <span
                      className={`px-2.5 py-1 rounded-full text-xs font-bold border ${
                        t.status === "success"
                          ? "bg-green-50 text-green-700 border-green-200"
                          : "bg-yellow-50 text-yellow-700 border-yellow-200"
                      }`}
                    >
                      {t.status === "success" ? "Thành công" : "Đang xử lý"}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
