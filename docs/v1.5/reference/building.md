# Building reference

## Building Class

### 1 Constructor

<!-- tabs:start -->
#### ** Swift **

```swift 
let Building = MFBuilding()
```

#### ** Objective C **

```objc 
MFBuilding *Building = [[MFBuilding alloc] init];
```

<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                                |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **name**                   | NSString               | Chỉ định tên của  **Building**.                                                                                         |
| **position**               | CLLocationCoordinate2D | Chỉ định một **CLLocationCoordinate2D** để xác định vị trí ban đầu của **Building**.                                    |
| **model**                  | NSString               | Chỉ định một đường dẫn **URL** để lấy dữ liệu **model** cho **Building**.                                               |
| **texture**                | NSString               | Chỉ định một đường dẫn **URL** để lấy dữ liệu **texture** cho **Building**. Thuộc tính này chỉ được dùng khi thuộc tính **model** được **set** giá trị. Nó sẽ **map** **texture** này vào **model** mà bạn đã **set** cho **Building**. Nếu bạn không **set** giá trị **texture** khi đã **set** giá trị **model** thì bản đồ sẽ vẽ một **building** màu trắng.                                                                                                                                                                          |
| **coordinates**            | MFPath                 | Chỉ định một mảng vị trí **CLLocationCoordinate2D** để tạo một **Building** hình khối với mặt đáy của hình khối là mảng vị trí này. Nó kết hợp với thuộc tính **height** để tạo chiều cao cho hình khối đó (**building** này được gọi là **Extrude Building**). Trường hợp dùng **coordinates** thì sẽ không dùng đến thuộc tính **texture**. Nếu **set** giá trị cho **coordinates** và cả **model** đồng thời thì sẽ ưu tiên lấy giá trị của **model** để tạo **Building**.                                                                     |
| **height**                 | double                 | Chỉ định chiều cao của **Building** theo đơn vị là mét. Thuộc tính này chỉ có tác dụng khi **Building** của bạn được tạo từ một mảng **CLLocationCoordinate2D** thông qua thuộc tính **coordinates** (hay còn gọi là **Extrude Building**). Nó không có tác dụng với **Building** được vẽ bằng **Model** và **Texture**. Giá trị mặc định là 1.                                                                                                                                                                               |
| **scale**                  | double                 | Chỉ định tỉ lệ của **Building** được vẽ ra ở trên bản đồ so với tỉ lệ thật của nó. Ví dụ khi giá trị scale là 0.5 thì **Building** sẽ nhỏ hơn một nửa so với kích thước thật của nó. Giá trị mặc định là 1.                                                                                                                            |
| **bearing**                | CGFloat                | Chỉ định góc quay của **Building** khi được vẽ ra trên bản đồ theo đơn vị là Độ. Bình thường giá trị mặc định của nó là 0. Khi bạn muốn quay **Building** theo một hướng nào đó thì bạn chỉ cần set lại giá trị **bearing** trong khoảng từ 0 đến 360 độ.                                                                     |
| **elevation**              | double                 | Chỉ định độ cao của **Building** so với mực nước biển, đơn vị là mét. Giá trị mặc định là 0                              |
| **selected**               | bool                   | Chỉ định Building có được **hightlight** hay không. Khi nó được set là true thì **Building** sẽ được vẽ một đường viền màu đỏ xung quanh để giúp người dùng dễ nhận biết. Còn khi nó được **set** giá trị là **false** thì nó sẽ được vẽ như một **Building** bình thường. Giá trị mặc định là **false**.                               |
| **types**                  | NSMutableArray*        | Chỉ định kiểu của **Building**.                                                                                          |
| **minZoom**                | double                 | Chỉ định mức zoom tối thiểu cho **Building**.                                                                            |
| **maxZoom**                | double                 | Chỉ định mức zoom đa thiểu cho **Building**.                                                                             |
| **startDate**              | NSDate                 | Chỉ định thời gian tạo **Building**.                                                                                     |
| **endDate**                | NSDate                 | Chỉ định thời gian kết thúc của **Building**.                                                                            |
| **userInteractionEnabled** | boolean                | Cho phép người dùng có thể tương tác được với **Building** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **Building** thì tất cả các sự kiện liên quan tới **Building** từ phía người dùng sẽ không có tác dụng.                                                                          | 
| **isHidden**               | Bool                   | Xác định **Building** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                      |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các Building với nhau hoặc giữa **Building** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                            |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **Building**.                                                                 |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)              | Chỉ định hiển thị **Building** trên **Map** hoặc xoá **Building** khỏi **Map**     |
| **Id**                     | UInt32                 | **Id** của **Building** **{get}**.                                                                                       |

**Ghi chú:** Hiện tại Map4D hỗ trợ cái kiểu sau: **Buildingnt**, **cafe**, **bus_station**, **electronics**, **shop**, **bakery**, **fuel**, **restaurant**, **police**, **payment_centre**, **museum**, **university**, **school**, **airport**, **bank**, **clothes**, **motel**, **insurance**, **furniture**, **atm**, **hospital**, **bar**, **books**, **theatre**, **car**, **goverment**, **townhall**, **apartment**, **park**, **stadium**, **nightclub**. Kiểu mặc định sẽ là **Buildingnt**.


#### Delegate

  > **Chú ý**: Để sử dụng các sự kiện của **Building** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **TouchBuilding**

  Phát sinh khi người dùng **touch** vào **Building**
  </br>Cung cấp thông tin của **Building** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift 
  func mapView(_ mapView: MFMapView!, didTapBuildingWithBuildingID buildingID: String!, name: String!, location: CLLocationCoordinate2D) {}
  func mapView(_ mapView: MFMapView!, didTap building: MFBuilding!) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapView: (MFMapView*)  mapView didTapBuilding: (MFBuilding*) building{}
  - (void)mapView: (MFMapView*)  mapView didTapBuildingWithBuildingID: (NSString*) buildingID name: (NSString*) name location: (CLLocationCoordinate2D) location{}
  ```

  <!-- tabs:end -->