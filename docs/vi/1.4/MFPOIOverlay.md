# POI Overlay
Lớp MFURLPOILayer cho phép thêm vào các đối tượng POIs theo tile


## 1. MFURLPOILayer

- Static method:
    + poiLayerWithURLConstructor:
        + Tạo MFURLPOILayer với URLConstructor, cần implement MFPOIURLConstructor
    + poiLayerWithURLConstructor:prefixId:
        + Tạo MFURLPOILayer với URLConstructor và prefixId, prefixId sẽ được thêm vào phía trước id của mỗi POI (nhằm tránh hiện tượng POI id của các overlay trùng với POI id của map4D)

- Properties:
    - map:MFMapView
        - Map view hiển thị POI overlay
    - isHidden:bool
        - Cho phép ẩn POI overlay khỏi map
    - prefixId:String(readonly)

- Methods:
    - clearPOICache
        - Reload POI overlay đang hiển thị và xóa cache

## 2. MFPOIURLConstructor

```objc
@protocol MFPOIURLConstructor <NSObject>
- (NSURL* _Nullable) getPOIUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;
@end
```

## 3. Tạo POI Overlay
  
```swift
    class POIUrlConstructor : NSObject, MFPOIURLConstructor {
    func getPOIUrlWith(x: UInt, y: UInt, zoom: UInt) -> URL? {
        return URL(string: "https://your-domain/api/\(zoom)/\(x)/\(y)")
    }
    }
    let poiOverlay = MFURLPOILayer(urlConstructor: POIUrlConstructor())
    poiOverlay.map = mapView
```

## 4. API Response
Để sử dụng được tính năng POI Overlay trên Map4D Map SDK, bạn cần 1 API nhận 3 thông số của một `Map Tile` là `x`, `y`, `zoom` và dữ liệu trả về kiểu `JSON` theo cấu trúc sau:

```json
{
  "code": "ok",
  "result": {
    "places": [
      {
        "id": "id",
        "name": "name",
        "types": [
          "bank"
        ],
        "location": {
          "lng": 108.2136443,
          "lat": 16.0698656
        },
        "rank": {
          "value": 1000113.0
        },
        "icon": {
          "type": "bank",
          "url": null,
          "color": "916546FF"
        }
      },
      {
        ...
      }
    ]
  }
}
```

License
-------

Copyright (C) 2020 IOT Link Ltd. All Rights Reserved.
