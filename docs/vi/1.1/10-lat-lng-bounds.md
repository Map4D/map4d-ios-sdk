#LatLngBounds

Lớp LatLngBounds đại diện cho một hình chữ nhật trong toạ độ địa lý, được biểu diễn bởi toạ độ 2 cực đông bắc và tây nam.

##1. LatLngBounds

  ```swift 
    open class MFCoordinateBounds : NSObject {
      open var northEast: CLLocationCoordinate2D { get }
      open var southWest: CLLocationCoordinate2D { get }
      public init!(coordinate coord: CLLocationCoordinate2D, coordinate1 coord1: CLLocationCoordinate2D)
      public init!(path: MFPath!)
      open func includingCoordinate(_ coordinate: CLLocationCoordinate2D) -> Any!
      open func includingBounds(_ other: MFCoordinateBounds!) -> Any!
      open func includingPath(_ path: MFPath!) -> Any!
      open func containsLatitude(_ latitude: Double) -> Bool
      open func containsLongitude(_ longitude: Double) -> Bool
      open func contains(_ coordinate: CLLocationCoordinate2D) -> Bool
    }
  ```

##2. Tạo đối tượng LatLngBounds

  ```swift
    let latLngBounds = MFCoordinateBounds.init(coordinate: CLLocationCoordinate2DMake(15.606498,  107.699308), coordinate1: CLLocationCoordinate2DMake(15.567800, 107.974320))
  ```
  
##3. Hướng dẫn sử dụng fitBounds
   
  ```swift
    open class func fit(_ _bounds: MFCoordinateBounds!) -> MFCameraUpdate!
    open class func fit(_ _bounds: MFCoordinateBounds!, withEdgeInsets _edgeInsets: Any!) -> MFCameraUpdate!
    open class func fit(_ _bounds: MFCoordinateBounds!, withEdgeInsets _edgeInsets: Any!, duration _duration: Int) -> MFCameraUpdate!let latLngBounds = MFCoordinateBounds.init(coordinate: CLLocationCoordinate2DMake(15.606498,  107.699308), coordinate1: CLLocationCoordinate2DMake(15.567800, 107.974320))
  ```
  - ***Sử dụng:***
  ```swift
    let latLngBounds = MFCoordinateBounds.init(coordinate: CLLocationCoordinate2DMake(15.606498,  107.699308), coordinate1: CLLocationCoordinate2DMake(15.567800, 107.974320))
    let camera = MFCameraUpdate.fit(latLngBounds, with: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10));
    mapView.animate(with: camera);
  ```
  

License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.