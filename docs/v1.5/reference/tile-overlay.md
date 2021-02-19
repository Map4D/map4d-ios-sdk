# Tile Overlay References

## MFURLTileLayer class

`MFURLTileLayer` class

**Constructor** 

Lớp `MFURLTileLayer` cung cấp một phương thức static để tạo đối tượng *MFURLTileLayer* một cách tiện lợi
```objc
+ (instancetype _Nonnull)tileLayerWithURLConstructor:(id<MFTileURLConstructor> _Nonnull)constructor;
```

- Parameters:
  - urlConstructor: [MFTileURLConstructor](reference/tile-overlay?id=mftileurlconstructor-protocol) *required*

Sử dụng
<!-- tabs:start -->
#### ** Swift **
```swift
let tileOverlay = MFURLTileLayer(urlConstructor: urlConstructor)
```
#### ** Objective-C **
```objc
MFURLTileLayer * tileOverlay = [MFURLTileLayer tileLayerWithURLConstructor:urlConstructor];
```
<!-- tabs:end -->

**Methods**

| Name               | Parameters  | Return Value | Description                                                              |
|--------------------|-------------|--------------|--------------------------------------------------------------------------|
| **clearTileCache** | `none`      | `none`       | Xoá cache của đối tượng tile overlay và load lại hình ảnh tile từ server |

**Properties**

| Name         | Type      | Description                                                                            |
|--------------|-----------|----------------------------------------------------------------------------------------|
| **map**      | [MFMapView](/reference/map?id=mfmapview-class) | Map view sẽ hiển thị tile overlay |
| **isHidden** | bool                                           | Ẩn/hiện tile overlay trên map |
| **zIndex**   | float                                          | Giá trị zIndex của tile overlay cao hơn sẽ hiển thị trên tile/ground overlay có giá trị zIndex nhỏ hơn |

## MFTileURLConstructor protocol

`MFTileURLConstructor` protocol

MFTileURLConstructor là một protocol, định nghĩa sẵn phương thức dùng để xác định URL trỏ đến hình ảnh tile tương ứng với mỗi toạ độ và mức zoom

<!-- tabs:start -->
#### ** Swift **
```swift
func getTileUrlWith(x: UInt, y: UInt, zoom: UInt, is3dMode: Bool) -> URL?
```
#### ** Objective-C **
```objc
- (NSURL * _Nullable)getTileUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom is3dMode:(bool)is3dMode;
```
<!-- tabs:end -->

Cần phải implement protocol này trước khi tạo đối tượng `MFURLTileLayer`
