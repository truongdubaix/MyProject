import { useEffect, useMemo, useState } from "react";
import API from "../../services/api";
import { useChat } from "../../context/ChatContext";
import {
  Headphones,
  FileText,
  ChevronDown,
  Loader2,
  MessageCircle,
  CircleHelp,
  PackageSearch,
  Wallet,
  UserCircle2,
} from "lucide-react";

const FAQ_CATEGORY_ORDER = ["general", "order", "payment", "account"];

const FAQ_CATEGORY_META = {
  general: { label: "Câu hỏi chung", icon: CircleHelp },
  order: { label: "Đơn hàng", icon: PackageSearch },
  payment: { label: "Thanh toán", icon: Wallet },
  account: { label: "Tài khoản", icon: UserCircle2 },
};

const DEFAULT_QUESTIONS_BY_CATEGORY = {
  general: [
    "SpeedyShip hoạt động ở khu vực nào?",
    "Làm sao liên hệ tổng đài SpeedyShip?",
    "Khung giờ hỗ trợ khách hàng của SpeedyShip?",
    "Tôi có thể chat với nhân viên hỗ trợ ở đâu?",
  ],
  order: [
    "Cách tạo đơn hàng nhanh trên SpeedyShip?",
    "Tôi muốn tra cứu vận đơn thì làm thế nào?",
    "Tôi có thể đổi địa chỉ nhận sau khi tạo đơn không?",
    "Đơn giao thất bại thì xử lý như thế nào?",
  ],
  payment: [
    "Phí vận chuyển nội thành và liên tỉnh bao nhiêu?",
    "Có hỗ trợ thu hộ COD không?",
    "Tôi nạp/rút tiền ví SpeedyShip như thế nào?",
    "Các phương thức thanh toán được hỗ trợ là gì?",
  ],
  account: [
    "Quên mật khẩu thì làm sao lấy lại?",
    "Tôi muốn cập nhật số điện thoại tài khoản ở đâu?",
    "Tài khoản bị khóa thì xử lý thế nào?",
    "Làm sao đổi thông tin hồ sơ cá nhân?",
  ],
};

const inferCategory = (question = "") => {
  const q = question.toLowerCase();
  if (/(đơn|vận đơn|tra cứu|giao|nhận|pickup|delivery)/.test(q)) return "order";
  if (/(thanh toán|ví|cod|phí|giá|tiền|nạp|rút)/.test(q)) return "payment";
  if (/(tài khoản|đăng nhập|mật khẩu|profile|hồ sơ|khóa)/.test(q)) return "account";
  return "general";
};

const formatAnswerToBullets = (answer = "") => {
  const rawLines = String(answer)
    .split("\n")
    .map((line) => line.trim())
    .filter(Boolean);

  const cleanLines = rawLines.map((line) =>
    line.replace(/^[-*•\d.)\s]+/, "").trim(),
  );

  return cleanLines.length > 0 ? cleanLines : [String(answer || "").trim()];
};

