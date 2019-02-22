# Cài đặt Map4D-SDK

## 1. Giới hạn mức zoom tối đa và tối thiểu

```switf
  map4d.setMinZoom(3, maxZoom: 20)
```

## 2. Bật tắt chế độ 3D & 2D

```switf
    // setMode = 3D, minZoom = 17
    map4d.enable3dMode(true)

    // set Mode = 2D
    map4d.enable3dMode(false)
```

## 3. Chế độ chuyển 2D và 3D
```switf
  mapView.switchMode = .auto
```

```switf
typedef NS_ENUM(MFSwitchMode) {
  MFSwitchModeDefault,
  MFSwitchModeAuto2DTo3D,
  MFSwitchModeAuto3DTo2D,
  MFSwitchModeAuto,
  MFSwitchModeManual
};
```

Auto3DTo2D:
 - **Không** tự động chuyển chuyển từ chế độ 2D qua 3D khi điều khiển zoom từ mức zoom < 17 lên mức zoom > 17.
 - Khi map đang ở mức zoom > 17, map ở chế độ 3D thì khi điều khiển zoom xuống zoom < 17, map sẽ tự động chuyển về chế độ 2D.
- Auto2DTo3D:
 - Tự động chuyển chuyển từ chế độ 2D qua 3D khi điều khiển zoom từ mức zoom < 17 lên mức zoom > 17.
 - Khi map đang ở mức zoom > 17, nếu map đang ở chế độ 3D thì khi không cho phép điều khiển zoom xuống mức zoom < 17.
 - Khi map đang ở mức zoom > 17, nếu map đang chế độ 2D, thì map vẫn có thể zoom về mức zoom < 17.
- Auto:
 - Tự động chuyển chuyển từ chế độ 2D qua 3D khi điều khiển zoom từ mức zoom < 17 lên mức zoom >= 17.
 - Tự động chuyển từ chế độ 3D sang 2D khi điều khiển zoom từ mức zoom >= 17 về mức zoom < 17.
- Manual:
 - Khi map đang ở mức zoom >= 17, nếu map đang ở chế độ 3D thì khi không cho phép điều khiển zoom xuống mức zoom < 17.  
- Default:
 - Chế độ mặc định là **Auto3DTo2D**

**Chú ý: các chế độ này chỉ có tác dụng khi người dùng tương tác với map, không ảnh hưởng khi gọi hàm pan, fly hay setCamera**


## 4. Thay đổi trạng thái và lấy các thông số của map.
Cho phép thay đổi các trạng thái và lấy các thông số của map như độ nghiêng, độ xoay, điểm trung tâm, mức zoom hiện tại

```switf
  // Lấy thông số camera hiện tại của map.
  let camera = map4d.camera

  // Cài đặt các thông số camera cho map.
  let cameraPosition = MFCameraPosition(target: CLLocationCoordinate2D(latitude: 16.036438, longitude: 108.218161), zoom: 17, tilt: 0, bearing: 20)
  map.camera = cameraPosition
```

```switf
  let mapUrl = mapView.mapUrl
```
- mapView.mapUrl: trả về thông tin url hiện tại của map.

```switf
  let is3DMode = mapView.is3dMode()
```
- mapView.is3dMode(): trả về thông tin hiện tại map là 2D or 3D.
  - false: 2D mode
  - true:  3D mode

```switf
  mapView.setMaxNativeZoom(19)
```
- - (void) setMaxNativeZoom: (double) zoom: Cài đặt mức zoom tối đa có thể get Tile từ server
    - Ví dụ : Nếu bạn cài đặt nativeZoom = 19 thì từ mức zoom > 19 sẽ lấy Tile từ mức zoom 19 mà không phải get lại tile mới từ server.


## 5. Thay đổi thời gian của map
Map 4D SDK cho phép người dùng thiết lập thời gian cho map, dữ liệu 3D và các địa điểm sẽ được lấy theo thời gian người dùng thiết lập, mặc định sẽ lấy thời gian hiện tại.

```switf
    let time = "2019-04-14T10:44:00+0000"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: time)!
    map4d.setTime(date)
```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
