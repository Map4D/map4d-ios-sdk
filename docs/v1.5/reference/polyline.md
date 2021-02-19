# Polyline reference

## Polyline Class

### 1 Constructor

<!-- tabs:start -->

#### ** Swift **

```swift 
let polyline = MFPolyline()
```

#### ** Objective C **

```objc 
MFPolyline *polyline = [[MFPolyline alloc] init];
```
<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                               |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **path**                   | MFPath                 | Truyền vào một mảng các tọa độ **CLLocationCoordinate2D** để tạo Polyline.**Polyline**.                                 |
| **width**                  | UIColor                | Chỉ định độ rộng của **Polyline** theo đơn vị point.                                                                    |
| **style**                  | MFPolylineStyle        | Chỉ định **Polyline** là loại nét liền **solid** hay nét đứt **dotted**. Giá trị mặc định là **solid** **Polyline**.    |
| **color**                  | double                 | Chỉ định màu sắc của **Polyline**.                                                                                      |
| **userInteractionEnabled** | BOOL                   | Cho phép người dùng có thể tương tác được với **Polyline** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **Polyline** thì tất cả các sự kiện liên quan tới **Polyline** từ phía người dùng sẽ không có tác dụng.                                                                         |
| **isHidden**               | BOOL                   | Xác định **Polyline** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                     |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các Polyline với nhau hoặc giữa **Polyline** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                           |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **Polyline**.                                                                |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)              | Chỉ định hiển thị **Polyline** trên **Map** hoặc xoá **Polyline** khỏi **Map**           |
| **Id**                     | UInt32                 | **Id** của **Polyline** **{get}**.                                                                                      |


#### Delegate

  > **Chú ý**: Để sử dụng sự kiện của **Polyline** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **TouchPolyline**

  Phát sinh khi người dùng **touch** vào **Polyline**
  </br>Cung cấp thông tin của **Polyline** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapview:(MFMapView *)mapView didTapPolyline:(MFPolyline *)polyline{}
  ```

  <!-- tabs:end -->