# Polyline
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFPolyline

  ```swift 
  enum MFPolylineStyle : Int {
    case solid
    case dotted
  }
  ```

  ```switf
  class MFPolyline: MFOverlay {
    var path: MFPath?
    var width: CGFloat = 0.0
    var style: MFPolylineStyle?
    var color = UIColor.clear

    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    init() {}
    init(_ path: MFPath?) {}
  }
  ```

## 2. Tạo Polyline 

  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/v1.4/5-2polyline.png)
  - Tạo polyline với path, width và cài đặt map cho nó như hình phía trên.
  ```switf
  let path = MFMutablePath()
  path.add(CLLocationCoordinate2D(latitude: 16.071970365047, longitude: 108.22305457496643))
  path.add(CLLocationCoordinate2D(latitude: 16.072125007431797, longitude: 108.22499871253967))
  path.add(CLLocationCoordinate2D(latitude: 16.07050643717114, longitude: 108.22473049163818))
  path.add(CLLocationCoordinate2D(latitude: 16.071877579558407, longitude: 108.2241159149169))
  let polyline = MFPolyline()
  polyline.path = path
  polyline.color = .red
  polyline.width = 10.0
  polyline.map = mapView
  ```

## 3. Xoá Polyline

  - Polyline có thể xoá bằng cách cài đặt map cho nó bằng nil.
  ```
  polyline.map = nil
  ```
## 4. Tuỳ chỉnh Polyline

  - Polyline có thể tuỳ chỉnh thông qua các thuộc tính như path, width, color, ...
  ``` 
  polyline.path = path
  polyline.color = .red
  polyline.width = 10.0
  ```
  - Có 2 loại style thường dùng cho polyline như hình phía trên.
  ``` 
  polyline.style = .solid
  polyline.style = .dotted
  ```

## 5. Sự kiện click Polyline 

  - **Chú ý**:
  - Để sử dụng sự kiện của polyline phải gán thuộc tính userInteractionEnabled = true

  - Phát sinh khi người dùng click vào polyline
  - Cung cấp thông tin của polyline cho người dùng
  ```switf
  func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {}
  ```

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.