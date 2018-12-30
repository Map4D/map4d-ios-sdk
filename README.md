# Map4D SDK

Map4D SDK for iOS, written in C++, Objective C/C++.

[![CocoaPods](https://map4d.vn/Content/Client/img/Untitled-1_0000_Right-Mockup--phone-demo-copy.png)](https://map4d.vn) 


## Installation

Use [CocoaPods](https://cocoapods.org).

1. Update your cocoapods local repo
```ruby
pod repo update
```

2. Add to Podfile
```ruby
pod 'map4dsdk'
```

## Using

1. Provide access key

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

2. Create map view

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
