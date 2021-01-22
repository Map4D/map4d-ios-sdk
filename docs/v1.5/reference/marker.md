# Marker reference

## Marker Class

### 1 Constructor


<!-- tabs:start -->
#### ** Swift **

```swift 
let marker = MFMarker()
```

#### ** Objective C **

```objc 
MFMarker *marker = [[MFMarker alloc] init];
```

<!-- tabs:end -->

#### Properties

| Name                       | Type                | Description                                                                                                                |
|----------------------------|:-------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **position**               | CLLocationCoordinate2D | Chỉ định một **CLLocationCoordinate2D** để xác định vị trí ban đầu của **Marker**.                                      |
| **groundAnchor**           | CGPoint                | Chỉ định một **GCPoint** để xác định điểm neo cho **Marker**. Giá trị mặc định là **{x: 0.0, y: 0.0}**                  |
| **elevation**              | double                 | Chỉ định độ cao của **Marker** so với mực nước biển, đơn vị là mét. Giá trị mặc định là **0**                           |
| **rotation**               | double                 | Chỉ định góc quay của **Marker** theo đơn vị là Độ. Giá trị mặc định là **0**                                           |
| **draggable**              | BOOL                   | Cho phép người dùng có thể kéo **Marker** trên bản đồ hay không. Giá trị mặc định là **false**                          |
| **infoWindowAnchor**       | CGPoint                | Chỉ định một **CGPoint** để xác định điểm neo bảng thông tin của **Marker**. Bảng thông tin này sẽ hiện lên khi **touch** vào **Marker**. Giá trị mặc định là **{x: 0.5, y: 0.0}**                                                                                                                                                    |
| **title**                  | NSString               | Chỉ định tiêu đề của **Marker**. Tiêu đề sẽ được hiển thị ở dòng đầu tiên của bảng thông tin **Marker**.                |
| **snippet**                | NSString               | Mô tả thông tin ngắn gọn cho **Marker**. Snippet sẽ được hiển thị ở bẳng thông tin của **Marker** và phía dưới dòng tiêu đề.                                                                                                                                                                             |
| **iconView**               | UIView                 | Cho phép thêm biểu diễn **Marker** bằng **UIView** mà người dùng tuỳ chỉnh để thay thế icon mặc định của **Marker**.    |
| **icon**                   | UIImage                | Tùy chỉnh **icon** cho **Marker**. Có thể truyền vào là một **UIImage**                                                 |
| **userInteractionEnabled** | BOOL                   | Cho phép người dùng có thể tương tác được với **Marker** hay không. Giá trị mặc định là **true**. Khi không cho phép người dùng tương tác với **Marker** thì tất cả các sự kiện liên quan tới **Marker** từ phía người dùng sẽ không có tác dụng.                                                                             |
| **isHidden**               | BOOL                   | Xác định **Marker** có thể ẩn hay hiện trên bản đồ. Giá trị mặc định là **true**.                                       |
| **zIndex**                 | float                  | Chỉ định thứ tự hiển thị giữa các Marker với nhau hoặc giữa **Marker** với các đối tượng khác trên bản đồ. Giá trị mặc định là **0**                                                                                                                                                                           |
| **userData**               | NSObject               | Cho phép người dùng lưu trữ thông tin trên **Marker**.                                                                  |
| **map**                    | [MFMapView](/reference/map?id=MFMapView)              | Chỉ định hiển thị **Marker** trên **Map** hoặc xoá **Marker** khỏi **Map**               |
| **Id**                     | UInt32                 | **Id** của **Marker** **{get}**.                                                                                        |


#### Delegate

  > **Chú ý**: Để sử dụng các sự kiện của **Marker** phải **set** thuộc tính **userInteractionEnabled** = **true**
  
  **1. TouchMarker**

  Phát sinh khi người dùng **touch** vào **Marker**
  </br>Cung cấp thông tin của **Marker** cho người dùng

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  func mapview(_ mapView: MFMapView?, didTap marker: MFMarker?) -> BOOL {
    return true
  }
  ```

  #### ** Objective C **

  ```objc 
  - (BOOL)mapview:(MFMapView *)mapView didTapMarker:(MFMarker *)marker {
    return YES;
  }
  ```

  <!-- tabs:end -->

  **true**: cho phép tuỳ chọn lại sự kiện **touch** vào **Marker**
  </br> **false**: sử dụng **event** mặc định là **touch** vào **Marker** hiển thị lên thông tin **Marker**
  
  **2. Draggable Marker**

  Được kích hoạt khi người dùng **set** thuộc tính **draggable** = **true**. Phát sinh khi người dùng giữ **Marker**.
  </br>Cho phép người dùng di chuyển **Marker** trực tiếp trên **map**

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
    func mapview(_ mapView: MFMapView?, didBeginDragging marker: MFMarker?) {}
    func mapview(_ mapView: MFMapView?, didEndDragging marker: MFMarker?) {}
    func mapview(_ mapView: MFMapView?, didDrag marker: MFMarker?) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapview:(MFMapView *)mapView didDragMarker:(MFMarker *)marker {}
  - (void)mapview:(MFMapView *)mapView didEndDraggingMarker:(MFMarker *)marker {}
  - (void)mapview:(MFMapView *)mapView didBeginDraggingMarker:(MFMarker *)marker {}
  ```

  <!-- tabs:end -->
  
  **3. touch infoWindow Marker**
  
  Phát sinh khi người dùng **touch** vào bảng thông tin **Marker**. Hiển thị bảng thông tin **Marker**.

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
    func mapview(_ mapView: MFMapView?, didTapInfoWindowOf marker: MFMarker?) {}
  ```

  #### ** Objective C **

  ```objc 
  - (void)mapview:(MFMapView *)mapView didTapInfoWindowOfMarker:(MFMarker *)marker {} 
  ```

  <!-- tabs:end -->