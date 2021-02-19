#Map Utils 

##I. Projection

Lớp Projection cho phép người dùng thực hiện các phép chiếu

####1. Khởi tạo lớp Projection

  ```swift
    public init(_ mapView: MFMapView)
  ```
  
####2. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen
  
  ```swift
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen. */
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D
    
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với elevation (meter)*/
    open func coordinate(for point: CGPoint, elevation: Double) -> CLLocationCoordinate2D
  ```
  
  - Ví dụ
  ```swift
    let coordinate1 = mapView.projection?.coordinate(for: CGPoint(x: 100, y: 100))
    let coordinate2 = mapView.projection?.coordinate(for: CGPoint(x: 100, y: 100), elevation: 10)
  ```
####3. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với MFCameraPosition

  ``` swift
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với MFCameraPosition */
    /** MFCameraPosition có thể tuỳ chỉnh */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D
    
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen, MFCameraPosition, elevation và is3DMode  */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D
  ```
  
  - Ví dụ
  ```swift
    let coordinate1 = mapView.projection?.coordinate(for: CGPoint(x: 100, y: 100), camera: cameraPosition!)
    let coordinate2 = mapView.projection?.coordinate(for: CGPoint(x: 100, y: 100), camera: cameraPosition!, elevation: 10, is3DMode: false)
  ```
####4. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng
  
  ```swift
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng. */
    open func point(for coordinate: CLLocationCoordinate2D) -> CGPoint    
    
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với elevation (meter). */
    open func point(for coordinate: CLLocationCoordinate2D, withElevation elevation: Double) -> CGPoint
  ```
  
  - Ví dụ
  ```swift
    let point1 = mapView.projection?.point(for: CLLocationCoordinate2D(latitude: 16.094145, longitude: 108.224987))
    let point2 = mapView.projection?.point(for: CLLocationCoordinate2D(latitude: 16.094145, longitude: 108.224987), elevation: 10)
  ```
####5. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với MFCameraPosition
  
  ```swift
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với MFCameraPosition */
    /** MFCameraPosition có thể tuỳ chỉnh */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D
    
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng, MFCameraPosition, elevation và is3DMode */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D
  ```

  - Ví dụ
  ```swift
    let point1 = mapView.projection?.point(for: CLLocationCoordinate2D(latitude: 16.094145, longitude: 108.224987), camera: cameraPosition!)
    let point2 = mapView.projection?.point(for: CLLocationCoordinate2D(latitude: 16.094145, longitude: 108.224987), camera: cameraPosition!, elevation: 10, is3DMode: false)
  ```
  
License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
