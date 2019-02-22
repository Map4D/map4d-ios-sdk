# Animate trong Map4D-SDK
Map4D SDK hỗ trợ người dùng di chuyển tới một vị trí camera mới thông qua 2 hàm animate và move

## 1. Animate tới một vị trí mới

```switf
   let target = CLLocationCoordinate2DMake(16.050928,108.225117)
   let cameraUpdate = MFCameraUpdate.setTarget(target, zoom: 16, tilt: 30, bearing: 50)
   map4d.animate(with: cameraUpdate)
```

```switf
  // Animation
  - (void) animateWithCameraUpdate:(MFCameraUpdate *) cameraUpdate;
  - (void) animateToCameraPosition:(MFCameraPosition *) cameraPosition;
  - (void) animateToLocation:(CLLocationCoordinate2D) position;
  - (void) animateToZoom: (float) zoom;
```

## 2. Move tới một vị trí mới

```switf
  let target = CLLocationCoordinate2DMake(10.772603,106.702309)
  let cameraPosition = MFCameraPosition.init(target: target, zoom: 17, tilt: 50, bearing: 10)
  map4d.move(cameraPosition)
```

```switf
  // Move To
  - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom duration: (long) duration;

  - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom;

  - (void) moveTo: (CLLocationCoordinate2D) latLng ;

  - (void) moveCamera: (MFCameraUpdate* ) cameraUpdate;
  - (void) moveCameraPosition: (MFCameraPosition* ) position;
```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
