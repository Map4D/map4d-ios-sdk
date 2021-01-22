#Đối tượng 3D trên map

##1. Bật tắt chế độ 3D

  - Để bật tắt chế độ 3D sử dụng:
    ```swift
      mapView.enable3DMode(true) //Bật chế độ 3D
      mapView.enable3DMode(false) //Tắt chế độ 3D chuyển về 2D
    ```
  - Người dùng có thể bật tắt chế độ 3D thông qua button 3D mode ở bảng điều khiển
  - Hàm **enable3DMode()**:
     - **true** : Bật chế độ 3D, tại chế độ này khi map sẽ ở mức zoom >= 17 và hiển thị các đối tượng 3D
     - **false** : Tắt chế độ 3D, map sẽ ở chế độ 2D ở mọi mức zoom
  
##2. Thay đổi thời gian của map
 
 - Map 4D SDK cho phép người dùng thiết lập thời gian cho map, dữ liệu 3D và các địa điểm sẽ được lấy theo thời gian người dùng thiết lập, mặc định sẽ lấy thời gian hiện tại.
 
 - Nếu bạn cài đặt thời gian cho map là 01/01/2000 thì tất cả các đối tượng 3D mà có thời gian sau 01/01/2000 thì sẽ không được hiển thị trên bản đồ.
    ```swift
      let time = "2000-01-01T10:44:00+0000"
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      let date = dateFormatter.date(from: time)!
      mapView.setTime(date)
    ```
      
## 3. Các sự kiện trên đối tượng 3D

  - Sự kiện click phát sinh khi người dùng click lên đối tượng 3D 
    ```swift
       optional func mapView(_ mapView: MFMapView!, didTap object: MFObject!)
    ```
  - Hướng dẫn sử dụng
    ```swift
      func mapView(_ mapView: MFMapView!, didTap object: MFObject!) {
          <#code#>
      }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.