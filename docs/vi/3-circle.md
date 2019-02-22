# Circle
Lớp MFCircle cho phép người dùng vẽ một Circle lên map.

## 1. MFCircle

```switf
  @interface MFCircle : MFOverlay
  @property(nonatomic, assign) bool visible;
  @property(nonatomic, assign) CGFloat fillOpacity;
  /** The fill color. Defaults to blueColor. */
  @property(nonatomic, strong) UIColor* _Nullable fillColor;
  /** Position on Earth of circle center. */
  @property(nonatomic, assign) CLLocationCoordinate2D position;
  /** Radius of the circle in meters; must be positive. */
  @property(nonatomic, assign) CLLocationDistance radius;

  - (instancetype _Nonnull ) init NS_UNAVAILABLE;

  - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (CLLocationDistance) radius;

  - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (CLLocationDistance) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity;

  @end
```


## 2. Tạo circle

```switf
    // Khởi tạo vị trí cần vẽ đường tròn.
    var posCicle1 = CLLocationCoordinate2DMake(16.040159,108.220690)
    // Khỏi tạo MFCircle
    let circle = MFCircle.init(posCicle1, radius: 1000, fill: .blue, fillOpacity: 1.0)
    // Cài đặt map
    circle?.map = map4d

    // Di chuyển map tới vị trí của đường tròn.
    map4d.move(to: (circle?.position)!, zoom: 13)

```

## 3. Sự kiện click circle

Phát sinh khi người dùng click vào circle

```switf
  - (void)mapview: (MFMapView*)  mapView didTapCircle: (MFCircle*) circle;
```

- **Hướng dẫn sử dụng**

```switf
  extension CircleViewController: MFMapViewDelegate {
    func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {
    }
  }
```

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
