# Map reference

## MFMapView

### 1. Constructor 

<!-- tabs:start -->
#### ** Swift **

```swift
let mapView = MFMapView(frame: self.view.frame)
```

#### ** Objective C **

```objc
MFMapView *mapView = [[MFMapView alloc] initWithFrame: self.view.frame];
```
<!-- tabs:end -->

### 2. Properties

| Name                       | Type                                                                            |
|----------------------------|:--------------------------------------------------------------------------------|
| **delegate**               | [MFMapViewDelegate](/guides/map-events?id=Map-events)                           |
| **projection**             | [MFProjection](/guides/projection?id=Projection)                                |
| **camera**                 | [MFCameraPosition](/reference/map?id=MFCameraPosition)                          | 
| **settings**               | [MFUISettings](/reference/map?id=MFUISettings)                                  |
| **nativeScale**            | CGFloat                                                                         |


### 3. Methods

| Name                       | Parameters              | Return value         | Description                                                                                                             |
|----------------------------|:-----------------------:|:--------------------:|-------------------------------------------------------------------------------------------------------------------------|
| **setMyLocationEnabled**   | BOOL                    | void                 | Bật vị trí của thiết bị                                                                                                 |
| **getMyLocation**          | none                    | CLLocation           | Lấy vị trí của thiết bị                                                                                                 |
| **setFilterPlaces**        | [NSString]?             | void                 | Lọc các **place** theo **type** như: **cafe**, **bus_station**, **electronics**, **shop**, **bakery**, **fuel**, ....   |
| **getFilterPlaces**        | none                    | [NSString]           | **Get** các **type** **place** đã lọc                                                                                   |
| **setPOIsEnabled**         | BOOL                    | void                 | Cho phép hiển thị các **POI** có sẵn của **map** hay không                                                              |
| **isPOIsEnabled**          | none                    | BOOL                 | Kiểm tra các **POI** có sẵn của **map** được phép hiển thị hay không.                                                   |
| **setBuildingsEnabled**    | BOOL                    | void                 | Cho phép hiển thị các **Building** có sẵn của **map** trong chế độ 3D hay không.                                        |
| **isBuildingsEnabled**     | none                    | BOOL                 | Kiểm tra các **Building** có sẵn của **map** được phép hiển thị trong chế độ 3D hay không.                              |
| **setHiddenBuilding**      | NSString                | void                 | **Set** **Building** có **id** truyền vào ẩn khỏi **map**.                                                              |
| **setUnhiddenBuilding**    | NSString                | void                 | **Set** **Building** có **id** truyền vào hiện lại trên **map**.                                                        |
| **setSelectedBuildings**   | [NSString]?             | void                 | **Set** **high light** cho các **Building** có **id** nằm trong danh sách tham số truyền vào trong chế độ 3D.           |
| **setMaxNativeZoom**       | Double                  | void                 | **Set** mức **zoom** lớn nhất mà **map** **request tile** từ **server**.                                                |
| **enable3DMode**           | BOOL                    | void                 | Bật hoặc tắt chế độ 3D của **map**.                                                                                     |
| **setTileUrl**             | NSString                | void                 | **Set** một đường dẫn **url** để tải **tile** từ **server** thay thế cho **url** mặc định của SDK.                      |
| **is3DMode**               | BOOL                    | void                 | Kiểm tra **map** có ở chế độ 3D không.                                                                                  |
| **setMinZoom**             | Double, Double          | void                 | **Set** mức **zoom** nhỏ nhất và lớn nhất mà **map** có thể hiển thị.                                                   |
| **clear**                  | BOOL                    | void                 | Xoá mọi thứ mà người dùng **add** vào như **Markers**, **Polylines**, **ground overlays**, **POI**, **Building**.       |
| **setTime**                | Double, Double          | void                 | **Set** thời gian hiển thị cho **map**.                                                                                 |
| **enableWaterEffect**      | BOOL                    | void                 | Bật hoặc tắt hiệu ứng nước ở chế độ 3D của **map**..                                                                    |
| **cameraForBounds**        | [MFCoordinateBounds](/reference/coordinates?id=MFCoordinateBounds)                 | [MFCameraPosition](/reference/map?id=MFCameraPosition)   | Tạo ra một thông tin **Camera** từ các tham số bạn truyền vào.                                                                                                                                                                                 |
| **cameraForBounds**        | [MFCoordinateBounds](/reference/coordinates?id=MFCoordinateBounds) , UIEdgeInsets  | [MFCameraPosition](/reference/map?id=MFCameraPosition)   | Tạo ra một thông tin **Camera** từ các tham số bạn truyền vào.                                                                                                                                                                                 |
| **animateCamera**          | [MFCameraUpdate](/reference/map?id=MFCameraUpdate)                         | none                 | **Animate** **camera** đến vị trí theo camera bạn truyền vào.        |
| **moveCamera**             | [MFCameraUpdate](/reference/map?id=MFCameraUpdate)                         | none                 | **Move** **camera** đến vị trí theo camera bạn truyền vào.           |
  

  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;

  @property(nonatomic) CLLocationCoordinate2D target;
  @property(nonatomic) double zoom;
  @property(nonatomic) double bearing;
  @property(nonatomic) double tilt;
  
