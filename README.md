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
pod 'Map4dMap'
```

## Using

1. Provide access key

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
  //....
}

```

2. Create map view

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

## Document references
[1. Getting started](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/0-getting-started.md) 

[2. Map user interaction](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/1-map-user-interaction.md) 

[3. Type](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/2-type.md)

[4. Map events](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/3-map-events.md)

[5. Marker](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/4-marker.md)

[6. Polyline](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/5-polyline.md)

[7. Polygon](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/6-polygon.md)

[8. Circle](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/7-circle.md)

[9. 3D objects](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/8-3d-objecrt.md)

[10. Tile area](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/9-tile-area.md)

[11. Effect map](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/10-effect-map.md)

[12. LatLngBounds](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/11-lat-lng-bounds.md)

[13. Map utils](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/12-map-utils.md)

[14. Place](https://github.com/iotlinkadmin/map4d-ios-sdk/blob/master/docs/vi/1.2/13-place.md)


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
