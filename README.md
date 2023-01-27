# Map4D SDK

Map4D SDK for iOS, written in C/C++, Objective C.

![Map4D iOS SDK](https://docs.map4d.vn/map4d-ios-sdk/resource/Untitled-1_0000_Right-Mockup--phone-demo.png)


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
<string>YOUR_ACCESS_KEY</string>
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

## Document

https://docs.map4d.vn/map4d-map/ios/


License
-------

Copyright (C) 2023 IOT Link Ltd. All Rights Reserved.
