# Overview

> **Map4D iOS SDK** cho phép bạn tùy chỉnh bản đồ với nội dung để hiển thị trên iPhone, iPad.
</br> **Map4D iOS SDK** không chỉ mang hình ảnh thực tế lên trên bản đồ 3D, ngoài ra còn cho phép tương tác và điều chỉnh các đối tượng 3D của bạn
</br> Hỗ trợ ứng dụng của bạn với các tính năng: tìm kiếm địa điểm, tìm đường đi, xem thời tiết, xem bản đồ ở chế độ 2D/3D, xem bản đồ theo thời gian và không gian(4D)

![Map4D iOS SDK](https://docs.map4d.vn/map4d-ios-sdk/resource/Untitled-1_0000_Right-Mockup--phone-demo.png)

## Installation

Use [CocoaPods](https://cocoapods.org)

1. Update your cocoapods local repo
```shell
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
<string>{YOUR_KEY}</string>
```

2. Create map view

<!-- tabs:start -->
#### ** Swift **

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

#### ** Objective C **

```objc
#import <Map4dMap/Map4dMap.h>

@implementation ViewController

- (void)viewDidLoad {
  MFMapView * mapView;
  [super viewDidLoad];
  mapView = [[MFMapView alloc] initWithFrame: self.view.frame];
  [self.view addSubview:mapView];
}

@end
```
<!-- tabs:end -->