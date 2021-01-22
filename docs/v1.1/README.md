# Map4D SDK

Map4D SDK for iOS, written in C/C++, Objective C.

[![Map4D iOS SDK](https://docs.map4d.vn/map4d-ios-sdk/resource/Untitled-1_0000_Right-Mockup--phone-demo.png)](https://map4d.vn) 

## Installation

Use [CocoaPods](https://cocoapods.org).

1. Update your cocoapods local repo
```bash
pod repo update
```

2. Add to Podfile
```shell
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