### MFCameraPosition

#### 1. Constructor 

<!-- tabs:start -->
#### ** Swift **

```swift
init(target: CLLocationCoordinate2D, zoom: Double) {}
init(target: CLLocationCoordinate2D, zoom: Double, tilt: Double) {}
init(target: CLLocationCoordinate2D, zoom: Double, bearing: Double) {}
init(target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Double) {}
```

#### ** Objective C **

```objc  
- (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
- (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
- (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
- (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;
```
<!-- tabs:end -->

#### 2. Properties

| Name                       | Type                                                                            |
|----------------------------|:--------------------------------------------------------------------------------|
| **target**                 | CLLocationCoordinate2D                                                          |
| **zoom**                   | double                                                                          |
| **bearing**                | double                                                                          | 
| **tilt**                   | double                                                                          |

### MFCameraUpdate

#### Public static member functions 

<!-- tabs:start -->
#### ** Swift **

```swift
class func fit(_ bounds: MFCoordinateBounds?) -> MFCameraUpdate? {}
class func fit(_ bounds: MFCoordinateBounds?, with edgeInsets: UIEdgeInsets) -> MFCameraUpdate? {}
class func setTarget(_ target: CLLocationCoordinate2D) -> MFCameraUpdate? {}
class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double) -> MFCameraUpdate? {}
class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, tilt: Double) -> MFCameraUpdate? {}
class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, bearing: Double) -> MFCameraUpdate? {}
class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Double) -> MFCameraUpdate? {}
class func setCamera(_ camera: MFCameraPosition?) -> MFCameraUpdate? {}
```

#### ** Objective C **

```objc  
+ (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds;
+ (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets;
+ (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target;
+ (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
+ (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt;
+ (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
+ (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;
+ (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera;
```
<!-- tabs:end -->

### MFUISettings

#### 1. Properties

| Name                       | Type                                                                            |
|----------------------------|:--------------------------------------------------------------------------------|
| **myLocationButton**       | CLLocationCoordinate2D                                                          |
| **scrollGestures**         | double                                                                          |
| **zoomGestures**           | double                                                                          | 
| **tiltGestures**           | double                                                                          |
| **rotateGestures**         | double                                                                          |
 
#### 3. Methods

| Name                       | Parameters                | Return value         | Description                                                                         |
|----------------------------|:-------------------------:|:--------------------:|-------------------------------------------------------------------------------------|
| **setAllGesturesEnabled**  | BOOL                      | void                 | Bật hoặc tắt tất cả cử chỉ tương tác với **map**                                      |
