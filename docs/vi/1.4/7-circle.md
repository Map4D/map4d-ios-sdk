# Circle
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFCircle

  ```switf
  class MFCircle: MFOverlay {
    var fillOpacity: CGFloat = 0.0

    /// The fill color. Defaults to redColor.
    var fillColor = UIColor.clear

    /// The color of this circle's outline. Defaults to blackColor
    var strokeColor = UIColor.clear

    /// Position on Earth of circle center.
    var position: CLLocationCoordinate2D?

    /// Radius of the circle in meters; must be positive.
    var radius = 0.0

    /// The width of the circle's outline in screen points.
    var strokeWidth = 0.0

    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    override init() {}
    init(_ position: CLLocationCoordinate2D, radius: Double, fill fillColor: UIColor?, fillOpacity: CGFloat) {}
  }
  ```

## 2. Tạo Circle 

  ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/v1.4/7-circle.png)

  - Vẽ hình tròn có bán kinh 100m lên bản đồ.
  ```switf
  let circle = MFCircle()
  circle.position = CLLocationCoordinate2DMake(16.0718918, 108.2239449)
  circle.radius = 100
  circle.fillColor = .red
  circle.strokeWidth = 5.0
  circle.strokeColor = .blue
  circle.map = mapView
  ```

  - Ta có thể vẽ viền của đường tròn thông qua thuộc tính strokeWidth và strokeColor. 
  - strokeWidth: sẽ quyết định kích thước của viền 
  - strokeColor: sẽ quyết định màu của viền

## 3. Xoá Circle

  - Crcle có thể xoá bằng cách cài đặt map cho nó bằng nil.
  ```
  circle.map = nil
  ```

## 4. Tuỳ chỉnh Circle

  - Circle có thể tuỳ chỉnh thông qua các thuộc tính như radius, strokeWidth, fillColor, strokeColor...
  ``` 
  polyline.radius = 50
  circle.color = .red
  circle.strokeWidth = 10.0
  circle.strokeColor = .blue
  ```

## 5. Sự kiện click Circle 

  - **Chú ý**:
  - Để sử dụng sự kiện của circle phải gán thuộc tính userInteractionEnabled = true

  - Phát sinh khi người dùng click vào circle 
  ```switf
  func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {}
  ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.