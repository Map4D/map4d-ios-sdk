# Building Overlay
Lớp MFURLBuildingLayer cho phép người dùng thêm vào các đối tượng building 3D theo tile


## 1. MFURLBuildingLayer

- Static method:
    + buildingLayerWithURLConstructor:
        + Tạo MFURLBuildingLayer với URLConstructor, cần implement MFBuildingURLConstructor

- Properties:
    - map:MFMapView
        - Map view hiển thị building overlay
    - isHidden:bool
        - Cho phép ẩn building overlay khỏi map

- Methods:
    - clearBuildingCache
        - Reload building overlay đang hiển thị và xóa cache

## 2. MFBuildingURLConstructor

```objective-c
@protocol MFBuildingURLConstructor <NSObject>
- (NSURL* _Nullable) getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;
@end
```

## 3. Tạo Building Overlay
  
```switf
    class BuildingUrlConstructor : NSObject, MFBuildingURLConstructor {
    func getBuildingUrlWith(x: UInt, y: UInt, zoom: UInt) -> URL? {
        return URL(string: "https://api.map4d.vn/sdk/tile/v2/\(zoom)/\(x)/\(y)?key=98fd21346d83bee24dc734231f7609c9&mode=3d")
    }
    }
    let buildingOverlay = MFURLBuildingLayer(urlConstructor: BuildingUrlConstructor())
    buildingOverlay.map = mapView
```

License
-------

Copyright (C) 2020 IOT Link Ltd. All Rights Reserved.