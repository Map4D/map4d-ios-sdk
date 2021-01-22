# Polyline
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFPolyline

  - 
    ```swift
      open class MFPolyline : MFOverlay {
        open var path: MFPath?
        open var visible: Bool
        open var width: CGFloat
        open var opacity: CGFloat
        open var color: UIColor?
        open var closedPolyline: Bool { get }
        public init(_ path: MFPath?)
        public init(_ path: MFPath?, closedPolyline: Bool)
        public init(_ path: MFPath?, color: UIColor?, width: CGFloat, opacity: CGFloat, closedPolyline: Bool)
      }
    ```

## 2. Tạo Polyline 

  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/4-polyline.png)

  - 
    ```swift
      let path = MFMutablePath()
      path.add(CLLocationCoordinate2D(latitude: 16.067218, longitude: 108.213916))
      path.add(CLLocationCoordinate2D(latitude: 16.066496, longitude: 108.213916))
      path.add(CLLocationCoordinate2D(latitude: 16.064877, longitude: 108.210397))
      path.add(CLLocationCoordinate2D(latitude: 16.059980, longitude: 108.211137))
      path.add(CLLocationCoordinate2D(latitude: 16.059516, longitude: 108.208358))
      let polyline = MFPolyline(path, color: .red, width: 10.0, opacity: 1, closedPolyline: true)
      polyline.map = mapView
    ```

## 3. Sự kiện click Polyline 

  - Phát sinh khi người dùng click vào polyline 
    ```swift
      optional func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!)
    ```
  - Hướng dẫn sử dụng
    ```swift
      extension MarkesViewController: MFMapViewDelegate {
        func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {
          print("You have click polyline")
        }
      }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.