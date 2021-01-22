# Circle
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFCircle

  -  
    ```swift
      open class MFCircle : MFOverlay {
        open var visible: Bool
        open var fillOpacity: CGFloat
        /** The fill color. Defaults to blueColor. */
        open var fillColor: UnsafeMutablePointer<CMColor>?
        /** Position on Earth of circle center. */
        open var position: CLLocationCoordinate2D
        /** Radius of the circle in meters; must be positive. */
        open var radius: Double
        /** The width of the circle's outline in screen points.  */
        open var strokeWidth: Double
        /** The color of this circle's outline. */
        open var strokeColor: UnsafeMutablePointer<Int32>?
        
        public init(_ position: CLLocationCoordinate2D, radius: Double)
        public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat)
        public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat, strokeWidth: Double, strokeColor: Any!)
        public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat, strokeWidth: Double, strokeColor: Any!, zIndex: Float)
      }
    ```

## 2. Tạo Circle 

  -
    ```swift
      let circle = MFCircle(CLLocationCoordinate2D(latitude: 16.074846, longitude: 108.221426), radius: 100, fill: .blue, fillOpacity: 1.0, strokeWidth: 3.0, stroke: .white, zIndex: 1.0)
      circle.map = mapView
    ```
  - Như ví dụ trên vẽ một hình tròn có bán kinh 100m lên bản đồ.
  
  -  ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/6-circle.png)
  
  -
    ```swift
      let circle = MFCircle(CLLocationCoordinate2D(latitude: 16.074846, longitude: 108.221426), radius: 100, fill: .red, fillOpacity: 1.0)
      circle.map = mapView
    ```
  - Ta có thể vẽ viền của đường tròn thông qua thuộc tính strokeWidth và strokeColor. strokeWidth sẽ quyết định kích thước của viền strokeColor sẽ quyết định màu của viền nếu không xác định hệ thống sẽ dùng màu mặc đinh (#00ff00)
  
  -  ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/6-circle-stroke.png)
## 3. Sự kiện click Circle 

  - Phát sinh khi người dùng click vào circle 
    ```swift
      optional func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!)
    ```
  - Hướng dẫn sử dụng
    ```swift
      func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {
        print("You have click circle")
      }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.