# Marker
Lớp MFMarker cho phép người dùng vẽ một Marker lên map.

## 1. MFMarker

```switf
      @interface MFMarker: MFOverlay
      @property(nonatomic) CLLocationCoordinate2D position;
      @property(nonatomic) CGPoint groundAnchor;
      @property(nonatomic, strong, setter=setIconView:) UIView * _Nullable iconView;
      @property(nonatomic) double elevation;
      @property(nonatomic, strong) UIImage * _Nullable icon;
      @property(nonatomic, assign, setter=setVisible:) bool isVisible;

      /**
       * Title, a short description of the overlay. Some overlays, such as markers, will display the title
       * on the map. The title is also the default accessibility text.
       */
      @property(nonatomic, strong, nullable) NSString *title;

      /** Snippet text, shown beneath the title in the info window when selected. */
      @property(nonatomic, copy, nullable) NSString *snippet;

      /**
       * The info window anchor specifies the point in the icon image at which to anchor the info window,
       * which will be displayed directly above this point. This point is specified within the same space
       * as groundAnchor.
       */
      @property(nonatomic, assign) CGPoint infoWindowAnchor;

      /**
       * Higher |zIndex| value overlays will be drawn on top of lower |zIndex| value tile layers and
       * overlays.  Equal values result in undefined draw ordering.  Markers are an exception that
       * regardless of |zIndex|, they will always be drawn above tile layers and other non-marker
       * overlays; they are effectively considered to be in a separate z-index group compared to other
       * overlays.
       */
      @property(nonatomic, assign) float zIndex;
      @end
```


## 2. Tạo marker

```switf
    let position = CLLocationCoordinate2DMake(16.049349,108.222181)
    let image = UIImage(named: "marker_default")

    let marker = MFMarker()
    marker.icon = image
    marker.position = position
    marker.groundAnchor =  CGPoint(x: 0.5, y: 1.0)
    marker.elevation = 10
    marker.title = "Tiêu đề"
    marker.snippet = "Mô tả"

    // set map
    marker.map = map4d

```

- **Chú ý**:
  - Người dùng có thể sử dụng marker bằng 2 cách
    - ***Sử dụng 1 hình ảnh làm icon dùng hàm setIcon***
    - ***Tuỳ biến lại marker bằng cách dùng hàm setIconView***

## 3. Sự kiện click marker

Phát sinh khi người dùng click vào marker

```switf
  - (BOOL)mapview: (MFMapView*)  mapView didTapMarker: (MFMarker*) marker;
```

- **Hướng dẫn sử dụng**

```switf
  extension MarkesViewController: MFMapViewDelegate {
    func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool {
      return false
    }
  }
```
  - **true**: cho phép tuỳ chọn lại sự kiện click vào marker
  - **false**: sử dụng event mặc định là click vào marker hiển thị lên thông tin marker

## 4. Tuỳ chọn hiển thị thông tin marker

Cho phép tuỳ chọn lại hiển thị thông tin marker

```switf
    - (UIView *) mapView: (MFMapView *) mapView markerInfoWindow: (MFMarker *) marker;
```

- **Hướng dẫn sử dụng**:

```switf
      func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView! {
        let image = UIImage(named: "ic_marker_custom")
        let uiView = UIImageView(image: image)
        return uiView
      }
```

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
