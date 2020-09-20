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

1. Provide access key from Info.plist

```xml
<key>Map4dMapAccessKey</key>
<string>{your_key}</string>
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
[1. Getting started](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/0-getting-started.md) 

[2. Map user interaction](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/1-map-user-interaction.md) 

[3. Type](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/2-type.md)

[4. Map events](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/3-map-events.md)

[5. Marker](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/4-marker.md)

[6. Polyline](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/5-polyline.md)

[7. Polygon](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/6-polygon.md)

[8. Circle](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/7-circle.md)

[9. 3D objects](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/8-3d-objecrt.md)

[10. Effect map](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/10-effect-map.md)

[11. LatLngBounds](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/11-lat-lng-bounds.md)

[12. Map utils](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/12-map-utils.md)

[13. Place](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/13-place.md)

[14. POI](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFPOI.md)

[15. Building](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFBuilding.md)

[16. Tile Overlay](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFTileOverlay.md)

[17. Building Overlay](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFBuildingOverlay.md)

[18. POI Overlay](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFPOIOverlay.md)

[19. Ground Overlay](https://github.com/map4d/map4d-ios-sdk/blob/master/docs/vi/1.4/MFGroundOverlay.md)


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
