# Delegate
Lớp Delegate cho phép người dùng thao tác với các sự kiện trên map.

## 1. MFMapViewDelegate

```switf
  @protocol MFMapViewDelegate<NSObject>
  @optional
  - (void)mapView: (MFMapView*)  mapView willMove: (BOOL) gesture;
  - (void)mapView: (MFMapView*)  mapView movingCameraPosition: (MFCameraPosition*) position;
  - (void)mapView: (MFMapView*)  mapView didChangeCameraPosition:(MFCameraPosition*) position;
  - (void)mapView: (MFMapView*)  mapView idleAtCameraPosition: (MFCameraPosition *) position;
  - (void)mapView: (MFMapView*)  mapView didTapAtCoordinate: (CLLocationCoordinate2D) coordinate;
  - (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3dMode;
  - (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location;

  - (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView;

  @end
```

- **Đăng ký map nhận delegate**

 ```switf
    class DelegateViewController: UIViewController {
      @IBOutlet var map4d: MFMapView!

      override func viewDidLoad() {
        super.viewDidLoad()
        map4d.delegate = self
      }
    }
    extension DelegateViewController: MFMapViewDelegate {

    }
 ```


## 2. Sự kiện willMove
  - Được gọi khi một trong các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map chuẩn bị thay đổi.

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, willMove gesture: Bool) {

      }
    }
  ```

## 3. Sự kiện movingCameraPosition
  - Được gọi khi một trong các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map đang thay đổi.

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
        func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!) {
        }
    }
  ```

## 4. Sự kiện didChangeCameraPosition
  - Được gọi khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.
  - Được gọi khi người dùng setCamera() mới.
  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, didChange position: MFCameraPosition!) {
      }
    }
  ```

## 5. Sự kiện idleAtCameraPosition
  - Được gọi khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!) {
      }
    }
  ```

## 6. Sự kiện didTapAtCoordinate
  - Được gọi khi có sự kiện click trên map , click trên map có độ ưu tiên thấp nhất. (thứ tự ưu tiên nhận click: Marker, Polyline, Polygon, Object, Map).

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
      }
    }
  ```

## 7. Sự kiện onModeChange
  - Được gọi khi map thay đổi chế độ từ 2D sang 3D và ngược lại.

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool) {
      }
    }
  ```

## 8. Sự kiện onModeChange
  - Được gọi khi map thay đổi chế độ từ 2D sang 3D và ngược lại.

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool) {
      }
    }
  ```

## 9. Sự kiện didTapMyLocation
  - Được gọi khi click vào marker my location

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D) {
      }
    }
  ```

## 10. Sự kiện didTapMyLocationButtonForMapView
  - Được gọi khi click vào button my location, nếu map4d.setMyLocationEnabled(true)

  ```switf
    extension DelegateViewController: MFMapViewDelegate {
      func didTapMyLocationButton(for mapView: MFMapView!) -> Bool {
        return false
      }
    }
  ```

  - **true**: dùng để tuỳ biến lại sự kiện, khi đó sự kiện mặc định sẽ không xảy ra
  - **false**: dùng sự kiện mặc định là di chuyển tới vị trí hiện tại.


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
