import { useEffect, useState, useRef } from "react";
import API from "../../services/api";
import Pagination from "../../components/Pagination";
import toast, { Toaster } from "react-hot-toast";
import AOS from "aos";
import "aos/dist/aos.css";
import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";
import {
  FileText,
  Download,
  Search,
  Filter,
  Eye,
  Loader2,
  Package,
  PackageOpen,
  Clock,
  CheckCircle,
  Truck,
  XCircle,
  Ban,
  Receipt,
  ChevronDown,
  ClipboardList,
  AlertTriangle,
} from "lucide-react";

const STATUS_OPTIONS = [
  { value: "all", label: "Tất cả", icon: Filter, color: "text-gray-500", bg: "bg-gray-100" },
  { value: "pending", label: "Chờ xử lý", icon: Clock, color: "text-yellow-600", bg: "bg-yellow-100" },
  { value: "assigned", label: "Đã phân công", icon: ClipboardList, color: "text-gray-600", bg: "bg-gray-100" },
  { value: "picking", label: "Đang lấy hàng", icon: PackageOpen, color: "text-orange-600", bg: "bg-orange-100" },
  { value: "delivering", label: "Đang giao hàng", icon: Truck, color: "text-blue-600", bg: "bg-blue-100" },
  { value: "delivered", label: "Đã giao", icon: Package, color: "text-green-600", bg: "bg-green-100" },
  { value: "completed", label: "Hoàn thành", icon: CheckCircle, color: "text-green-600", bg: "bg-green-100" },
  { value: "failed", label: "Giao thất bại", icon: AlertTriangle, color: "text-red-600", bg: "bg-red-100" },
  { value: "cancelled", label: "Đã hủy", icon: Ban, color: "text-gray-500", bg: "bg-gray-100" },
];

