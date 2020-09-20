# POI Overlay
Lớp MFURLPOILayer cho phép thêm vào các đối tượng POIs theo tile


## 1. MFURLPOILayer

- Static method:
    + poiLayerWithURLConstructor:
        + Tạo MFURLPOILayer với URLConstructor, cần implement MFPOIURLConstructor

- Properties:
    - map:MFMapView
        - Map view hiển thị POI overlay
    - isHidden:bool
        - Cho phép ẩn POI overlay khỏi map

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
        return URL(string: "https://api.map4d.vn/sdk/tile/v2/\(zoom)/\(x)/\(y)?key=98fd21346d83bee24dc734231f7609c9&mode=2d")
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
        "id": "5c88df2fd2c05acd14848f2a",
        "name": "Ngân hàng Á Châu (ACB)",
        "types": [
          "bank",
          "payment_centre",
          "point",
          "establishment"
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
        "id": "5c88df71d2c05acd14849002",
        "name": "Quán Cháo Chả Bà Hường Chợ Cồn",
        "types": [
          "restaurant",
          "point",
          "food",
          "establishment"
        ],
        "location": {
          "lng": 108.2143537,
          "lat": 16.0677257
        },
        "rank": {
          "value": 1000020.0
        },
        "icon": {
          "type": "restaurant",
          "url": "https://sw-hcm-1.vinadata.vn/v1/AUTH_4486f66f671c41bab0d3dea1904626d4/sdk/icons/option0/restaurant@1x",
          "color": null
        }
      },
      {
        "id": "5c89d56495f3d0aabc3df1f6",
        "name": "TỎI ĐEN AUM",
        "types": [
          "shop",
          "healthcare",
          "point",
          "food",
          "establishment"
        ],
        "location": {
          "lng": 108.2111511,
          "lat": 16.0692894
        },
        "rank": {
          "value": 1000031.5
        },
        "icon": {
          "type": "shop",
          "url": "https://sw-hcm-1.vinadata.vn/v1/AUTH_4486f66f671c41bab0d3dea1904626d4/sdk/icons/option0/shop@1x",
          "color": "8f7fc7FF"
        }
      },
      {
        "id": "5c92e63f6e287b2d789b20d8",
        "name": "Công Ty TNHH Tin Học T & Q",
        "types": [
          "electronics",
          "shop",
          "point",
          "establishment"
        ],
        "location": {
          "lng": 108.2103163,
          "lat": 16.0676248
        },
        "rank": {
          "value": 1000018.0
        },
        "icon": {
          "type": "electronics",
          "url": "https://sw-hcm-1.vinadata.vn/v1/AUTH_4486f66f671c41bab0d3dea1904626d4/sdk/icons/option0/electronics@1x",
          "color": "8f7fc7FF"
        }
      },
      {
        "id": "5c9b1de75174662978400847",
        "name": "Trung Tâm Nhật Ngữ Sakura",
        "types": [
          "school",
          "point",
          "establishment"
        ],
        "location": {
          "lng": 108.2104282,
          "lat": 16.0673698
        },
        "rank": {
          "value": 1000019.5
        },
        "icon": {
          "type": "school",
          "url": "https://sw-hcm-1.vinadata.vn/v1/AUTH_4486f66f671c41bab0d3dea1904626d4/sdk/icons/option0/school@1x",
          "color": null
        }
      },
      {
        "id": "5d0feec32ae09ccc048e5f05",
        "name": "AB Bank",
        "types": [
          "bank",
          "payment_centre",
          "point",
          "establishment"
        ],
        "location": {
          "lng": 108.211242,
          "lat": 16.0696671
        },
        "rank": {
          "value": 1001656.5
        },
        "icon": {
          "type": "bank",
          "url": "https://sw-hcm-1.vinadata.vn/v1/AUTH_4486f66f671c41bab0d3dea1904626d4/sdk/icons/option0/bank@1x",
          "color": "916546FF"
        }
      }
    ]
  }
}
```

License
-------

Copyright (C) 2020 IOT Link Ltd. All Rights Reserved.