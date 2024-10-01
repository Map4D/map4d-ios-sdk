# Map4D Map SDK for iOS
[![map4d](https://img.shields.io/badge/map4d-map-orange)](https://map4d.vn/)
[![platform](https://img.shields.io/cocoapods/p/Map4dMap)](https://www.apple.com/ios/)
[![cocoapods](https://img.shields.io/cocoapods/v/Map4dMap)](https://cocoapods.org/pods/Map4dMap)

Map4D Map SDK for iOS, written in C/C++, Objective-C.

![Map4D iOS SDK](https://docs.map4d.vn/map4d-map/ios/resources/Untitled-1_0000_Right-Mockup--phone-demo.png)


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

Copyright (C) 2024 IOT Link Ltd. All Rights Reserved.