function StatusFilterDropdown({ value, onChange }) {
  const [open, setOpen] = useState(false);
  const ref = useRef(null);
  const selected = STATUS_OPTIONS.find((o) => o.value === value) || STATUS_OPTIONS[0];
  const SelectedIcon = selected.icon;

  useEffect(() => {
    const handleClick = (e) => { if (ref.current && !ref.current.contains(e.target)) setOpen(false); };
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  return (
    <div className="relative" ref={ref}>
      <button
        onClick={() => setOpen(!open)}
        className="flex items-center gap-2 px-3 py-2.5 border border-gray-200 rounded-xl bg-white hover:border-orange-400 hover:ring-2 hover:ring-orange-500/10 transition-all text-sm font-medium text-gray-700 min-w-[160px] justify-between shadow-sm"
      >
        <div className="flex items-center gap-2">
          <span className={`p-1 rounded-lg ${selected.bg} ${selected.color}`}>
            <SelectedIcon size={13} />
          </span>
          <span>{selected.label}</span>
        </div>
        <ChevronDown size={14} className={`text-gray-400 transition-transform duration-200 ${open ? "rotate-180" : ""}`} />
      </button>

      {open && (
        <div className="absolute right-0 top-full mt-2 w-56 bg-white border border-gray-100 rounded-2xl shadow-xl z-50 overflow-hidden py-1 animate-in fade-in slide-in-from-top-2 duration-150">
          {STATUS_OPTIONS.map((opt) => {
            const Icon = opt.icon;
            const isActive = opt.value === value;
            return (
              <button
                key={opt.value}
                onClick={() => { onChange(opt.value); setOpen(false); }}
                className={`w-full flex items-center gap-3 px-3 py-2.5 text-sm transition-colors hover:bg-orange-50 ${isActive ? "bg-orange-50/60 font-semibold" : ""}`}
              >
                <span className={`p-1.5 rounded-lg ${opt.bg} ${opt.color} flex-shrink-0`}>
                  <Icon size={13} />
                </span>
                <span className={isActive ? "text-orange-700" : "text-gray-700"}>{opt.label}</span>
                {isActive && <span className="ml-auto w-1.5 h-1.5 rounded-full bg-orange-500" />}
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
}

// Xuất hóa đơn PDF đơn hàng
export default function CustomerInvoice() {
  const [shipments, setShipments] = useState([]);
  const [filtered, setFiltered] = useState([]);
  const [filterStatus, setFilterStatus] = useState("all");
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [downloading, setDownloading] = useState(null);
  const [previewData, setPreviewData] = useState(null);

  const [page, setPage] = useState(1);
  const itemsPerPage = 8;

  const customerId =
    localStorage.getItem("customer_id") || localStorage.getItem("userId");
  const username = localStorage.getItem("username") || "Khách hàng";

  useEffect(() => {
    AOS.init({ duration: 500, easing: "ease-out-cubic", once: true });
    if (!customerId) return;

    setLoading(true);
    API.get(`/customers/shipments/${customerId}`)
      .then((res) => {
        setShipments(res.data);
        setFiltered(res.data);
      })
      .catch(() => toast.error("Không thể tải danh sách đơn hàng!"))
      .finally(() => setLoading(false));
  }, [customerId]);

  useEffect(() => {
    let result = shipments;
    if (filterStatus !== "all") {
      result = result.filter((s) => s.status === filterStatus);
    }
    if (search) {
      const keyword = search.toLowerCase();
      result = result.filter(
        (s) =>
          s.tracking_code?.toLowerCase().includes(keyword) ||
          s.receiver_name?.toLowerCase().includes(keyword)
      );
    }
    setFiltered(result);
    setPage(1);
  }, [filterStatus, search, shipments]);

  const totalPages = Math.ceil(filtered.length / itemsPerPage);
  const startIndex = (page - 1) * itemsPerPage;
  const currentItems = filtered.slice(startIndex, startIndex + itemsPerPage);

// Định dạng số tiền theo chuẩn Việt Nam
  const fmt = (num) => Number(num || 0).toLocaleString("vi-VN");

// Lấy nhãn tên trạng thái tiếng Việt
  const getStatusLabel = (status) => {
    const map = {
      pending: "Chờ xử lý",
      assigned: "Đã phân công",
      picking: "Đang lấy hàng",
      delivering: "Đang giao",
      delivered: "Đã giao",
      completed: "Hoàn thành",
      failed: "Giao thất bại",
      cancelled: "Đã hủy",
      express: "Hỏa tốc",
      standard: "Thường",
      fast: "Hỏa tốc",
      normal: "Thường",
    };
    return map[status] || status;
  };

// Tạo badge hiển thị trạng thái
  const getStatusBadge = (status) => {
    const config = {
      pending: { color: "bg-yellow-100 text-yellow-700 border-yellow-200", icon: <Clock size={12} /> },
      assigned: { color: "bg-gray-100 text-gray-600 border-gray-200", icon: <Package size={12} /> },
      picking: { color: "bg-orange-100 text-orange-700 border-orange-200", icon: <Package size={12} /> },
      delivering: { color: "bg-blue-100 text-blue-700 border-blue-200", icon: <Truck size={12} /> },
      delivered: { color: "bg-green-100 text-green-700 border-green-200", icon: <CheckCircle size={12} /> },
      completed: { color: "bg-green-100 text-green-700 border-green-200", icon: <CheckCircle size={12} /> },
      failed: { color: "bg-red-100 text-red-700 border-red-200", icon: <XCircle size={12} /> },
      cancelled: { color: "bg-gray-100 text-gray-600 border-gray-200", icon: <XCircle size={12} /> },
    };
    const s = config[status] || { color: "bg-gray-100 text-gray-600", icon: null };
    return (
      <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold border whitespace-nowrap ${s.color}`}>
        {s.icon} {getStatusLabel(status)}
      </span>
    );
  };

// Tải font tiếng Việt cho PDF
  const loadVietnameseFont = async (doc) => {
    const toBase64 = (buffer) => {
      const bytes = new Uint8Array(buffer);
      let binary = "";
      for (let i = 0; i < bytes.length; i++) {
        binary += String.fromCharCode(bytes[i]);
      }
      return btoa(binary);
    };

    const resRegular = await fetch("/fonts/Roboto-Regular.ttf");
    const bufRegular = await resRegular.arrayBuffer();
    doc.addFileToVFS("Roboto-Regular.ttf", toBase64(bufRegular));
    doc.addFont("Roboto-Regular.ttf", "Roboto", "normal");

    const resBold = await fetch("/fonts/Roboto-Bold.ttf");
    const bufBold = await resBold.arrayBuffer();
    doc.addFileToVFS("Roboto-Bold.ttf", toBase64(bufBold));
    doc.addFont("Roboto-Bold.ttf", "Roboto", "bold");
  };

// Tạo và xuất file PDF hóa đơn
  const generatePDF = async (shipment) => {
    setDownloading(shipment.id);

    try {
      const doc = new jsPDF({ orientation: "portrait", unit: "mm", format: "a4" });
      const pageWidth = doc.internal.pageSize.getWidth();
      const margin = 15;

      await loadVietnameseFont(doc);
      doc.setFont("Roboto", "normal");

      doc.setFillColor(17, 62, 72);
      doc.rect(0, 0, pageWidth, 45, "F");

      doc.setTextColor(255, 255, 255);
      doc.setFontSize(22);
      doc.setFont("Roboto", "bold");
      doc.text("SPEEDYSHIP", margin, 20);

      doc.setFontSize(9);
      doc.setFont("Roboto", "normal");
      doc.text("Hệ thống vận chuyển nhanh & tin cậy", margin, 28);
      doc.text("Hotline: 0236 123 4567 | Email: contact@speedyship.vn", margin, 34);

      doc.setFontSize(11);
      doc.setFont("Roboto", "bold");
      doc.text("HÓA ĐƠN VẬN CHUYỂN", pageWidth - margin, 20, { align: "right" });

      doc.setFontSize(9);
      doc.setFont("Roboto", "normal");
      doc.text(`Mã đơn: ${shipment.tracking_code}`, pageWidth - margin, 28, {
        align: "right",
      });
      doc.text(
        `Ngày tạo: ${new Date(shipment.created_at).toLocaleDateString("vi-VN")}`,
        pageWidth - margin,
        34,
        { align: "right" }
      );

      let y = 55;
      const colWidth = (pageWidth - margin * 2) / 2;

      doc.setTextColor(17, 62, 72);
      doc.setFontSize(10);
      doc.setFont("Roboto", "bold");
      doc.text("NGƯỜI GỬI", margin, y);
      doc.setFont("Roboto", "normal");
      doc.setFontSize(9);
      doc.setTextColor(80, 80, 80);
      doc.text(`${shipment.sender_name || "---"}`, margin, y + 7);
      doc.text(`SĐT: ${shipment.sender_phone || "---"}`, margin, y + 14);

      const pickupLines = doc.splitTextToSize(
        shipment.pickup_address || "---",
        colWidth - 5
      );
      doc.text(pickupLines, margin, y + 21);

      const rxStart = margin + colWidth + 5;
      doc.setTextColor(17, 62, 72);
      doc.setFontSize(10);
      doc.setFont("Roboto", "bold");
      doc.text("NGƯỜI NHẬN", rxStart, y);
      doc.setFont("Roboto", "normal");
      doc.setFontSize(9);
      doc.setTextColor(80, 80, 80);
      doc.text(`${shipment.receiver_name || "---"}`, rxStart, y + 7);
      doc.text(`SĐT: ${shipment.receiver_phone || "---"}`, rxStart, y + 14);

      const deliveryLines = doc.splitTextToSize(
        shipment.delivery_address || "---",
        colWidth - 5
      );
      doc.text(deliveryLines, rxStart, y + 21);

      y += 40;
      doc.setDrawColor(200, 200, 200);
      doc.setLineDashPattern([2, 2], 0);
      doc.line(margin, y, pageWidth - margin, y);
      doc.setLineDashPattern([], 0);

      y += 8;
      doc.setTextColor(17, 62, 72);
      doc.setFontSize(10);
      doc.setFont("Roboto", "bold");
      doc.text("CHI TIẾT HÀNG HÓA", margin, y);

      autoTable(doc, {
        startY: y + 5,
        margin: { left: margin, right: margin },
        head: [["Hàng hóa", "Số lượng", "Trọng lượng", "Dịch vụ"]],
        body: [
          [
            shipment.item_name || "Hàng hóa",
            `${shipment.quantity || 1} kiện`,
            `${shipment.weight_kg || "---"} kg`,
            getStatusLabel(shipment.service_type || "express"),
          ],
        ],
        styles: {
          font: "Roboto",
          fontSize: 9,
          cellPadding: 4,
          textColor: [60, 60, 60],
        },
        headStyles: {
          fillColor: [245, 245, 245],
          textColor: [17, 62, 72],
          fontStyle: "bold",
          lineWidth: 0,
        },
        alternateRowStyles: { fillColor: [252, 252, 252] },
        tableLineColor: [230, 230, 230],
        tableLineWidth: 0.2,
      });

      const afterTableY = doc.lastAutoTable.finalY + 10;

      doc.setTextColor(17, 62, 72);
      doc.setFontSize(10);
      doc.setFont("Roboto", "bold");
      doc.text("THANH TOÁN", margin, afterTableY);

      const codAmount = Number(shipment.cod_amount) || 0;
      const shippingFee = Number(shipment.shipping_fee) || 0;
      const totalCollect = codAmount + shippingFee;

      autoTable(doc, {
        startY: afterTableY + 5,
        margin: { left: margin, right: margin },
        head: [["Khoản mục", "Số tiền"]],
        body: [
          ["Phí vận chuyển", `${fmt(shippingFee)} VNĐ`],
          ["Thu hộ COD", `${fmt(codAmount)} VNĐ`],
          ["Hình thức thanh toán", shipment.payment_method || "COD"],
        ],
        foot: [["TỔNG THU NGƯỜI NHẬN", `${fmt(totalCollect)} VNĐ`]],
        styles: {
          font: "Roboto",
          fontSize: 9,
          cellPadding: 4,
          textColor: [60, 60, 60],
        },
        headStyles: {
          fillColor: [245, 245, 245],
          textColor: [17, 62, 72],
          fontStyle: "bold",
        },
        footStyles: {
          fillColor: [17, 62, 72],
          textColor: [255, 255, 255],
          fontStyle: "bold",
          fontSize: 10,
        },
        columnStyles: {
          1: { halign: "right" },
        },
        tableLineColor: [230, 230, 230],
        tableLineWidth: 0.2,
      });

      const afterPayY = doc.lastAutoTable.finalY + 10;
      doc.setFillColor(245, 245, 245);
      doc.roundedRect(margin, afterPayY, pageWidth - margin * 2, 16, 3, 3, "F");
      doc.setTextColor(100, 100, 100);
      doc.setFontSize(9);
      doc.setFont("Roboto", "normal");
      doc.text(
        `Trạng thái đơn hàng: ${getStatusLabel(shipment.status).toUpperCase()}`,
        margin + 5,
        afterPayY + 7
      );
      doc.text(
        `Cập nhật: ${new Date(shipment.updated_at || shipment.created_at).toLocaleString("vi-VN")}`,
        margin + 5,
        afterPayY + 13
      );

      const footerY = doc.internal.pageSize.getHeight() - 25;
      doc.setDrawColor(230, 230, 230);
      doc.line(margin, footerY, pageWidth - margin, footerY);

      doc.setTextColor(150, 150, 150);
      doc.setFontSize(8);
      doc.text(
        "SpeedyShip - Hệ thống vận chuyển nhanh & tin cậy",
        pageWidth / 2,
        footerY + 6,
        { align: "center" }
      );
      doc.text(
        "Số 123, Nguyễn Văn Linh, Thanh Khê, Đà Nẵng | www.speedyship.vn",
        pageWidth / 2,
        footerY + 11,
        { align: "center" }
      );
      doc.text(
        `Hóa đơn được xuất tự động lúc ${new Date().toLocaleString("vi-VN")}`,
        pageWidth / 2,
        footerY + 16,
        { align: "center" }
      );

      doc.save(`HoaDon_${shipment.tracking_code}.pdf`);
      toast.success(`Đã tải hóa đơn ${shipment.tracking_code}`);
    } catch (error) {
      toast.error("Lỗi khi tạo PDF!");
    } finally {
      setDownloading(null);
    }
  };

// Xuất tất cả hóa đơn
  const exportAll = () => {
    if (filtered.length === 0) return toast.error("Không có đơn nào để xuất!");
    filtered.forEach((s, i) => {
      setTimeout(() => generatePDF(s), i * 500);
    });
  };

  return (
    <div className="animate-in fade-in duration-500 space-y-6 pb-10">
      <Toaster position="top-right" />

      {}
      <div
        className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-white p-5 rounded-2xl shadow-sm border border-gray-100"
        data-aos="fade-up"
      >
        <div>
          <h1 className="text-xl font-extrabold text-[#113e48] flex items-center gap-2">
            <Receipt className="text-orange-500" size={24} /> Xuất hóa đơn PDF
          </h1>
          <p className="text-xs text-gray-500 mt-1">
            Chọn đơn hàng và tải xuống hóa đơn dạng PDF chuyên nghiệp.
          </p>
        </div>

        <div className="flex flex-col sm:flex-row gap-3 w-full md:w-auto">
          {}
          <div className="relative group">
            <Search
              className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 group-focus-within:text-orange-500 transition-colors"
              size={16}
            />
            <input
              type="text"
              placeholder="Tìm mã vận đơn..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="pl-9 pr-4 py-2.5 border border-gray-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-orange-500/20 focus:border-orange-500 w-full sm:w-56 transition-all"
            />
          </div>

          {}
          <StatusFilterDropdown value={filterStatus} onChange={(v) => { setFilterStatus(v); setPage(1); }} />

          {}
          <button
            onClick={exportAll}
            className="flex items-center gap-2 bg-[#113e48] hover:bg-[#1a5c6a] text-white px-4 py-2.5 rounded-xl text-sm font-bold transition-colors shadow-sm"
          >
            <Download size={16} /> Xuất tất cả ({filtered.length})
          </button>
        </div>
      </div>

      {}
      <div
        className="bg-white border border-gray-100 rounded-2xl shadow-sm overflow-hidden"
        data-aos="fade-up"
        data-aos-delay="100"
      >
        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left">
            <thead className="bg-gray-50 text-gray-500 font-medium border-b border-gray-100 text-xs uppercase tracking-wider">
              <tr>
                <th className="px-6 py-4">Mã vận đơn</th>
                <th className="px-6 py-4">Người nhận</th>
                <th className="px-6 py-4 text-center">Trạng thái</th>
                <th className="px-6 py-4 text-right">Phí ship</th>
                <th className="px-6 py-4 text-right">COD</th>
                <th className="px-6 py-4 text-center">Ngày tạo</th>
                <th className="px-6 py-4 text-center">Thao tác</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {loading ? (
                [...Array(5)].map((_, i) => (
                  <tr key={i}>
                    <td colSpan="7" className="px-6 py-4">
                      <div className="h-4 bg-gray-100 rounded animate-pulse"></div>
                    </td>
                  </tr>
                ))
              ) : filtered.length === 0 ? (
                <tr>
                  <td
                    colSpan="7"
                    className="px-6 py-12 text-center text-gray-400 italic"
                  >
                    Không tìm thấy đơn hàng nào.
                  </td>
                </tr>
              ) : (
                currentItems.map((s) => (
                  <tr
                    key={s.id}
                    className="hover:bg-gray-50/50 transition-colors group"
                  >
                    <td className="px-6 py-4 font-bold text-[#113e48] font-mono">
                      {s.tracking_code}
                    </td>
                    <td className="px-6 py-4">
                      <div className="font-medium text-gray-900">
                        {s.receiver_name}
                      </div>
                      <div className="text-xs text-gray-400">
                        {s.receiver_phone}
                      </div>
                    </td>
                    <td className="px-6 py-4 text-center">
                      {getStatusBadge(s.status)}
                    </td>
                    <td className="px-6 py-4 text-right font-mono text-gray-600">
                      {fmt(s.shipping_fee)}₫
                    </td>
                    <td className="px-6 py-4 text-right font-mono text-gray-600">
                      {fmt(s.cod_amount)}₫
                    </td>
                    <td className="px-6 py-4 text-center text-xs text-gray-400">
                      {new Date(s.created_at).toLocaleDateString("vi-VN")}
                    </td>
                    <td className="px-6 py-4 text-center">
                      <div className="flex justify-center gap-2">
                        {}
                        <button
                          onClick={() =>
                            setPreviewData(
                              previewData?.id === s.id ? null : s
                            )
                          }
                          className="p-2 text-blue-600 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors"
                          title="Xem trước"
                        >
                          <Eye size={16} />
                        </button>
                        {}
                        <button
                          onClick={() => generatePDF(s)}
                          disabled={downloading === s.id}
                          className="p-2 text-orange-600 bg-orange-50 hover:bg-orange-100 rounded-lg transition-colors disabled:opacity-50 flex items-center gap-1"
                          title="Tải PDF"
                        >
                          {downloading === s.id ? (
                            <Loader2 size={16} className="animate-spin" />
                          ) : (
                            <Download size={16} />
                          )}
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
        <Pagination
          currentPage={page}
          totalPages={totalPages}
          onPageChange={setPage}
        />
      </div>

      {}
      {previewData && (
        <div className="fixed bottom-6 right-6 z-50 w-full max-w-lg bg-white rounded-2xl shadow-2xl border border-gray-200 overflow-hidden animate-in slide-in-from-bottom-4 duration-300">
          {}
          <div className="flex justify-between items-center px-5 py-3 bg-[#113e48] text-white">
            <h3 className="font-bold flex items-center gap-2 text-sm">
              <FileText size={16} className="text-orange-400" />
              Xem trước — {previewData.tracking_code}
            </h3>
            <div className="flex items-center gap-2">
              <button
                onClick={() => generatePDF(previewData)}
                className="flex items-center gap-1.5 bg-orange-500 hover:bg-orange-600 text-white px-3 py-1.5 rounded-lg text-xs font-bold transition-colors"
              >
                <Download size={13} /> Tải PDF
              </button>
              <button
                onClick={() => setPreviewData(null)}
                className="text-white/70 hover:text-white transition-colors p-1"
              >
                <XCircle size={18} />
              </button>
            </div>
          </div>

          {}
          <div className="p-4 space-y-3 max-h-[60vh] overflow-y-auto">
            <div className="grid grid-cols-2 gap-3">
              {}
              <div className="bg-blue-50 p-3 rounded-xl border border-blue-100">
                <p className="text-[10px] font-bold text-blue-600 uppercase mb-1">Người gửi</p>
                <p className="font-bold text-[#113e48] text-sm">{previewData.sender_name}</p>
                <p className="text-xs text-gray-500">{previewData.sender_phone}</p>
                <p className="text-xs text-gray-400 mt-1 line-clamp-2">{previewData.pickup_address}</p>
              </div>
              {}
              <div className="bg-green-50 p-3 rounded-xl border border-green-100">
                <p className="text-[10px] font-bold text-green-600 uppercase mb-1">Người nhận</p>
                <p className="font-bold text-[#113e48] text-sm">{previewData.receiver_name}</p>
                <p className="text-xs text-gray-500">{previewData.receiver_phone}</p>
                <p className="text-xs text-gray-400 mt-1 line-clamp-2">{previewData.delivery_address}</p>
              </div>
            </div>

            {}
            <div className="bg-[#113e48] text-white p-4 rounded-xl flex justify-between items-center">
              <div className="space-y-1">
                <div className="flex justify-between gap-8 text-xs">
                  <span className="text-white/60">Phí vận chuyển:</span>
                  <span className="font-bold">{fmt(previewData.shipping_fee)}₫</span>
                </div>
                <div className="flex justify-between gap-8 text-xs">
                  <span className="text-white/60">Thu hộ COD:</span>
                  <span className="font-bold">{fmt(previewData.cod_amount)}₫</span>
                </div>
                <div className="pt-1 border-t border-white/20 flex justify-between gap-8 text-xs">
                  <span className="text-white/60">Trạng thái:</span>
                  <span className="font-bold text-orange-300">{getStatusLabel(previewData.status)}</span>
                </div>
              </div>
              <div className="text-right">
                <p className="text-[10px] text-orange-400 uppercase font-bold tracking-wider">Tổng thu</p>
                <p className="text-xl font-black">
                  {fmt(Number(previewData.cod_amount) + Number(previewData.shipping_fee))}₫
                </p>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
