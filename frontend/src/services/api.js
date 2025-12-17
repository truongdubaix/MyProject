import axios from "axios";

const API = axios.create({
  baseURL: "https://myproject-b8ov.onrender.com",
  withCredentials: true,
});

// interceptor để gắn token nếu có
API.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

export default API;
