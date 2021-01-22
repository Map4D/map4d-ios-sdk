# Polygon 
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFPolygon

  - 
    ```swift
      open class MFPolygon : MFOverlay {
        open var path: MFPath?
        open var holes: [MFPath]?
        open var visible: Bool
        open var fillOpacity: CGFloat
        /** The fill color. Defaults to blueColor. */
        open var fillColor: UnsafeMutablePointer<Int32>?
        
        public init(_ path: MFPath?)
        public init(_ path: MFPath?, holes: [MFPath])
        public init(_ path: MFPath?, fillColor color: Any!)
        public init(_ path: MFPath?, fillColor color: Any!, zIndex: Float)
        }
    ```

## 2. Tạo Polygon 

  - ####Có hai kiểu tạo polygon: 
  - **Polygon không có hole**
  
  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/5-polygon.png)
  
    ```swift
      let path = MFMutablePath()
      path.add(CLLocationCoordinate2D(latitude: 16.074846693720456, longitude: 108.22142601013184))
      path.add(CLLocationCoordinate2D(latitude: 16.07336214218099, longitude: 108.21292877197266))
      path.add(CLLocationCoordinate2D(latitude: 16.065114431831454, longitude: 108.21413040161133))
      path.add(CLLocationCoordinate2D(latitude: 16.062557572189956, longitude: 108.22125434875488))
      path.add(CLLocationCoordinate2D(latitude: 16.07047548246128, longitude: 108.22357177734375))
      path.add(CLLocationCoordinate2D(latitude: 16.074846693720456, longitude: 108.22142601013184))
      let polygon = MFPolygon(path, fill: .cyan, zIndex: 1.0)
      polygon.map = mapView
    ```
  - **Polygon có hole** 
  
  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/5-polygon-hole.png)
  
    ```swift
      let path = MFMutablePath()
      path.add(CLLocationCoordinate2D(latitude: 16.074846693720456, longitude: 108.22142601013184))
      path.add(CLLocationCoordinate2D(latitude: 16.07336214218099, longitude: 108.21292877197266))
      path.add(CLLocationCoordinate2D(latitude: 16.065114431831454, longitude: 108.21413040161133))
      path.add(CLLocationCoordinate2D(latitude: 16.062557572189956, longitude: 108.22125434875488))
      path.add(CLLocationCoordinate2D(latitude: 16.07047548246128, longitude: 108.22357177734375))
      path.add(CLLocationCoordinate2D(latitude: 16.074846693720456, longitude: 108.22142601013184))
      
      let hole = MFMutablePath()
      hole.add(CLLocationCoordinate2D(latitude: 16.07220748332118, longitude: 108.2197093963623))
      hole.add(CLLocationCoordinate2D(latitude: 16.07113529409124, longitude: 108.21524620056152))
      hole.add(CLLocationCoordinate2D(latitude: 16.067258869420872, longitude: 108.21764945983887))
      hole.add(CLLocationCoordinate2D(latitude: 16.068083646954054, longitude: 108.21996688842773))
      hole.add(CLLocationCoordinate2D(latitude: 16.07220748332118, longitude: 108.2197093963623))
      let polygon1 = MFPolygon(path, holes: [hole])
      polygon1.zIndex = 1
      polygon1.fillColor  = .red
      polygon1.map = mapView
    ``` 

## 3. Sự kiện click Polygon 

  - Phát sinh khi người dùng click vào polygon 
    ```swift
      optional func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!)
    ```
  - Hướng dẫn sử dụng
    ```swift
      extension MarkesViewController: MFMapViewDelegate {
        func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!) {
          print("You have click polygon")
        }
      }
    ```
    
## Ghi chú

 - Hole: Là phần đa giác bị khuyết bên trong polygon

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.