export default function CustomerSupport() {
  const { openAIChat } = useChat();
  const [activeMainTab, setActiveMainTab] = useState("faq");
  const [activeFaqTab, setActiveFaqTab] = useState("general");
  const [loadingFaq, setLoadingFaq] = useState(false);
  const [questionsByCategory, setQuestionsByCategory] = useState(DEFAULT_QUESTIONS_BY_CATEGORY);
  const [expandedQuestion, setExpandedQuestion] = useState(null);
  const [answerByQuestion, setAnswerByQuestion] = useState({});
  const [loadingAnswerQuestion, setLoadingAnswerQuestion] = useState("");

  useEffect(() => {
    if (activeMainTab !== "faq") return;

    setLoadingFaq(true);
    API.get("/ai/faq-suggestions")
      .then((res) => {
        const list = Array.isArray(res.data?.suggestions) ? res.data.suggestions : [];
        if (list.length === 0) return;

        const next = {
          general: [...DEFAULT_QUESTIONS_BY_CATEGORY.general],
          order: [...DEFAULT_QUESTIONS_BY_CATEGORY.order],
          payment: [...DEFAULT_QUESTIONS_BY_CATEGORY.payment],
          account: [...DEFAULT_QUESTIONS_BY_CATEGORY.account],
        };

        list.forEach((q) => {
          const category = inferCategory(q);
          if (!next[category].includes(q)) next[category].push(q);
        });
        setQuestionsByCategory(next);
      })
      .finally(() => setLoadingFaq(false));
  }, [activeMainTab]);

  const faqQuestions = useMemo(
    () => questionsByCategory[activeFaqTab] || [],
    [activeFaqTab, questionsByCategory],
  );

  const handleToggleQuestion = async (question) => {
    if (expandedQuestion === question) {
      setExpandedQuestion(null);
      return;
    }

    setExpandedQuestion(question);
    if (answerByQuestion[question]) return;

    setLoadingAnswerQuestion(question);
    try {
      const res = await API.post("/ai/ask", { message: question });
      setAnswerByQuestion((prev) => ({
        ...prev,
        [question]: res.data?.reply || "Hiện chưa có câu trả lời phù hợp cho câu hỏi này.",
      }));
    } catch {
      setAnswerByQuestion((prev) => ({
        ...prev,
        [question]: "AI đang bận, bạn vui lòng thử lại sau vài giây.",
      }));
    } finally {
      setLoadingAnswerQuestion("");
    }
  };

  return (
    <div className="space-y-6 animate-in fade-in duration-500">
      <div className="bg-gradient-to-r from-blue-600 to-blue-800 p-8 rounded-2xl text-white shadow-lg relative overflow-hidden">
        <div className="relative z-10">
          <h1 className="text-2xl font-bold mb-2 flex items-center gap-2">
            <Headphones /> Trung tâm hỗ trợ AI
          </h1>
          <p className="text-blue-100 text-sm max-w-xl">
            FAQ theo từng nhóm chủ đề. Chạm vào câu hỏi để AI SpeedyShip trả lời ngay.
          </p>
        </div>
        <div className="absolute right-0 bottom-0 opacity-20">
          <Headphones size={120} />
        </div>
      </div>

      <div className="flex gap-4 border-b border-gray-200">
        <button
          onClick={() => setActiveMainTab("faq")}
          className={`pb-3 px-2 text-sm font-bold transition-all border-b-2 ${
            activeMainTab === "faq"
              ? "border-orange-500 text-orange-600"
              : "border-transparent text-gray-500 hover:text-gray-700"
          }`}
        >
          FAQ AI
        </button>
        <button
          onClick={() => setActiveMainTab("history")}
          className={`pb-3 px-2 text-sm font-bold transition-all border-b-2 ${
            activeMainTab === "history"
              ? "border-orange-500 text-orange-600"
              : "border-transparent text-gray-500 hover:text-gray-700"
          }`}
        >
          Lịch sử hỗ trợ
        </button>
      </div>

      <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 min-h-[460px]">
        {activeMainTab === "history" && (
          <div className="text-center py-10">
            <div className="bg-gray-50 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
              <FileText size={32} className="text-gray-400" />
            </div>
            <p className="text-gray-500">Bạn chưa có lịch sử hỗ trợ gần đây.</p>
          </div>
        )}

        {activeMainTab === "faq" && (
          <div className="grid grid-cols-1 lg:grid-cols-[240px_1fr] gap-6">
            <aside className="space-y-2">
              {FAQ_CATEGORY_ORDER.map((tab) => {
                const isActive = tab === activeFaqTab;
                const TabIcon = FAQ_CATEGORY_META[tab].icon;
                return (
                  <button
                    key={tab}
                    onClick={() => {
                      setActiveFaqTab(tab);
                      setExpandedQuestion(null);
                    }}
                    className={`w-full text-left px-4 py-2.5 rounded-lg text-sm font-semibold transition-colors ${
                      isActive
                        ? "bg-orange-50 text-orange-600 border border-orange-200"
                        : "text-gray-600 border border-transparent hover:bg-gray-50"
                    }`}
                  >
                    <span className="flex items-center gap-2">
                      <TabIcon size={15} />
                      {FAQ_CATEGORY_META[tab].label}
                    </span>
                  </button>
                );
              })}

              <div className="mt-6 rounded-xl border border-red-100 bg-red-50 p-4">
                <p className="text-sm font-bold text-[#113e48]">Bạn vẫn cần trợ giúp?</p>
                <p className="text-xs text-gray-600 mt-1 mb-3">
                  Chat trực tiếp với AI để hỏi theo ngữ cảnh đơn hàng của bạn.
                </p>
                <button
                  onClick={() => {
                    openAIChat();
                  }}
                  className="w-full bg-red-500 hover:bg-red-600 text-white text-xs font-bold py-2 rounded-lg flex items-center justify-center gap-2"
                >
                  <MessageCircle size={14} /> Trò chuyện ngay
                </button>
              </div>
            </aside>

            <section className="space-y-3">
              {loadingFaq && (
                <div className="text-sm text-gray-500 py-5 flex items-center gap-2">
                  <Loader2 size={16} className="animate-spin" /> Đang tải câu hỏi FAQ...
                </div>
              )}

              {!loadingFaq &&
                faqQuestions.map((q) => {
                  const isOpen = expandedQuestion === q;
                  const answer = answerByQuestion[q];
                  const isLoadingThis = loadingAnswerQuestion === q;

                  return (
                    <div key={q} className="border border-gray-200 rounded-lg overflow-hidden">
                      <button
                        onClick={() => handleToggleQuestion(q)}
                        className="w-full px-4 py-3.5 flex items-center justify-between text-left hover:bg-gray-50 transition-colors"
                      >
                        <span className="text-sm font-medium text-[#113e48]">{q}</span>
                        <ChevronDown
                          size={18}
                          className={`text-gray-400 transition-transform ${isOpen ? "rotate-180" : ""}`}
                        />
                      </button>

                      {isOpen && (
                        <div className="px-4 py-3 border-t border-gray-100 bg-gray-50">
                          {isLoadingThis && (
                            <p className="text-sm text-gray-500 flex items-center gap-2">
                              <Loader2 size={14} className="animate-spin" /> AI đang trả lời...
                            </p>
                          )}
                          {!isLoadingThis && (
                            <ul className="space-y-1.5">
                              {formatAnswerToBullets(answer).map((line, idx) => (
                                <li key={`${q}-${idx}`} className="text-sm text-gray-700 leading-relaxed flex gap-2">
                                  <span className="text-[#113e48]">•</span>
                                  <span>{line}</span>
                                </li>
                              ))}
                            </ul>
                          )}
                        </div>
                      )}
                    </div>
                  );
                })}
            </section>
          </div>
        )}
      </div>
    </div>
  );
}
