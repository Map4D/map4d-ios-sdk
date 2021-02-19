# Sự kiện Map4D-SDK
Hướng dẫn sử dụng các sự kiện của Map4D SDK.

## 1. Giới thiệu chung

  #### MFMapViewDelegate bộ giao thức cho phép người dùng thao tác với các sự kiện trên map.
  
  > Chú ý: Nếu bạn đăng ký sự kiện trên map thì phải remove chúng khi không còn sử dụng để cải thiện hiệu năng cho map.
  Chi tiết hướng dẫn có ở phần 2.
  - Các sự kiện thao tác trên map
    ```swift
      public protocol MFMapViewDelegate : NSObjectProtocol {
        optional func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool
        optional func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!)
        optional func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!)
        optional func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!)
        optional func mapView(_ mapView: MFMapView!, willMove gesture: Bool)
        optional func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!)
        optional func mapView(_ mapView: MFMapView!, didChange position: MFCameraPosition!)
        optional func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!)
        optional func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D)
        optional func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool)
        optional func mapView(_ mapView: MFMapView!, didTap object: MFObject!)
        optional func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D)
        optional func didTapMyLocationButton(for mapView: MFMapView!) -> Bool
    
        @available(iOS 2.0, *)
        optional func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView!
      }
    ```
  - Triển khai các sự kiện trên map
    ```swift
      class DelegateViewController: UIViewController {
        @IBOutlet var mapView: MFMapView!
  
        override func viewDidLoad() {
          super.viewDidLoad()
          mapView.delegate = self
        }
      }
      extension DelegateViewController: MFMapViewDelegate {
        // code 
      }
    ```
   
## 2. Hướng dẫn chi tiết các sự kiện

  #### 2.1 Sự kiện willMove
  
  - Được gọi khi một trong các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map chuẩn bị thay đổi.
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, willMove gesture: Bool) {
          <#code#>
        }
      }
    ```
  
  #### 2.2 Sự kiện movingCameraPosition
  
  - Được gọi khi một trong các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map đang thay đổi.
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
          func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!) {
          <#code#>
          }
      }
    ```
  
  #### 2.3 Sự kiện didChangeCameraPosition
  
  - Được gọi khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.
  - Được gọi khi người dùng setCamera() mới.
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, didChange position: MFCameraPosition!) {
          <#code#>
        }
      }
    ```
  
  #### 2.4 Sự kiện idleAtCameraPosition
  
  - Được gọi khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!) {
          <#code#>
        }
      }
    ```
  
  #### 2.5 Sự kiện didTapAtCoordinate
  
  - Được gọi khi có sự kiện click trên map , click trên map có độ ưu tiên thấp nhất. (thứ tự ưu tiên nhận click: Marker, Polyline, Polygon, Object, Map).
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
          <#code#>
        }
      }
    ```
  
  #### 2.6 Sự kiện onModeChange
  
  - Được gọi khi map thay đổi chế độ từ 2D sang 3D và ngược lại.
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool) {
          <#code#>
        }
      }
    ```
  
  #### 2.7 Sự kiện didTapMyLocation
  
  - Được gọi khi click vào marker my location
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D) {
          <#code#>
        }
      }
    ```
  
  #### 2.8 Sự kiện didTapMyLocationButtonForMapView
  
  - Được gọi khi click vào button my location, nếu map4d.setMyLocationEnabled(true)
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func didTapMyLocationButton(for mapView: MFMapView!) -> Bool {
          return false
        }
      }
    ```
    - **true**: dùng để tuỳ biến lại sự kiện, khi đó sự kiện mặc định sẽ không xảy ra
    - **false**: dùng sự kiện mặc định là di chuyển tới vị trí hiện tại.
    
  #### 2.9 Một số sự kiện khác 
  
  - Ngoài ra MAP4D SDK còn hổ trợ một số sự kiện riêng biệt cho từng annotation: 
    ```swift
      extension DelegateViewController: MFMapViewDelegate {
        func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool {
          return false
        }  
        func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {
          <#code#>
        }
        func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!) {
          <#code#>
        }
        func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {
          <#code#>
        }
        func mapView(_ mapView: MFMapView!, didTap object: MFObject!) {
          <#code#>
        }
        func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView! {
          let image = UIImage(named: "ic_marker_custom")
          let uiView = UIImageView(image: image)
          return uiView
        }
      }
    ```
  
  
  License
  -------
  
  Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
