# Building Overlay Reference

## MFURLBuildingLayer class
`MFURLBuildingLayer` class

**Constructor** 

Lớp `MFURLBuildingLayer` cung cấp một số phương thức static để tạo đối tượng *MFURLBuildingLayer* một cách tiện lợi
```objc
+ (instancetype _Nonnull) buildingLayerWithURLConstructor:(id<MFBuildingURLConstructor> _Nonnull)constructor;
+ (instancetype _Nonnull) buildingLayerWithURLConstructor:(id<MFBuildingURLConstructor> _Nonnull)constructor prefixId:(NSString* _Nullable)prefixId;
```

- Parameters:
  - urlConstructor: [MFBuildingURLConstructor](#mfbuildingurlconstructor-protocol) *required*
  - prefixId: [NSString](https://developer.apple.com/documentation/foundation/nsstring)

Sử dụng
<!-- tabs:start -->
#### ** Swift **
```swift
let buildingOverlay = MFURLBuildingLayer(urlConstructor: urlConstructor, prefixId: "building-layer-")
```
#### ** Objective-C **
```objc
MFURLBuildingLayer *buildingOverlay = [MFURLBuildingLayer buildingLayerWithURLConstructor:urlConstructor prefixId:@"building-"];
```
<!-- tabs:end -->

**Methods**

| Name              | Parameters  | Return Value | Description                                                           |
|-------------------|-------------|--------------|-----------------------------------------------------------------------|
| **clearBuildingCache** | `none`      | `none`       | Xoá cache của đối tượng building overlay và load lại dữ liệu building theo tile từ server |

**Properties**

| Name         | Type      | Description                                                                            |
|--------------|-----------|----------------------------------------------------------------------------------------|
| **map**      | [MFMapView](/reference/map?id=mfmapview-class) | Map view sẽ hiển thị building overlay |
| **isHidden** | bool                                           | Ẩn/hiện building overlay trên map |
| **prefixId** | NSString                                       | Giá trị được thêm vào trước mỗi id của Builing thuộc building overlay |

## MFBuildingURLConstructor protocol
`MFBuildingURLConstructor` protocol

MFBuildingURLConstructor là một protocol, định nghĩa sẵn 2 phương thức dùng để xác định URL api lấy dữ liệu building và xử lý parser data được lấy từ api.

```objc
- (NSURL* _Nullable) getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;
- (NSArray<MFBuildingData*>* _Nullable) parserBuildingData:(NSString* _Nonnull)data;
```

Cần phải implement protocol này trước khi tạo đối tượng `MFURLBuildingLayer`

## MFBuildingData class
`MFBuildingData` class

MFBuildingData là object chứa thông tin của building để Map4D SDK có thể hiểu được, người sử dụng building overlay sẽ thực hiện implement phương thức `parserBuildingData` để biến đổi dữ liệu trả về từ server của mình thành mảng các building data cung cấp cho Map4D SDK hiển thị lên bản đồ.

| Name           | Type      | Description                                                                            |
|----------------|-----------|----------------------------------------------------------------------------------------|
| **id**         | NSString               | ID của building |
| **position**   | CLLocationCoordinate2D | Vị trí hiển thị building trên bản đồ |
| **name**       | NSString               | Tên của building  |
| **scale**      | double                 | Tỉ lệ hiển thị của building so với kích thước thực tế |
| **bearing**    | float                  | Góc quay của building khi được vẽ ra trên bản đồ (đơn vị: độ) |
| **elevation**  | double                 | Độ cao của building so với mực nước biển (đơn vị: mét) |
| **height**     | double                 | Chiều cao của building (đơn vị: mét) |
| **model**      | NSString               | Đường dẫn URL để lấy dữ liệu model cho building |
| **texture**    | NSString               | Đường dẫn URL để lấy dữ liệu texture cho building |
| **coordinates**| [MFPath](/reference/coordinates?id=mfpath)             | Một mảng vị trí CLLocationCoordinate2D để tạo một Building hình khối với mặt đáy của hình khối là mảng vị trí này. Kết hợp với height để tạo chiều cao |
| **startDate**  | NSDate                 | Ngày bắt đầu hiển thị building |
| **endDate**    | NSDate                 | Ngày kết thúc hiển thị building |

**Chú ý:**
- Trường hợp dùng `model` nhưng `texture` là **`null`** thì building sẽ được tô màu trắng.
- Trường hợp dùng `model` thì sẽ không dùng đến thuộc tính `coordinates`. Nếu set giá trị cho `coordinates` và cả `model` đồng thời thì sẽ ưu tiên lấy giá trị của `model` để tạo Building
