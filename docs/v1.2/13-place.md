#Place

Lớp Place dùng để nhận dạng 1 địa điểm xác định trên bản đồ. Place bao gồm các place có sẵn trên bản đồ.

####1. Place

  ```swift
    open class MFPlace : NSObject {
      open var id: String?
      open var name: String?
      open var address: String?
      open var coordinate: CLLocationCoordinate2D
      open var iconColor: String?
      open var iconType: String?
    }
  ```
  
####2. Enable Place
  - Cho phép hiển thị hoặc không hiển thị Place trên bản đồ
  ```swift
    open func setPlacesEnabled(_ enabled: Bool)
    open func isPlacesEnabled() -> Bool
  ```
  
  - Ví dụ:
  ``` swift 
    // enable or disable place
    mapView.setPlacesEnabled(true) // cho phép vẽ place
    mapView.setPlacesEnabled(false) // ko hiển thị place
    
    // kiểm tra hiện tại place được cho phép vẽ hoặc ko
    let isPlaceEnabled = mapView.isPlacesEnabled()
  ```
  
####3. Filter Place
  - Bộ lọc hiển thị những type của place được vẽ trên map.
  - Lệnh setFilterPlaces cuối cũng sẽ lọc những type ở lệnh cuối đc vẽ.
  ``` swift
    open func setFilterPlaces(_ filterPlaces: [String]?)
    open func getFilterPlaces() -> [String]
  ```
  
  - Ví dụ: 
  ``` swift 
    // bộ lọc hiển thị cho type cafe. 
    mapView.setFilterPlaces(["cafe"]) // cho phép vẽ place
    let palcesType = mapView.getFilterPlaces() // mảng danh sách các type của place đang được hiển thị
  ```
  
####4. Selected Place
  
  ```swift
    open func setSelectedPlace(_ placeId: String?)
    open func getSelectedPlace() -> String?
  ```
  
  - Ví dụ: 
  ``` swift 
    mapView.setSelectedPlace("5c92fb3a6e287b2d789b2124") // highlight place với id của place.
    let placeId = mapView.getSelectedPlace() // get place ID của place đang được chọn.
    
    // kiểm tra hiện tại place được cho phép vẽ hoặc ko
    let isPlaceEnabled = mapView.isPlacesEnabled()
  ```
  
####5. Sự kiện trên place

  - Sự kiện click phát sinh khi người dùng click vào place
  ```swift
    func mapView(_ mapView: MFMapView!, didTap place: MFPlace!) {
      if let id = place.id, let name = place.name {
        print("Place:  = s " , id, name);
        self.mapView.setSelectedPlace(id);
      }
    }
  ```

  
License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
