# Map events

> **Map4D iOS SDK** cung cấp các sự kiện của map hay tương tác của người dùng giúp cho nhà phát triển có thể lắng nghe và xử lý.

  ##  Giới thiệu chung

  **MFMapViewDelegate** cung cấp các giao thức cho phép người dùng thao tác với các sự kiện trên **map**.

  #### Các sự kiện thao tác trên map

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapView(_ mapView: MFMapView?, willMove gesture: Bool)
  func mapView(_ mapView: MFMapView?, moving position: MFCameraPosition?)
  func mapView(_ mapView: MFMapView?, didChange position: MFCameraPosition?)
  func mapView(_ mapView: MFMapView?, idleAt position: MFCameraPosition?)
  func mapView(_ mapView: MFMapView?, onModeChange is3DMode: Bool)
  func mapView(_ mapView: MFMapView?, didTapAtCoordinate coordinate: CLLocationCoordinate2D)
  func shouldChangeMapMode(for mapView: MFMapView?) -> Bool
  ```

  #### ** Objective C **

  ```objc
  - (void)mapView: (MFMapView*)  mapView willMove: (BOOL) gesture;
  - (void)mapView: (MFMapView*)  mapView movingCameraPosition: (MFCameraPosition*) position;
  - (void)mapView: (MFMapView*)  mapView didChangeCameraPosition:(MFCameraPosition*) position;
  - (void)mapView: (MFMapView*)  mapView idleAtCameraPosition: (MFCameraPosition *) position;
  - (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3DMode;
  - (void)mapView: (MFMapView*)  mapView didTapAtCoordinate: (CLLocationCoordinate2D) coordinate;
  - (BOOL)shouldChangeMapModeForMapView: (MFMapView*)  mapView;
  ```

  <!-- tabs:end -->


  | No       | Event name                            | Description                                                                                                                |
  |----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | **1**    | **willMove**                          | Phát sinh khi người dùng tương tác bằng cử chỉ làm thay đổi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom)     |
  | **2**    | **movingCameraPosition**              | Phát sinh khi một trong các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map chuẩn bị thay đổi               |
  | **3**    | **didChangeCameraPosition**           | Đhát sinh khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.                     |
  | **4**    | **idleAtCameraPosition**              | Phát sinh khi các thông số camera (tâm, góc nghiêng, góc quay, mức zoom) của map kết thúc sự thay đổi.                     |
  | **5**    | **onModeChange**                      | Phát sinh khi map thay đổi mode từ 2D sang 3D và ngược lại                                                                 |
  | **6**    | **didTapAtCoordinate**                | Phát sinh khi người dùng touch vào **Coordinate** trên **map**                                                             |
  | **7**    | **shouldChangeMapModeForMapView**     | Phát sinh khi mức zoom chuyển từ mức hiển thị 2D sang mức có thể hiển thị 3D và ngược lại                                  |

  Chúng ta thử một ví dụ đánh dấu một **Marker** lên **map** tại vị trí chỉ định dùng sự kiện **didTapAtCoordinate**

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    let marker = MFMarker()
    marker.position = coordinate
    marker.icon = UIImage(named: "iconLocation")
    marker.groundAnchor = CGPoint(x: 0.5, y: 1.0)
    marker.title = "Map4D"
    marker.snippet = "An Hải Bắc, Sơn Trà, Đà Nẵng"
    marker.map = mapView
  }
  ```

  #### ** Objective C **

  ```objc
  - (void)mapView:(MFMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    MFMarker *marker = [[MFMarker alloc] init];
    [marker setPosition: coordinate];
    [marker setGroundAnchor: CGPointMake(0.5, 1.0)];
    [marker setIcon: [UIImage imageNamed:@"iconLocation"]];
    [marker setTitle: @"Map4D"];
    [marker setSnippet: @"An Hải Bắc, Sơn Trà, Đà Nẵng"];
    [marker setMap:mapView];
  }
  ```

  <!-- tabs:end -->
  
  #### Các sự kiện thao tác trên Annotation

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapview(_ mapView: MFMapView?, didTap marker: MFMarker?) -> Bool
  func mapview(_ mapView: MFMapView?, didBeginDragging marker: MFMarker?)
  func mapview(_ mapView: MFMapView?, didEndDragging marker: MFMarker?)
  func mapview(_ mapView: MFMapView?, didDrag marker: MFMarker?)
  func mapview(_ mapView: MFMapView?, didTapInfoWindowOf marker: MFMarker?)
  func mapview(_ mapView: MFMapView?, didTap polyline: MFPolyline?)
  func mapview(_ mapView: MFMapView?, didTap polygon: MFPolygon?)
  func mapview(_ mapView: MFMapView?, didTap circle: MFCircle?)
  func mapView(_ mapView: MFMapView?, didTapMyLocation location: CLLocationCoordinate2D)
  func didTapMyLocationButton(for mapView: MFMapView?) -> Bool
  func mapView(_ mapView: MFMapView?, markerInfoWindow marker: MFMarker?) -> UIView?
  ```

  #### ** Objective C **

  ```objc
  - (BOOL)mapview: (MFMapView*)  mapView didTapMarker: (MFMarker*) marker;
  - (void)mapview: (MFMapView*)  mapView didBeginDraggingMarker: (MFMarker*) marker;
  - (void)mapview: (MFMapView*)  mapView didEndDraggingMarker: (MFMarker*) marker;
  - (void)mapview: (MFMapView*)  mapView didDragMarker: (MFMarker*) marker;
  - (void)mapview: (MFMapView*)  mapView didTapInfoWindowOfMarker: (MFMarker*) marker;
  - (void)mapview: (MFMapView*)  mapView didTapPolyline: (MFPolyline*) polyline;
  - (void)mapview: (MFMapView*)  mapView didTapPolygon: (MFPolygon*) polygon;
  - (void)mapview: (MFMapView*)  mapView didTapCircle: (MFCircle*) circle;
  - (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location;
  - (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView;
  - (UIView *) mapView: (MFMapView *) mapView markerInfoWindow: (MFMarker *) marker;
  ```

  <!-- tabs:end -->


  | No       | Event name                            | Description                                                                                                                |
  |----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | **1**    | **didTapMarker**                      | Phát sinh khi người dùng touch vào **Marker** trên **map**                                                                 |
  | **2**    | **didBeginDraggingMarker**            | Phát sinh khi người dùng bắt đầu nhấn và giữ **Marker** trong một khoảng thời gian trên **map**                            |
  | **3**    | **didEndDraggingMarker**              | Phát sinh khi người dùng thả **Marker** ra sau khi nhấn và giữ **Marker** trong một khoảng thời gian trên **map**          |
  | **4**    | **didDragMarker**                     | Phát sinh khi người dùng nhấn và giữ **Marker** trong một khoảng thời gian trên **map**                                    |
  | **5**    | **didTapInfoWindowOfMarker**          | Phát sinh khi người dùng touch vào **bảng thông tin** của **Marker** trên **map**                                          |
  | **6**    | **didTapPolyline**                    | Phát sinh khi người dùng touch vào **Polyline** trên **map**                                                               |
  | **7**    | **didTapPolygon**                     | Phát sinh khi người dùng touch vào **Polygon** trên **map**                                                                |
  | **8**    | **didTapCircle**                      | Phát sinh khi người dùng touch vào **Circle**  trên **map**                                                                |
  | **13**   | **didTapMyLocation**                  | Phát sinh khi người dùng touch vào **Marker my location** trên **map**                                                     |
  | **14**   | **didTapMyLocationButtonForMapView**  | Phát sinh khi người dùng touch vào **Button my location** của Map4d cung cấp trên **map**                                  |
  | **15**   | **markerInfoWindow**                  | Phát sinh khi người dùng thay đổi **bảng thông tin** của **Marker**                                                        |

  ####  Các sự kiện liên quan đến kinh doanh và địa điểm yêu thích

  > **Map4d iOS SDK** cung cấp cho nhà phát triển các giao thức tương tác với **POI** và **Object** cung cấp cho bạn các thông tin về địa điểm hoặc đối tượng mà bạn muốn lấy thông tin trên **map**
  <br/>Các **POI** xuất hiện trên map cùng với các biểu tượng tương ứng của chúng. **POI** bao gồm công viên, trường học, v.v. cũng như các **POI** kinh doanh như cửa hàng, nhà hàng và khách sạn.
  <br/>Các **Object** xuất hiên trên **map** như các toàn nhà, các khối hình hộp, ...

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapView(_ mapView: MFMapView?, didTap building: MFBuilding?)
  func mapView(_ mapView: MFMapView?, didTapBuildingWithBuildingID buildingID: String?, name: String?, location: CLLocationCoordinate2D)
  func mapView(_ mapView: MFMapView?, didTap poi: MFPOI?)
  func mapView(_ mapView: MFMapView?, didTapPOIWithPlaceID placeID: String?, name: String?, location: CLLocationCoordinate2D)
  ```

  #### ** Objective C **

  ```objc
  - (void)mapView: (MFMapView*)  mapView didTapBuilding: (MFBuilding*) building;
  - (void)mapView: (MFMapView*)  mapView didTapBuildingWithBuildingID: (NSString*) buildingID name: (NSString*) name location: (CLLocationCoordinate2D) location;
  - (void)mapView: (MFMapView*)  mapView didTapPOI: (MFPOI*) poi;
  - (void)mapView: (MFMapView*)  mapView didTapPOIWithPlaceID: (NSString*) placeID name: (NSString*) name location: (CLLocationCoordinate2D) location;
  ```

  <!-- tabs:end -->

  | No       | Event name                            | Description                                                                                                                |
  |----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | **1**    | **didTapBuilding**                    | Phát sinh khi người dùng touch vào **Building** trên **map**                                                               |
  | **2**    | **didTapBuildingWithBuildingID**       | Phát sinh khi người dùng touch vào **Building** trên **map**                                                              |
  | **3**    | **didTapPOI**                          | Phát sinh khi người dùng touch vào **Poi** trên **map**                                                                   |
  | **4**    | **didTapPOIWithPlaceID**               | Phát sinh khi người dùng touch vào **Poi** trên **map**                                                                   |
