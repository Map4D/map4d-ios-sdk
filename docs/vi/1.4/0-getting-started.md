# Tài liệu được viết với Swift 4.2

# Cài đặt Map4D-SDK

## 1. Cài đặt

  - Sử dụng CocoaPods
    - Cập nhật lại repo local cocoapod
    ```ruby
      pod repo update
    ```
    - Thêm vào podfile
    ```ruby
      pod 'Map4dMap'
    ```
  - Cách dùng:
    - Cung cấp access key:
    - Right click info.plist -> Open as -> Source Code sau đó thêm accesskey vào:
    
    ```
      <key>Map4dMapAccessKey</key>
      <string>98fd21346d83bee24dc734231f7609c9</string>
    ```
    - Hoặc click vào info.plist thêm access key như hình:
    
    - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/v1.4/0-accessKey.png)
    
    - Tạo 1 view chứa MAP4D
    ```swift
      import UIKit
      import Map4dMap
      
      class ViewController: UIViewController {
        override func viewDidLoad() {
          super.viewDidLoad()
          let mapView = MFMapView(frame: self.view.frame)
          view = mapView
        }
      }
    ```

## 2. Giới hạn mức zoom tối đa và tối thiểu

  - Set mức zoom tối đa và tối thiểu thông qua phương thức 
    ```swift
      mapView.setMinZoom(3, maxZoom: 20)
    ```
  
## 3. Bật tắt chế độ 2D và 3D 

  - Cho phép bật tắt chệ độ 2D và 3D 
  - Ở chế độ 3D minZoom = 17
    ```swift
      // setMode = 3D
      mapView.enable3DMode(true)

      // set Mode = 2D
      mapView.enable3DMode(false)
    ```

## 4. Thay đổi trạng thái và lấy các thông số của map

  - Cho phép thay đổi các trạng thái và lấy các thông số của map như độ nghiêng, độ xoay, điểm trung tâm, mức zoom hiện tại
  
    ```swift
      // Lấy thông số camera hiện tại của map.
      let camera = mapView.camera
      let target = camera?.target
      let zoom = camera?.zoom
      let bearing = camera?.bearing
      let tilt = camera?.tilt
    
      // Cài đặt các thông số camera cho map.
      let cameraPosition = MFCameraPosition(target: CLLocationCoordinate2D(latitude: 16.036438, longitude: 108.218161), zoom: 17, tilt: 0, bearing: 20)
      mapView.camera = cameraPosition
    ```
    
  - mapView.is3dMode(): trả về thông tin hiện tại map là 2D or 3D.
  
    ```swift
      let is3DMode = mapView.is3DMode()
    ```
    - false: Map đang ở chế độ 2D
    - true: Map đang ở chế độ 3D

  - setMaxNativeZoom: (double) zoom: Cài đặt mức zoom tối đa có thể get Tile từ server
    
    ```swift
      mapView.setMaxNativeZoom(19)
    ```
    
  - Ví dụ : Nếu bạn cài đặt nativeZoom = 19 thì từ mức zoom > 19 sẽ lấy Tile từ mức zoom 19 mà không phải get lại tile mới từ server.

## 5. Di chuyển map

  - Map4D SDK hỗ trợ người dùng di chuyển tới một vị trí camera mới thông qua 2 hàm animate và move.

    ```swift
    func animateCamera(_ cameraUpdate: MFCameraUpdate!)
    func moveCamera(_ cameraUpdate: MFCameraUpdate!)
    ```
    
  - Animate tới một vị trí mới:
  
    ```swift
    let cameraUpdate = MFCameraUpdate.setTarget(CLLocationCoordinate2DMake(10.773201, 106.700147), zoom: 17)
    mapView.animateCamera(cameraUpdate)
    ```
    
  - Move tới một vị trí mới:
  
    ```swift 
    let cameraUpdate = MFCameraUpdate.setTarget(CLLocationCoordinate2DMake(16.035147, 108.216797), zoom: 17)
    mapView.moveCamera(cameraUpdate)
    ```
    
    
License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
