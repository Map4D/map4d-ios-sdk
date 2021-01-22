# Ground Overlay References

## MFGroundOverlay class

`MFGroundOverlay` class

**Constructor** 

Lớp `MFGroundOverlay` cung cấp một số phương thức static để tạo đối tượng *MFGroundOverlay* một cách tiện lợi
```objc
+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds mapUrl:(NSString* _Nonnull)url;
+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds mapUrl:(NSString* _Nonnull)url overrideBaseMap:(BOOL) enabled;
+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds
                              tileURLConstructor:(id<MFTileURLConstructor> _Nonnull)constructor;
+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds
                              tileURLConstructor:(id<MFTileURLConstructor> _Nonnull)constructor
                                 overrideBaseMap:(BOOL) enabled;
```

- Parameters:
  - bounds: [MFCoordinateBounds](/reference/coordinates?id=mfcoordinatebounds)
  - mapUrl: [NSString](https://developer.apple.com/documentation/foundation/nsstring)
  - urlConstructor: [MFTileURLConstructor](reference/tile-overlay?id=mftileurlconstructor-protocol)
  - overrideBaseMap [BOOL](https://developer.apple.com/documentation/objectivec/bool)

Sử dụng
<!-- tabs:start -->
#### ** Swift **
```swift
let groundOverlay = MFGroundOverlay(bounds: bounds, tileURLConstructor: urlConstructor, overrideBaseMap: true)
```
#### ** Objective-C **
```objc
MFGroundOverlay *groundOverlay = [MFGroundOverlay groundOverlayWithBounds:bounds tileURLConstructor:urlConstructor overrideBaseMap:YES];
```
<!-- tabs:end -->

**Properties**

| Name         | Type      | Description                                                                            |
|--------------|-----------|----------------------------------------------------------------------------------------|
| **map**      | [MFMapView](/reference/map?id=mfmapview-class) | Map view sẽ hiển thị ground overlay |
| **isHidden** | bool                                           | Ẩn/hiện ground overlay trên map |
| **zIndex**   | float                                          | Giá trị zIndex của ground overlay cao hơn sẽ hiển thị trên tile/ground overlay có giá trị zIndex nhỏ hơn |