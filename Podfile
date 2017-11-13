post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == '<insert target name of your pod here>'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
end
target "instrument" do
    use_frameworks!
    pod 'SMIconLabel'
    pod 'AASegmentedControl'
    pod 'Socket.IO-Client-Swift', '~> 13.0.0'
    pod 'libjingle_peerconnection'
    pod 'NSDictionary-ANDYSafeValue'
    pod 'IQKeyboardManager'
    pod 'Toast'
end

