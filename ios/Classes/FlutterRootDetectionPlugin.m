#import "FlutterRootDetectionPlugin.h"
#if __has_include(<flutter_root_detection/flutter_root_detection-Swift.h>)
#import <flutter_root_detection/flutter_root_detection-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_root_detection-Swift.h"
#endif

@implementation FlutterRootDetectionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterRootDetectionPlugin registerWithRegistrar:registrar];
}
@end
