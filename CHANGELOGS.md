# Map4DMap SDK Change Logs

## Version 1.5.0
* Limit 15 FPS khi Map ở chế độ 3D mode và có hiệu ứng nước
* Thay đổi header signature
* Hỗ trợ người dùng tự parser data đối với POI overlay và building overlay
* Hỗ trợ load POI 2x, 3x
* Hỗ trợ custom POI icon với icon url
* [Android] Sửa lỗi crash EGL_BAD_CONTEXT khi tạo EGLContextFactory


## Version 1.4.8
* [iOS] Sửa lỗi không tap building được trên iPhone (6,7,8) Plus, do `nativeScale` khác `contentScaleFactor`, Framebuffer chỉ cho phép tạo size lớn nhất bằng size của `nativeBound`, dẫn tới bị lỗi.
* [iOS] Sửa lỗi không tap được building khi map nghiêng, phần building cao nằm ở phần bầu trời.
