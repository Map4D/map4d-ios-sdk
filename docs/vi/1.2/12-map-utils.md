#Map Utils 

##I. Projection

Lớp Projection cho phép người dùng thực hiện các phép chiếu

####1. Khởi tạo lớp Projection

  ```switf
    public init(_ mapView: MFMapView)
  ```
  
####2. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen
  
  ```switf
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen. */
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D
    
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với elevation (meter)*/
    open func coordinate(for point: CGPoint, elevation: Double) -> CLLocationCoordinate2D
  ```
  
####3. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với MFCameraPosition

  ``` swift
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với MFCameraPosition */
    /** MFCameraPosition có thể tuỳ chỉnh */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D
    
    /** Chuyển đổi từ toạ độ LatLng sang toạ độ Screen, MFCameraPosition, elevation và is3DMode  */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D
  ```
  
####4. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng
  
  ```switf
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng. */
    open func point(for coordinate: CLLocationCoordinate2D) -> CGPoint
    
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với elevation (meter). */
    open func point(for coordinate: CLLocationCoordinate2D, withElevation elevation: Double) -> CGPoint
  ```
  
####5. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với MFCameraPosition
  
  ```switf
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với MFCameraPosition */
    /** MFCameraPosition có thể tuỳ chỉnh */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D
   
    /** Chuyển đổi từ toạ độ Screen sang toạ độ LatLng, MFCameraPosition, elevation và is3DMode */
    open func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D
  ```

  
License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
