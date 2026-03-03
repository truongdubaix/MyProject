import { useState, useCallback, useEffect } from "react";
import Map, { Marker, NavigationControl, GeolocateControl } from "react-map-gl";
import "mapbox-gl/dist/mapbox-gl.css";

// Token lấy từ .env
const MAPBOX_TOKEN = import.meta.env.VITE_MAPBOX_TOKEN;

export default function MapPicker({ defaultPos, onConfirm, onCancel }) {
  // State lưu vị trí: [lat, lng]
  // Fallback nếu defaultPos null thì lấy mặc định (ví dụ: Hà Nội/TPHCM)
  const [viewState, setViewState] = useState({
    latitude: defaultPos ? defaultPos[0] : 21.0285, // Mặc định Hà Nội
    longitude: defaultPos ? defaultPos[1] : 105.8542,
    zoom: 15,
  });

  const [marker, setMarker] = useState({
    latitude: defaultPos ? defaultPos[0] : 21.0285,
    longitude: defaultPos ? defaultPos[1] : 105.8542,
  });

  // Hàm xử lý khi kéo map
  const onMove = useCallback(({ viewState }) => {
    setViewState(viewState);
  }, []);

  // Hàm xử lý khi click vào map
  const onMapClick = useCallback((event) => {
    const { lat, lng } = event.lngLat;
    setMarker({
      latitude: lat,
      longitude: lng,
    });
  }, []);

  // Hàm xử lý khi kéo marker
  const onMarkerDragEnd = useCallback((event) => {
    const { lat, lng } = event.lngLat;
    setMarker({
      latitude: lat,
      longitude: lng,
    });
  }, []);

  return (
    // LƯU Ý: Class cha phải có chiều cao cụ thể (ví dụ h-[500px] hoặc h-screen) thì map mới hiện
    <div className="w-full h-full relative flex flex-col rounded-xl overflow-hidden border border-gray-300 shadow-sm">
      <Map
        {...viewState}
        onMove={onMove}
        onClick={onMapClick}
        style={{ width: "100%", height: "100%", flex: 1 }} // flex: 1 để chiếm hết chỗ trống
        mapStyle="mapbox://styles/mapbox/streets-v12"
        mapboxAccessToken={MAPBOX_TOKEN}
        cursor="crosshair" // Đổi con trỏ chuột thành dấu cộng để dễ chọn
      >
        {/* Nút tìm vị trí hiện tại */}
        <GeolocateControl position="top-left" />

        {/* Nút zoom +/- */}
        <NavigationControl position="top-left" />

        {/* Marker */}
        <Marker
          longitude={marker.longitude}
          latitude={marker.latitude}
          anchor="bottom" // QUAN TRỌNG: Để đuôi ảnh chạm đúng điểm
          draggable={true} // Cho phép kéo marker
          onDragEnd={onMarkerDragEnd}
        >
          <img
            src="https://cdn-icons-png.flaticon.com/512/684/684908.png"
            width={40}
            height={40}
            alt="marker"
            className="drop-shadow-lg cursor-pointer hover:scale-110 transition-transform"
          />
        </Marker>
      </Map>

      {/* ACTION BAR */}
      <div className="bg-white p-4 border-t flex justify-between items-center shadow-lg z-10">
        <div className="flex flex-col">
          <span className="text-xs text-gray-500 font-semibold uppercase">
            Tọa độ đã chọn:
          </span>
          <span className="text-sm font-mono text-gray-800">
            {marker.latitude.toFixed(6)}, {marker.longitude.toFixed(6)}
          </span>
        </div>

        <div className="flex gap-3">
          <button
            onClick={onCancel}
            className="px-4 py-2 rounded-lg bg-gray-100 text-gray-700 text-sm font-medium hover:bg-gray-200 transition"
          >
            Hủy
          </button>
          <button
            onClick={() =>
              onConfirm({ lat: marker.latitude, lng: marker.longitude })
            }
            className="px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-bold hover:bg-blue-700 transition shadow-md shadow-blue-500/30"
          >
            Xác nhận
          </button>
        </div>
      </div>
    </div>
  );
}
