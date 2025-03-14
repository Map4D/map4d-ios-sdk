Pod::Spec.new do |s|
    s.name              = 'Map4dMap'
    s.version           = '2.8.1'
    s.summary           = 'Map4dMap SDK'
    s.homepage          = 'http://map4d.vn'

    s.author            = { 'IOTLink' => 'admin@iotlink.com.vn' }
    s.license           = { :type => 'Apache-2.0'}

    s.platform          = :ios
    s.source = { :git => 'https://github.com/map4d/map4d-ios-sdk.git', :tag => s.version.to_s }

    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'sdk/Map4dMap.xcframework'
end
