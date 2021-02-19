# Demos

## Try the Map4D iOS SDK demos using CocoaPods

1. Nếu chưa có **Cocoapods**, hãy cài đặt nó lên **macOS** bằng cách chạy lệnh dưới với **Terminal**
```shell
sudo gem install cocoapods
```

2. Tải Map4D iOS SDK demo tại:
```
https://github.com/map4d/map4d-ios-sdk/tree/master/examples/ios-sdk-examples/
```

3. Mở **Terminal** và chuyển đến thư mục `ios-sdk-examples`, sau đó chạy lệnh sau:
```shell
pod install
```

4. Open `ios-sdk-examples.xcworkspace` bằng **Xcode**

5. Mở file `AppDelegate.swift` nếu dùng Swift hoặc `AppDelegate.m` nếu dùng Objective-C và thay thế API Key của bạn vào vị trí `YOUR_API_KEY`. Nếu bạn chưa có API Key cho Map4D SDK thì đăng ký tại https://map4d.vn/

<!-- tabs:start -->
#### ** Swift **
```swift
MFServices.provideAccessKey("YOUR_API_KEY")
```
#### ** Objective-C **
```objc
[MFServices provideAccessKey:@"YOUR_API_KEY"];
```
<!-- tabs:end -->

6. Xóa dòng bên dưới

<!-- tabs:start -->
#### ** Swift **
```swift
#error("Register for API Key and insert here. Then delete this line.")
```
#### ** Objective-C **
```objc
#error Register for API Key and insert here. Then delete this line.
```
<!-- tabs:end -->

7. Build & Run

![Examples](/../resource/v1.5/demo-home.png)