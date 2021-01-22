# Marker
Lớp MFMarker cho phép người dùng vẽ một Marker lên map.


## 1. MFMarker

  - 
    ```swift
      open class MFMarker : MFOverlay {
        open var position: CLLocationCoordinate2D
        open var groundAnchor: CGPoint
        open var iconView: UIView?
        open var elevation: Double
        open var icon: UIImage?
        open var isVisible: Bool
        open var title: String?
        open var snippet: String?
        open var infoWindowAnchor: CGPoint
        open var zIndex: Float
      }
    ```

## 2. Tạo marker

  -  ![MAP4DSDK](https://raw.githubusercontent.com/iotlinkadmin/map4d-ios-sdk/master/docs/resource/3-marker.png)
  
  - 
    ```swift
      let position = CLLocationCoordinate2DMake(16.049349,108.222181)
      let image = UIImage(named: "marker_default")
      let marker = MFMarker()
      marker.icon = image
      marker.position = position
      marker.groundAnchor =  CGPoint(x: 0.5, y: 0.5)
      marker.elevation = 10
      marker.title = "Tiêu đề"
      marker.snippet = "Mô tả"
      // set map
      marker.map = mapView
    ```
 - **Chú ý**:
 - Người dùng có thể sử dụng marker bằng 2 cách
   - ***Sử dụng 1 hình ảnh làm icon dùng hàm setIcon***
   - ***Tuỳ biến lại marker bằng cách dùng hàm setIconView***

## 3. Sự kiện click marker

  - Phát sinh khi người dùng click vào marker
    ```swift
      optional func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool
    ```
  - Hướng dẫn sử dụng
    ```swift
      extension MarkesViewController: MFMapViewDelegate {
        func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool {
          return false
        }  
      }
    ```
  - **true**: cho phép tuỳ chọn lại sự kiện click vào marker
  - **false**: sử dụng event mặc định là click vào marker hiển thị lên thông tin marker

## 4. Tuỳ chọn hiển thị thông tin marker

  - Cho phép tuỳ chọn lại hiển thị thông tin marker

    ```swift
      optional func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView!
    ```

  - Hướng dẫn sử dụng:

    ```swift
      func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView! {
        let image = UIImage(named: "ic_marker_custom")
        let uiView = UIImageView(image: image)
        return uiView
      }
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.