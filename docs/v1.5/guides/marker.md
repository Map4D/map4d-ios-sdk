# Marker

> **Marker** dùng để xác định một vị trí đơn lẻ trên bản đồ. 

> Cho phép người dùng đánh dấu lên các vị trí trên bản đồ bằng các biểu tượng chung được cung cấp bởi **Map4d SDK** 
hoặc bạn có thể tuỳ chỉnh bằng một hình ảnh khác hoặc tuỳ chỉnh các thuộc tính của **Marker**

### 1. Thêm một marker

Chúng ta thử tạo MFMarker như sau:

<!-- tabs:start -->
#### ** Swift **

```swift 
let marker = MFMarker()
marker.position = CLLocationCoordinate2D(latitude: 16.072086430034517, longitude: 108.2262037173781)
marker.icon = UIImage(named: "iconLocation")
marker.title = "Map4D"
marker.snippet = "An Hải Bắc, Sơn Trà, Đà Nẵng"
marker.map = mapView
```

#### ** Objective C **

```objc 
MFMarker *marker = [[MFMarker alloc] init];
[marker setPosition: CLLocationCoordinate2DMake(16.072086430034517, 108.2262037173781)];
[marker setIcon: [UIImage imageNamed:@"iconLocation"]];
[marker setTitle: @"Map4D"];
[marker setSnippet: @"An Hải Bắc, Sơn Trà, Đà Nẵng"];
[marker setMap:mapView];
```

<!-- tabs:end -->

![Marker](../../resource/v1.5/createMaker.png) 

### 2. Xóa Marker khỏi bản đồ

Để xóa **Marker** khỏi bản đồ, chúng ta **set** thuộc tính **map** bằng **nil**

<!-- tabs:start -->
#### ** Swift **

```swift
marker.map = nil
```

#### ** Objective C **

```objc 
[marker setMap: Nil];
```
<!-- tabs:end -->

Nếu bạn muốn quản lý một danh sách các **Marker**, bạn nên tạo một **mảng** để chứa các **Marker** đó. 

Sử dụng mảng này bạn có thể  **set** lần lượt thuộc tính **map** bằng **mapView** để hiển thị **Marker** hoặc **nil** khi bạn cần xóa các **Marker**.

### 3. Tùy chỉnh Marker

Bạn có thể dễ dàng tuỳ chỉnh hình dáng của **Marker** thông qua các thuộc tính mà **MFMarker** cung cấp như

| Name                       |Description                                                                                                                                       |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **position**               | Để xác định vị trí ban đầu của **Marker**.                                                                                                       |
| **groundAnchor**           | Để xác định điểm neo cho **Marker**                                                                                                              |
| **icon**                   | Tùy chỉnh icon cho **Marker**.Có thể truyền vào là một **UIImage** hoặc **UIView**                                                               |
| **elevation**              | Chỉ định độ cao của **Marker** so với mực nước biển, đơn vị là mét                                                                               |
| **rotation**               | Chỉ định góc quay của **Marker** theo đơn vị là Độ                                                                                               |
| **title**                  | Chỉ định tiêu đề của **Marker**. Tiêu đề sẽ được hiển thị ở dòng đầu tiên của bảng thông tin **Marker**.                                         |
| **snippet**                | Mô tả thông tin ngắn gọn cho **Marker**. Snippet sẽ được hiển thị ở bẳng thông tin của **Marker** và
phía dưới dòng tiêu đề.                                                                                                                                                         |
| **infoWindowAnchor**       |                          Chỉ định một **CGPoint** để xác định điểm neo bảng thông tin của **Marker**. Bảng thông tin này
sẽ hiện lên khi click vào **Marker**                                                                                                                                            |

### 4. Tùy chỉnh hình ảnh cho Marker

Nếu bạn muốn tùy chỉnh **Marker** bạn có thể chỉ dùng một **UIImage** hoặc một **UIView** để thay thế cho hình ảnh mặc định của **Marker**.

#### Tùy chỉnh hình ảnh cho Marker với UIImage

<!-- tabs:start -->
#### ** Swift **

```swift
marker.icon = UIImage(named: "iconLocationBlue")
```

#### ** Objective C **

```objc 
[marker setIcon: [UIImage imageNamed:@"iconLocationBlue"]];
```
<!-- tabs:end -->

![Marker](../../resource/v1.5/setImageMarker.png) 

#### Tùy chỉnh hình ảnh cho Marker với UIView

Bạn có thể thay đổi hình ảnh của **Marker** bằng cách tạo một **UIView** và **set** thuộc tính **iconView** bằng **UIView** đã tạo.

<!-- tabs:start -->
#### ** Swift **

```swift
let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
view.backgroundColor = .blue
marker.iconView = view
```
#### ** Objective C **

```objc
UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40.0, 40.0)];
[view setBackgroundColor: [UIColor blueColor]];
[marker setIconView: view];
```
<!-- tabs:end -->

![Marker](../../resource/v1.5/setIconViewMarker.png) 

#### Marker có bảng thông tin

Bạn có thể tạo **Marker** chứa bảng thông tin bằng cách chỉ định giá trị cho thuộc tính **title** và **snippet** của **Marker**

<!-- tabs:start -->
#### ** Swift **

```swift
marker.title = "Map4D"
marker.snippet = "An Hải Bắc, Sơn Trà, Đà Nẵng"
```

#### ** Objective C **

```objc
[marker setTitle: @"Map4D"];
[marker setSnippet: @"An Hải Bắc, Sơn Trà, Đà Nẵng"];
```
<!-- tabs:end -->

Bảng thông tin sẽ được hiển thị **khi người dùng click lên Marker** như hình bên dưới:

![Marker](../../resource/v1.5/infoWindowMarker.png) 

### 5. Kéo Marker di chuyển trên bản đồ

Để cho phép người dùng có thể kéo một **Marker** tới một vị trí khác trên bản đồ, bạn cần **set** thuộc tính **draggable** bằng **true**

<!-- tabs:start -->
#### ** Swift **

```swift
marker.draggable = true
```

#### ** Objective C **

```objc
[marker setDraggable: YES];
```

<!-- tabs:end -->

Ngoài ra bạn có thể gọi phương thức **setDraggable()** của đối tượng **Marker** và truyền vào tham số **true** để bật
tính năng **draggable** của **Marker** hoặc truyền vào tham số **false** để tắt tính năng **draggable**.