# Cài đặt Map4D-SDK

## 1. Cài đặt

  - Sử dụng CocoaPods
    - Cập nhật lại repo local cocoapod
    ```ruby
      pod repo update
    ```
    - Thêm vào podfile
    ```ruby
      pod 'map4dsdk'
    ```

  - Cách dùng:
    - Cung cấp access key
    ```swift
    import map4dsdk

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?


        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.

            MFServices.provideAccessKey("98fd21346d83bee24dc734231f7609c9")        
            return true
        }
      //....
    }
    ```
    - Tạo 1 view chứa MAP4D.
    ```swift
    import UIKit
    import map4dsdk
    class ViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            let mapView = MFMapView(frame: self.view.frame)
            view = mapView
        }
    }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
