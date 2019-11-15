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
    - Cung cấp access key
    ```swift
      import Map4dMap

      @UIApplicationMain
      class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // Override point for customization after application launch.
          MFServices.provideAccessKey("98fd21346d83bee24dc734231f7609c9")        
          return true
        }
      }
    ```
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
## 4. Các chế độ chuyển đổi mode 2D và 3D 

  - Cho phép thay đổi chế độ chuyển 2D & 3D của map. Có 4 chế độ:
    ```swift
      mapView.switchMode = .manual
    ```
    ```swift
      public enum MFSwitchMode : UInt {
        case `default`
        case auto2DTo3D
        case auto3DTo2D
        case auto
        case manual
      }
    ```
  - Chế độ mặc định là: auto3DTo2D
  - Auto3DTo2D:
    - Tự động chuyển từ chế độ 3D sang 2D, khi điều khiển map từ mức zoom >= 17 về mức zoom  < 17
    - Map vẫn giữ chế độ 2D khi điều map từ mức zoom < 17 sang mức zoom >= 17.
    - Muốn chuyển sang chế độ 3D phải dùng hàm enable3dMode(true)
  - Auto2DTo3D:
    - Tự động chuyển chuyển từ chế độ 2D qua 3D khi điều khiển zoom từ mức zoom < 17 lên mức zoom >= 17.
    - Khi map đang ở mức zoom >= 17, nếu map đang ở chế độ 3D thì khi không cho phép điều khiển zoom xuống mức zoom < 17. Muốn chuyển qua chế độ 2D, phải dùng hàm enable3dMode(false)
    - Khi map đang ở mức zoom >= 17, nếu map đang chế độ 2D, thì map vẫn có thể zoom về mức zoom < 17.
  - Auto:
    - Tự động chuyển chuyển từ chế độ 2D qua 3D khi điều khiển zoom từ mức zoom < 17 lên mức zoom >= 17.
    - Tự động chuyển từ chế độ 3D sang 2D khi điều khiển zoom từ mức zoom >= 17 về mức zoom < 17.
  - Manual:
    - Khi map đang ở mức zoom >= 17, nếu map đang ở chế độ 3D thì khi không cho phép điều khiển zoom xuống mức zoom < 17. 
    - Map cũng không tự động chuyển về chế độ 3D khi zoom từ mức zoom 17 lên 18.
    - Sử dụng hàm enable3dMode(boolean) khi muốn chuyển qua lại chế độ 2D và 3D.

## 5. Thay đổi trạng thái và lấy các thông số của map

  - Cho phép thay đổi các trạng thái và lấy các thông số của map như độ nghiêng, độ xoay, điểm trung tâm, mức zoom hiện tại
    ```swift
      // Lấy thông số camera hiện tại của map.
      let camera = mapView.camera
    
      // Cài đặt các thông số camera cho map.
      let cameraPosition = MFCameraPosition(target: CLLocationCoordinate2D(latitude: 16.036438, longitude: 108.218161), zoom: 17, tilt: 0, bearing: 20)
      mapView.camera = cameraPosition
    ```
    
  - mapView.is3dMode(): trả về thông tin hiện tại map là 2D or 3D.
    ```swift
      let is3DMode = mapView.is3DMode()
    ```
    - false: 2D mode
    - true: 3D mode

  - (void) setMaxNativeZoom: (double) zoom: Cài đặt mức zoom tối đa có thể get Tile từ server
    ```swift
      mapView.setMaxNativeZoom(19)
    ```
  - Ví dụ : Nếu bạn cài đặt nativeZoom = 19 thì từ mức zoom > 19 sẽ lấy Tile từ mức zoom 19 mà không phải get lại tile mới từ server.

## 6. Di chuyển map

  - Map4D SDK hỗ trợ người dùng di chuyển tới một vị trí camera mới thông qua 2 hàm animate và move.

    ```swift
      open func animateCamera(_ cameraUpdate: MFCameraUpdate!)
      open func moveCamera(_ cameraUpdate: MFCameraUpdate!)
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
