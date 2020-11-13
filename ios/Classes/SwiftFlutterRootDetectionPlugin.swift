import Flutter
import UIKit
import DTTJailbreakDetection

public class SwiftFlutterRootDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_root_detection", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterRootDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "rooted":
        let isJailBroken = DTTJailbreakDetection.isJailbroken()
        result(isJailBroken)
        break
    case "developerMode":
        result(false)
        break
    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
