const fs = require('fs');
const file = 'e:/SpeedyShipV1/MyProject/frontend/src/pages/admin/AdminDrivers.jsx';
let content = fs.readFileSync(file, 'utf8');

content = content.replace(
  /toast\.error\("Lỗi duyệt hồ sơ"\);\r?\n\s+\}\r?\n\s+\};\r?\n/,
  match => match + '\n  const rejectApplication = async (id) => {\n    if (!confirm("Từ chối hồ sơ này?")) return;\n    try {\n      await API.post(`/drivers/applications/${id}/reject`);\n      toast.success("Đã từ chối hồ sơ");\n      fetchApplications();\n    } catch {\n      toast.error("Lỗi từ chối hồ sơ");\n    }\n  };\n'
);

content = content.replace(
  /onClick=\{\(\) => alert\("Từ chối"\)\}/,
  'onClick={() => rejectApplication(app.id)}'
);

fs.writeFileSync(file, content);
console.log('AdminDrivers updated');
