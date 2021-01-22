# Map Controls

  ## 1. Các thao tác trên map

  #### Chọn đối tượng hay một vị trí bất kỳ trên map

  Chạm vào đối tượng hay một vị trí bất kỳ trên **map**.

  #### Di chuyển map

  Chạm và giữ ngón tay di chuyển trên **map** để di chuyển **map**.

  #### Xoay map

  Dùng hai ngón tay di chuyển theo đường tròn trên **map** để xoay **map**.

  #### Nghiêng map

  Dùng hai ngón tay di chuyển lên hoặc xuống cùng hướng để nghiêng **map**.

  #### Thu nhỏ hoặc phóng to map

  Dùng hai ngón tay thu hẹp/ mở rộng khoảng cách của 2 ngón tay trên **map** để thay đổi mức **zoom**.
  <br>**Thu hẹp:** Giảm mức **zoom**
  <br>**Mở rộng:** Tăng mức **zoom**

  ## 2. Các thuộc tính điều khiển map

  > Bạn có thể tắt các điều khiển mặc định trên **map** bằng cách đặt các thuộc tính của lớp **MFUISettings**, lớp này có sẵn như một thuộc tính của **MFMapView**. 
  
  - Các điều khiển sau có thể được bật và tắt theo chương trình:

    + **myLocationButton**: Điều khiển bật tắt nút myLocation mà Map4d iOS SDK cung cấp.
    + **scrollGestures**: Điều khiển các cử chỉ cuộn được bật hay tắt. Nếu được bật, người dùng có thể vuốt để xoay **camera**.
    + **zoomGestures**: Điều khiển các cử chỉ thu phóng được bật hay tắt. Nếu được bật, người dùng có thể nhấn đúp, dùng hai ngón tay **thu hẹp hoặc mở rộng** để thay đổi mức **zoom** của **camera**.
    + **tiltGestures**: Điều khiển các cử chỉ nghiêng được bật hay tắt. Nếu được bật, người dùng có thể sử dụng hai ngón tay vuốt dọc xuống hoặc vuốt lên để nghiêng **camera**.
    + **rotateGestures**: Điều khiển xem các cử chỉ xoay được bật hay tắt. Nếu được bật, người dùng có thể sử dụng cử chỉ xoay hai ngón tay để xoay **camera**.

  - **Chú ý:** Bạn có thể bật hoặc tắt tất cả các điều khiển thông qua phương thức **setAllGesturesEnabled**


  <!-- tabs:start -->
  #### ** Swift **

  ```swift
  mapView.settings.myLocationButton = true
  
  mapView.settings.scrollGestures = true
  mapView.settings.zoomGestures = true
  mapView.settings.tiltGestures = true
  mapView.settings.rotateGestures = true
  mapView.settings.setAllGesturesEnabled(true)
  ```

  #### ** Objective C **

  ```objc
  [[mapView settings] setMyLocationButton: true];

  [[mapView settings] setScrollGestures: true];
  [[mapView settings] setZoomGestures: true];
  [[mapView settings] setTiltGestures: true];
  [[mapView settings] setRotateGestures: true];
  [[mapView settings] setAllGesturesEnabled: true];
  ```

  <!-- tabs:end -->


  Để cài đặt mức **zoom** tối đa có thể **get Tile** từ **server** sử dụng phương thức **setMaxNativeZoom**
    
  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  mapView.setMaxNativeZoom(19)
  ```

  #### ** Objective C **

  ```objc
  [mapView setMaxNativeZoom: 19.0];
  ```

  <!-- tabs:end -->

  Ví dụ : Nếu bạn cài đặt **nativeZoom** = 19 thì từ mức **zoom** > 19 sẽ lấy **tile** từ mức zoom 19 mà không phải **get** lại **tile** mới từ **server**.

  ## 3. Các phương thức tương tác trên map

  #### Giới hạn mức zoom tối đa và tối thiểu

  **Set** mức **zoom** tối đa và tối thiểu thông qua phương thức **setMinZoom**
    
  <!-- tabs:start -->
  #### ** Swift **

  ```swift
  mapView.setMinZoom(3.0, maxZoom: 20.0)
  ```

  #### ** Objective C **

  ```objc
  [mapView setMinZoom: 3.0 maxZoom: 20.0];
  ```

  <!-- tabs:end -->
  
  #### Bật tắt chế độ 2D và 3D 

  Sử dùng phương thức **enable3DMode** để điều khiển **mode** 2D hoặc 3D của **map**

  Mức **zoom** tối thiểu ở chế độ 3D là 17

  <!-- tabs:start -->
  #### ** Swift **

  ```swift
  mapView.enable3DMode(true)
  ```

  #### ** Objective C **

  ```objc
  [mapView enable3DMode: true];
  ```

  <!-- tabs:end -->

  #### Lấy các tham số của camera

  **Lấy các tham số của camera như độ nghiêng, độ xoay, điểm quan sát, mức zoom hiện tại.**

  <!-- tabs:start -->
  #### ** Swift **

  ```swift
  let camera = mapView.camera
  let target = camera?.target
  let zoom = camera?.zoom
  let bearing = camera?.bearing
  let tilt = camera?.tilt
  ```

  #### ** Objective C **

  ```objc
  MFCameraPosition *camera = [mapView camera];
  CLLocationCoordinate2D target = [camera target];
  double zoom = [camera zoom];
  double tilt = [camera tilt];
  double bearing = [camera bearing];
  ```

  <!-- tabs:end -->

  **Lấy tham số mode của map hiện tại là 2D or 3D.**

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let is3DMode = mapView.is3DMode()
  ```

  #### ** Objective C **

  ```objc
  bool is3DModel = [mapView is3DMode];
  ```

  <!-- tabs:end -->

  **false**: **Map** đang ở chế độ 2D
  </br>**true**: **Map** đang ở chế độ 3D
  
  ## 4. Di chuyển map

  **Map4D iOS SDK** hỗ trợ người dùng di chuyển tới một vị trí **camera** mới thông qua 2 phương thức **animate** và **move**.

  **Phương thức animate**

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let cameraUpdate = MFCameraUpdate.setTarget(CLLocationCoordinate2D(latitude: 16.08795975082965, longitude: 108.22837829589844), zoom: 17)
  mapView.animateCamera(cameraUpdate)
  ```

  #### ** Objective C **

  ```objc
  MFCameraUpdate *cameraUpdate = [MFCameraUpdate setTarget:CLLocationCoordinate2DMake(16.08795975082965, 108.22837829589844) zoom: 17.0];
  [mapView animateCamera: cameraUpdate];
  ```

  <!-- tabs:end -->

  **Phương thức move**

  <!-- tabs:start -->

  #### ** Swift **

  ```swift
  let cameraUpdate = MFCameraUpdate.setTarget(CLLocationCoordinate2D(latitude: 16.08795975082965, longitude: 108.22837829589844), zoom: 17)
  mapView.animateCamera(cameraUpdate)
  ```

  #### ** Objective C **

  ```objc
  MFCameraUpdate *cameraUpdate = [MFCameraUpdate setTarget:CLLocationCoordinate2DMake(16.08795975082965, 108.22837829589844) zoom: 17.0];
  [mapView moveCamera: cameraUpdate];
  ```

  <!-- tabs:end -->
