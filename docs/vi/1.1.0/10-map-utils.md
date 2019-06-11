#Map Utils 

##I. Projection

Lớp Projection cho phép người dùng thực hiện các phép chiếu

####1. Khởi tạo lớp Projection

  ```switf
    public init(_ mapView: MFMapView)
  ```
  
####2. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen
  
  ```switf
    /** Maps a point coordinate in the map's view to an Earth coordinate. */
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D
  ```
  
####3. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với elevation (meter)
  
  ```switf
    /** Maps a point coordinate in the map's view to an Earth coordinate. */
    open func coordinate(for point: CGPoint, withElevation elevation: Double) -> CLLocationCoordinate2D
  ```
  
  
####4. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng
  
  ```switf
    /** Maps an Earth coordinate to a point coordinate in the map's view. */
    open func point(for coordinate: CLLocationCoordinate2D) -> CGPoint
  ```
  
####5. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với elevation (meter)
  
  ```switf
    /** Maps an Earth coordinate to a point coordinate at the elevation in the map's view. */
    open func point(for coordinate: CLLocationCoordinate2D, withElevation elevation: Double) -> CGPoint
  ```
  
####6. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen
  
  ```switf
    /** Maps a point coordinate in the map's view to an Earth coordinate. */
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D

    open func coordinate(for point: CGPoint, withElevation elevation: Double) -> CLLocationCoordinate2D
  ```
  
  
License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
