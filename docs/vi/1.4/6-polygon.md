# Polygon 
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFPolygon

  - 
    ```switf
    class MFPolygon: MFOverlay {
      var path: MFPath?
      var holes: [MFPath]?

      /// The fill color. Defaults to blueColor.
      var fillColor = UIColor.clear
      var strokeColor = UIColor.clear
      var strokeWidth: CGFloat = 0.0

      /// A Boolean value that determines whether user events are ignored and removed from the event queue.
      var userInteractionEnabled = false
      init() {}
    }
    ```

## 2. Tạo Polygon 

  - ### Có hai kiểu tạo polygon: 
  - #### 2.1. Polygon không có hole
  
  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/v1.4/6-Polygon.png)
  
  ```switf
  let path = MFMutablePath()
  path.add(CLLocationCoordinate2D(latitude: 16.072021912521958, longitude: 108.22481632232666))
  path.add(CLLocationCoordinate2D(latitude: 16.072759039952206, longitude: 108.22383999824524))
  path.add(CLLocationCoordinate2D(latitude: 16.07194459130451, longitude: 108.22292268276215))
  path.add(CLLocationCoordinate2D(latitude: 16.070563113819436, longitude: 108.22307825088501))
  path.add(CLLocationCoordinate2D(latitude: 16.070315684002882, longitude: 108.22487533092499))
  path.add(CLLocationCoordinate2D(latitude: 16.072021912521958, longitude: 108.22481632232666))
  
  let polygon = MFPolygon()
  polygon.path = path
  polygon.fillColor = .red
  polygon.map = mapView
  ```

  - #### 2.2. Polygon có hole
  
  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/v1.4/6-Polygon-hole.png)
  
  ```switf
  let path = MFMutablePath()
  path.add(CLLocationCoordinate2D(latitude: 16.072021912521958, longitude: 108.22481632232666))
  path.add(CLLocationCoordinate2D(latitude: 16.072759039952206, longitude: 108.22383999824524))
  path.add(CLLocationCoordinate2D(latitude: 16.07194459130451, longitude: 108.22292268276215))
  path.add(CLLocationCoordinate2D(latitude: 16.070563113819436, longitude: 108.22307825088501))
  path.add(CLLocationCoordinate2D(latitude: 16.070315684002882, longitude: 108.22487533092499))
  path.add(CLLocationCoordinate2D(latitude: 16.072021912521958, longitude: 108.22481632232666))
  
  let hole = MFMutablePath()
  hole.add(CLLocationCoordinate2D(latitude: 16.07191366280911, longitude: 108.2236737012863))
  hole.add(CLLocationCoordinate2D(latitude: 16.070722912079024, longitude: 108.22373807430267))
  hole.add(CLLocationCoordinate2D(latitude: 16.070599197308617, longitude: 108.22437107563019))
  hole.add(CLLocationCoordinate2D(latitude: 16.071918817558686, longitude: 108.22427451610565))
  hole.add(CLLocationCoordinate2D(latitude: 16.07191366280911, longitude: 108.2236737012863))
  
  let polygon = MFPolygon()
  polygon.path = path
  polygon.holes = [hole]
  polygon.fillColor = .red
  polygon.map = mapView
  ``` 

## 3. Xoá Polygon

  - Polygon có thể xoá bằng cách cài đặt map cho nó bằng nil.
  ```
  polyline.map = nil
  ```
## 4. Tuỳ chỉnh Polygon

  - Polygon có thể tuỳ chỉnh thông qua các thuộc tính như strokeWidth, fillColor, strokeColor...
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

## 5. Sự kiện click Polygon 

  - **Chú ý**:
  - Để sử dụng sự kiện của polygon phải gán thuộc tính userInteractionEnabled = true

  - Phát sinh khi người dùng click vào polygon 
    ```switf
      func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!) {}
    ```
  
    
## Ghi chú

 - Hole: Là phần đa giác bị khuyết bên trong polygon

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.