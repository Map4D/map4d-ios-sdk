# Polyline
Lớp MFPolyline cho phép người dùng vẽ một Polyline lên map.


## 1. MFPolyline
  - ```swift 
      public enum MFPolylineStyle : UInt {
        case solid
        case dotted
      }
    ```
  - 
    ```switf
      open class MFPolyline : MFOverlay {
       open var path: MFPath?
       open var visible: Bool
       open var width: CGFloat
       open var opacity: CGFloat
       open var style: MFPolylineStyle
       open var color: UnsafeMutablePointer<Int32>?
       open var closed: Bool { get }
       
       public init(_ path: MFPath?)
       public init(_ path: MFPath?, closed: Bool)
       public init(_ path: MFPath?, color: Any!, width: CGFloat, opacity: CGFloat, style: MFPolylineStyle, closed: Bool)
       public init(_ path: MFPath?, color: Any!, width: CGFloat, opacity: CGFloat, style: MFPolylineStyle, closed: Bool, zIndex: Float)
      }
    ```

## 2. Tạo Polyline 
  - Polyline với style: solid
  - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/4-polyline.png)

    ```switf
      let path = MFMutablePath()
      path.add(CLLocationCoordinate2D(latitude: 16.036438, longitude: 108.218161))
      path.add(CLLocationCoordinate2D(latitude: 16.033238, longitude: 108.218261))
      path.add(CLLocationCoordinate2D(latitude: 16.034338, longitude: 108.216361))
      polyline = MFPolyline(path, color: .red, width: 10, opacity: 1.0, style: .solid, closed: false, zIndex: 0)
      // set Map
      polyline = MFPolyline(path)
    ```
  - Polyline với style: dotted
   - ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/4-polyline-dotted.png)
      ```switf
        let path = MFMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 16.036438, longitude: 108.218161))
        path.add(CLLocationCoordinate2D(latitude: 16.033238, longitude: 108.218261))
        path.add(CLLocationCoordinate2D(latitude: 16.034338, longitude: 108.216361))
        polyline = MFPolyline(path, color: .red, width: 10, opacity: 1.0, style: .dotted, closed: false, zIndex: 0)
        // set Map
        polyline = MFPolyline(path)
      ```

## 3. Sự kiện click Polyline 

  - Phát sinh khi người dùng click vào polyline 
    ```switf
      optional func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!)
    ```
  - Hướng dẫn sử dụng
    ```switf
      extension MarkesViewController: MFMapViewDelegate {
        func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {
          print("You have click polyline")
        }
      }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.