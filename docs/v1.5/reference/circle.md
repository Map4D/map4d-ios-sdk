# Circle reference

## Circle Class

### 1 Constructor

<!-- tabs:start -->

#### ** Swift **

```swift 
let circle = MFCircle()
```

#### ** Objective C **

```objc 
MFCircle *circle = [[MFCircle alloc] init];
```

<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                                |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **position**               | CLLocationCoordinate2D | Chỉ định một **CLLocationCoordinate2D** để xác định vị trí ban đầu của **Circle**.                                      |
| **fillColor**              | UIColor                | Chỉ định màu sắc của **Circle**.                                                                                        |
| **strokeColor**            | UIColor                | Chỉ định màu sắc của **đường viền Circle**.                                                                             |
| **radius**                 | double                 | Chỉ định bán kính của **Circle** theo đơn vị mét.                                                                       |
| **strokeWidth**            | double                 | Chỉ định độ lớn của đường viền **Circle** theo đơn vị point.                                                            |
| **userInteractionEnabled** | BOOL                   | Cho phép người dùng có thể tương tác được với **Circle** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **Circle** thì tất cả các sự kiện liên quan tới **Circle** từ phía người dùng sẽ không có tác dụng.                                                                             |
| **isHidden**               | BOOL                   | Xác định **Circle** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                       |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các Circle với nhau hoặc giữa **Circle** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                           |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **Circle**.                                                                  |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)              | Chỉ định hiển thị **Circle** trên **Map** hoặc xoá **Circle** khỏi **Map**        |
| **Id**                     | UInt32                 | **Id** của **Circle** **{get}**.                                                                                        |


#### Delegate

  > **Chú ý**: Để sử dụng sự kiện của **Circle** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **TouchCircle**

  Phát sinh khi người dùng **touch** vào **Circle**
  </br>Cung cấp thông tin của **Circle** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapview:(MFMapView *)mapView didTapCircle:(MFCircle *)circle{}
  ```

  <!-- tabs:end -->