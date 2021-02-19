#Place

Place bao gồm các POIs có sẵn trên bản đồ của Map4D

####1. Enable POIs
  - Cho phép hiển thị hoặc không hiển thị tất cả các POIs của Map4D trên bản đồ

  ```objc
  - (void) setPOIsEnabled: (bool) enabled;
  - (bool) isPOIsEnabled;
  ```
  
####2. Filter Place
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
  
####3. Selected Place
  
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
  
####4. Sự kiện trên place

  - Sự kiện click phát sinh khi người dùng click vào place
  ```swift
    func mapView(_ mapView: MFMapView?, didTapPOIWithPlaceID placeID: String?, name: String?, location: CLLocationCoordinate2D)
  ```

  
License
-------

Copyright (C) 2020 IOT Link Ltd. All Rights Reserved.
