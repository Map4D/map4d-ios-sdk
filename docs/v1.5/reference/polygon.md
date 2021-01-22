# Polygon reference

## Polygon Class

### 1 Constructor

<!-- tabs:start -->

#### ** Swift **

```swift 
let polygon = MFPolygon()
```

#### ** Objective C **

```objc 
MFPolygon *polygon = [[MFPolygon alloc] init];
```
<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                                |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **path**                   | MFPath                 | Truyền vào một mảng các tọa độ **CLLocationCoordinate2D** để tạo Polygon.**Polygon**.                                   |
| **holes**                  | NSArray<MFPath*>       | Truyền vào một mảng hoặc nhiều mảng các tọa độ **CLLocationCoordinate2D** để tạo **Holes** cho **Polygon**.             |
| **fillColor**              | UIColor                | Chỉ định màu tô phía trong của **Polygon**.                                                                             |
| **strokeColor**            | UIColor                | Chỉ định màu sắc đường viền ngoài cùng của **Polygon**.                                                                 |
| **strokeWidth**            | CGFloat                | Chỉ định độ rộng đường viền của Polygon theo đơn vị point.                                                              |
| **userInteractionEnabled** | BOOl                | Cho phép người dùng có thể tương tác được với **Polygon** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **Polygon** thì tất cả các sự kiện liên quan tới **Polygon** từ phía người dùng sẽ không có tác dụng.                                                                           |
| **isHidden**               | BOOl                   | Xác định **Polygon** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                      |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các **Polygon** với nhau hoặc giữa **Polygon** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                           |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **Polygon**.                                                                 |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)              | Chỉ định hiển thị **Polygon** trên **Map** hoặc xoá **Polygon** khỏi **Map**             |
| **Id**                     | UInt32                 | **Id** của **Polygon** **{get}**.                                                                                       |


#### Delegate

  > **Chú ý**: Để sử dụng sự kiện của **Polygon** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **TouchPolygon**

  Phát sinh khi người dùng **touch** vào **Polygon**
  </br>Cung cấp thông tin của **Polygon** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapview: (MFMapView*)  mapView didTapPolygon: (MFPolygon*) polygon {}
  ```

  <!-- tabs:end -->

  **Ghi chú:** **Hole** Là phần đa giác bị khuyết bên trong polygon