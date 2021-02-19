# Projection



Lớp MFProjection được dùng để chuyển đổi giữa vị trí trên màn hình và tọa độ địa lý trên bề mặt trái đất và ngược lại.

### 1. Khởi tạo lớp Projection

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let projection = mapView.projection
  ```

  #### ** Objective C **

  ```objc 
  MFProjection *projection = [mapView projection];
  ```
  <!-- tabs:end -->
  
### 2. Chuyển đổi từ toạ độ LatLng sang toạ độ Screen
  

  
  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let coordinate = CLLocationCoordinate2D(latitude: 16.072086430034517, longitude: 108.2262037173781)
  let target = CLLocationCoordinate2D(latitude: 16.172086430034517, longitude: 108.2462037173781)
  let camera = MFCameraPosition(target: target, zoom: 17, tilt: 10.0, bearing: 10.0)!
  ```

  ```swift
  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen.
  let point1 = projection.point(for: coordinate)

  //Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với elevation (meter)
  let pointElevation = projection.point(for: coordinate, elevation: 10.0)
  ```

  ```swift
  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với camera.
  let pointWithCamera = projection.point(for: coordinate, camera: camera)

  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với camera và elevation (meter) và mode
  let point3DWithCamera = projection.point(for: coordinate, camera: camera, elevation: 10.0, is3DMode: true)
  ```

  #### ** Objective C **

  ```objc 
  CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(16.072086430034517, 108.2262037173781);
  CLLocationCoordinate2D target = CLLocationCoordinate2DMake(16.172086430034517, 108.2462037173781);
  MFCameraPosition *camera = [[MFCameraPosition alloc] initWithTarget: target zoom: 17 tilt:10.0 bearing:10.0];
  ```
  
  ```objc 
  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen.
  CGPoint point = [projection pointForCoordinate: coordinate];

  //Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với elevation (meter)
  CGPoint pointElevation = [projection pointForCoordinate: coordinate elevation:10.0];
  ```

  ```objc 
  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với camera.
  CGPoint pointWithCamera = [projection pointForCoordinate: coordinate camera: camera];

  // Chuyển đổi từ toạ độ LatLng sang toạ độ Screen với camera và elevation (meter) và mode
  CGPoint point3DWithCamera = [projection pointForCoordinate: coordinate camera: camera elevation:10.0 is3DMode:10.0];
  ```
  <!-- tabs:end -->

### 3. Chuyển đổi từ toạ độ Screen sang toạ độ LatLng
  
  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let point = CGPoint(x: 100.0, y: 100.0)
  let target = CLLocationCoordinate2D(latitude: 16.172086430034517, longitude: 108.2462037173781)
  let camera = MFCameraPosition(target: target, zoom: 17, tilt: 10.0, bearing: 10.0)!
  ```
  
  ```swift
  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng.
  let coordinate = projection.coordinate(for:  point)

  //Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với elevation (meter)
  let coordinateElevation = projection.coordinate(for: point, elevation: 10.0)
  ```
  
  ```swift
  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với camera.
  let coordinateWithCamera = projection.coordinate(for: point, camera: camera)

  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với camera và elevation (meter) và mode
  let coordinate3D = projection.coordinate(for: point, camera: camera, elevation: 10.0, is3DMode: true)
  ```

  #### ** Objective C **

  ```objc 
  CGPoint point = CGPointMake(100.0, 100.0);
  CLLocationCoordinate2D target = CLLocationCoordinate2DMake(16.172086430034517, 108.2462037173781);
  MFCameraPosition *camera = [[MFCameraPosition alloc] initWithTarget: target zoom: 17 tilt:10.0 bearing:10.0];
  ```
  
  ```objc 
  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng.
  CLLocationCoordinate2D coordinate = [projection coordinateForPoint: point];

  //Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với elevation (meter)
  CLLocationCoordinate2D coordinateElevation = [projection coordinateForPoint: point elevation:10.0];
  ```

  ```objc 
  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với camera.
  CLLocationCoordinate2D coordinateWithCamera = [projection coordinateForPoint: point camera: camera];
  
  // Chuyển đổi từ toạ độ Screen sang toạ độ LatLng với camera và elevation (meter) và mode
  CLLocationCoordinate2D coordinate3DWithCamera = [projection coordinateForPoint: point camera: camera elevation:10.0 is3DMode:10.0];
  ```
  <!-- tabs:end -->