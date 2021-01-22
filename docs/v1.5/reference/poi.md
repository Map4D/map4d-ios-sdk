# POI reference

## POI Class

### 1 Constructor


<!-- tabs:start -->
#### ** Swift **

```swift 
let poi = MFPOI()
```

#### ** Objective C **

```objc 
MFPOI *poi = [[MFPOI alloc] init];
```

<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                                |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **position**               | CLLocationCoordinate2D | Chỉ định một **CLLocationCoordinate2D** để xác định vị trí ban đầu của **POI**.                                         |
| **title**                  | NSString               | Chỉ định tiêu đề của **POI**. Tiêu đề sẽ hiển thị thông tin của **POI** mà bạn muốn hiển thị cho người dùng.            |
| **titleColor**             | UIColor                | Chỉ định màu tiêu đề của **POI**.                                                                                       |
| **subtitle**               | NSString               | Chỉ định thông tin mô tả của **POI**.                                                                                   |
| **type**                   | NSString               | Chỉ định kiểu của **POI**, tùy thuộc vào kiểu mà icon của **POI** sẽ có hình ảnh tương ứng.                             |
| **iconView**               | UIView                 | Cho phép thêm biểu diễn **POI** bằng **UIView** mà người dùng tuỳ chỉnh để thay thế icon mặc định của **POI**.          |
| **icon**                   | UIImage                | Tùy chỉnh **icon** cho **POI**. Có thể truyền vào là một **UIImage**                                                    |
| **userInteractionEnabled** | BOOL                | Cho phép người dùng có thể tương tác được với **POI** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **POI** thì tất cả các sự kiện liên quan tới **POI** từ phía người dùng sẽ không có tác dụng.                                                                                               | 
| **isHidden**               | BOOL                   | Xác định **POI** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                          |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các POI với nhau hoặc giữa **POI** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                           |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **POI**.                                                                     |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)             | Chỉ định hiển thị **POI** trên **Map** hoặc xoá **POI** khỏi **Map**                      |
| **Id**                     | UInt32                 | **Id** của **POI** **{get}**.                                                                                           |

**Ghi chú:** Hiện tại Map4D hỗ trợ cái kiểu sau: **point**, **cafe**, **bus_station**, **electronics**, **shop**, **bakery**, **fuel**, **restaurant**, **police**, **payment_centre**, **museum**, **university**, **school**, **airport**, **bank**, **clothes**, **motel**, **insurance**, **furniture**, **atm**, **hospital**, **bar**, **books**, **theatre**, **car**, **goverment**, **townhall**, **apartment**, **park**, **stadium**, **nightclub**. Kiểu mặc định sẽ là **point**.


#### Delegate

  > **Chú ý**: Để sử dụng các sự kiện của **POI** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **TouchPOI**

  Phát sinh khi người dùng **touch** vào **POI**
  </br>Cung cấp thông tin của **POI** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift 
  func mapView(_ mapView: MFMapView!, didTap poi: MFPOI!) {}
  func mapView(_ mapView: MFMapView!, didTapPOIWithPlaceID placeID: String!, name: String!, location: CLLocationCoordinate2D) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapView: (MFMapView*)  mapView didTapPOI: (MFPOI*) poi{}
  - (void)mapView: (MFMapView*)  mapView didTapPOIWithPlaceID: (NSString*) placeID name: (NSString*) name location: (CLLocationCoordinate2D) location {}
  ```

  <!-- tabs:end -->