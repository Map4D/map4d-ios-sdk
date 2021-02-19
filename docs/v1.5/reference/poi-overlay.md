# POI Overlay References

## MFURLPOILayer class

`MFURLPOILayer` class

**Constructor** 

Lớp `MFURLPOILayer` cung cấp một số phương thức static để tạo đối tượng *MFURLPOILayer* một cách tiện lợi
```objc
+ (instancetype _Nonnull) poiLayerWithURLConstructor:(id<MFPOIURLConstructor> _Nonnull)constructor;
+ (instancetype _Nonnull) poiLayerWithURLConstructor:(id<MFPOIURLConstructor> _Nonnull)constructor prefixId:(NSString* _Nullable)prefixId;
```

- Parameters:
  - urlConstructor: [MFPOIURLConstructor](#mfpoiurlconstructor-protocol) *required*
  - prefixId: [NSString](https://developer.apple.com/documentation/foundation/nsstring)

Sử dụng
<!-- tabs:start -->
#### ** Swift **
```swift
let poiOverlay = MFURLPOILayer(urlConstructor: poiURLConstructor, prefixId: "poi-overlay-")
```
#### ** Objective-C **
```objc
MFURLPOILayer *poiOverlay = [MFURLPOILayer poiLayerWithURLConstructor:urlConstructor prefixId:@"poi-layer-"];
```
<!-- tabs:end -->

**Methods**

| Name              | Parameters  | Return Value | Description                                                           |
|-------------------|-------------|--------------|-----------------------------------------------------------------------|
| **clearPOICache** | `none`      | `none`       | Xoá cache của đối tượng poi overlay và load lại dữ liệu poi từ server |

**Properties**

| Name         | Type      | Description                                                                            |
|--------------|-----------|----------------------------------------------------------------------------------------|
| **map**      | [MFMapView](/reference/map?id=mfmapview-class) | Map view sẽ hiển thị poi overlay |
| **isHidden** | bool                                           | Ẩn/hiện poi overlay trên map |
| **prefixId** | NSString                                       | Giá trị được thêm vào trước mỗi id của POI thuộc POI overlay |

## MFPOIURLConstructor protocol

`MFPOIURLConstructor` protocol

MFPOIURLConstructor là một protocol, định nghĩa sẵn 2 phương thức dùng để xác định URL api lấy dữ liệu POIs và xử lý parser data được lấy từ api.

```objc
- (NSURL* _Nullable) getPOIUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;
- (NSArray<MFPOIData*>* _Nullable) parserPOIData:(NSString* _Nonnull)data;
```

Cần phải implement protocol này trước khi tạo đối tượng `MFURLPOILayer`

## MFPOIData class

`MFPOIData`class

MFPOIData là object chứa thông tin của POI để Map4D SDK có thể hiểu được, người sử dụng POI overlay sẽ thực hiện implement phương thức `parserPOIData` để biến đổi dữ liệu trả về từ server của mình thành mảng các POI data cung cấp cho Map4D SDK hiển thị lên bản đồ.

| Name           | Type      | Description                                                                            |
|----------------|-----------|----------------------------------------------------------------------------------------|
| **id**         | NSString               | ID của POI |
| **position**   | CLLocationCoordinate2D | Vị trí toạ độ của POI hiển thị trên bản đồ |
| **title**      | NSString               | Tiêu đề của POI  |
| **titleColor** | UIColor                | Màu hiển thị tiêu đề  |
| **type**       | NSString               | Kiểu của POI *("bank", "atm", "park", ...)*, tuỳ thuộc vào kiểu mà POI có icon tương ứng  |
| **iconUrl**    | NSURL                  | Đường dẫn để lấy icon cho POI. Nếu option này được set giá trị thì hình ảnh của POI sẽ lấy theo URL này mà không cần quan tâm tới option type |
| **zIndex**     | float                  | Độ ưu tiên hiển thị của POI đối với POI khác  |
