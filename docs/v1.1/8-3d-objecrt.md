#Đối tượng 3D trên map

##1. Bật tắt chế độ 3D

  - Để bật tắt chế độ 3D sử dụng:
    ```swift
      mapView.enable3dMode(true) //Bật chế độ 3D
      mapView.enable3dMode(!_3dMode) //Tắt chế độ 3D chuyển về 2D
    ```
  - Hàm **enable3dMode**:
     - **true** : Bật chế độ 3D, tại chế độ này khi map ở mức zoom >= 17 sẽ hiển thị các đối tượng 3D
     - **false** : Tắt chế độ 3D
  - Người dùng có thể bật tắt chế độ 3D thông qua button 3D mode ở bảng điều khiển
  
##2. Thay đổi thời gian của map
 
 - Map 4D SDK cho phép người dùng thiết lập thời gian cho map, dữ liệu 3D và các địa điểm sẽ được lấy theo thời gian người dùng thiết lập, mặc định sẽ lấy thời gian hiện tại.
 
 - Nếu bạn cài đặt thời gian cho map là 1/1/2017 thì tất cả các đối tượng 3D mà có thời gian sau 1/1/2017 thì sẽ không được hiển thị trên bản đồ.
    ```swift
      let time = "2019-04-14T10:44:00+0000"
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