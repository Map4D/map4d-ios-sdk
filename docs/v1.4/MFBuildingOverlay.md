# Building Overlay
Lớp MFURLBuildingLayer cho phép người dùng thêm vào các đối tượng building 3D theo tile


## 1. MFURLBuildingLayer

- Static method:
    + buildingLayerWithURLConstructor:
        + Tạo MFURLBuildingLayer với URLConstructor, cần implement MFBuildingURLConstructor
    + buildingLayerWithURLConstructor:prefixId:
        + Tạo MFURLBuildingLayer với URLConstructor và prefixId, prefixId sẽ được thêm vào phía trước id của mỗi building (nhằm tránh hiện tượng building id của các overlay trùng với building id của map4D)

- Properties:
    - map:MFMapView
        - Map view hiển thị building overlay
    - isHidden:bool
        - Cho phép ẩn building overlay khỏi map
    - prefixId:String(readonly)

- Methods:
    - clearBuildingCache
        - Reload building overlay đang hiển thị và xóa cache

## 2. MFBuildingURLConstructor

```objc
@protocol MFBuildingURLConstructor <NSObject>
- (NSURL* _Nullable) getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;
@end
```

## 3. Tạo Building Overlay
  
```swift
    class BuildingUrlConstructor : NSObject, MFBuildingURLConstructor {
      func getBuildingUrlWith(x: UInt, y: UInt, zoom: UInt) -> URL? {
        return URL(string: "https://your-domain/api/\(zoom)/\(x)/\(y)")
      }
    }
    buildingOverlay = MFURLBuildingLayer(urlConstructor: BuildingUrlConstructor())
    buildingOverlay?.map = mapView
```

## 4. API Response
Để sử dụng được tính năng Building Overlay trên Map4D Map SDK, bạn cần 1 API nhận 3 thông số của một `Map Tile` là `x`, `y`, `zoom` và dữ liệu trả về kiểu `JSON` theo cấu trúc sau:

```json
{
  "code": "ok",
  "message": "message",
  "result": {
    "objects": [
      {
        "id": "string",
        "name": "string",        
        "location": {
          "lng": 0,
          "lat": 0
        },
        "scale": 0,
        "bearing": 0,
        "elevation": 0,
        "camera": {
          "zoom": 0,
          "bearing": 0,
          "tilt": 0
        },
        "types": [
          "string"
        ],
        "minZoom": 0,
        "maxZoom": 0,
        "startDate": "1569801600000",
        "endDate": "1569901600000",
        "model": {
          "id": "string",
          "type": "Object", //or Polygon
          "objName": "string",
          "objUrl": "string",
          "textureName": "string",
          "textureUrl": "string",
          "color": "string",
          "height": 0,
          "coordinates": [
            {
              "lng": 0,
              "lat": 0
            }
          ]
        }
      }
    ]
  }
}
```

> Gợi ý thiết kế database  
> Cần 2 collection để lưu thông tin các tile map và thông tin đối tượng:  
> ## Tile Collection
> ```json
> {
>   "id": "string",
>   "x": "number",
>   "y": "number",
>   "zoom": "number",
>   "objects": ["objectId"]
> }
> ```  
> ## Object Collection  
> ```json
>{
>        "id": "string",
>        "name": "string",        
>        "location": {
>          "lng": 0,
>          "lat": 0
>        },
>        "scale": 0,
>        "bearing": 0,
>        "elevation": 0,
>        "camera": {
>          "zoom": 0,
>          "bearing": 0,
>          "tilt": 0
>        },
>        "types": [
>          "string"
>        ],
>        "minZoom": 0,
>        "maxZoom": 0,
>        "startDate": "1569801600000",
>        "endDate": "1569901600000",
>        "model": {
>          "id": "string",
>          "type": "Object", //or Polygon
>          "objName": "string",
>          "objUrl": "string",
>          "textureName": "string",
>          "textureUrl": "string",
>          "color": "string",
>          "height": 0,
>          "coordinates": [
>            {
>              "lng": 0,
>              "lat": 0
>            }
>          ]
>        }
>}
> ```  

License
-------

Copyright (C) 2020 IOT Link Ltd. All Rights Reserved.