#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_root_detection.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_root_detection'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for detecting root on Android and jailbreak on iOS.'
  s.description      = <<-DESC
A Flutter plugin for detecting root on Android and jailbreak on iOS.
                       DESC
  s.homepage         = 'https://github.com/eyro-labs/flutter_root_detection'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Alann Maulana' => 'maulana@cubeacon.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'DTTJailbreakDetection'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
