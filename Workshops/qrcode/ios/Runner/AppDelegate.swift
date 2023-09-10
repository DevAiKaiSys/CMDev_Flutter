import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

  // add uncheck
  let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
  let shareChannel = FlutterMethodChannel("cm.share/share", binaryMessenger: controller)
  shareChannel.setMethodCallHandler({(
      call:FlutterMethodCall, result: FlutterResult)-> Void in
      if (call.method == "shareFile") {
        self.shareFile(sharedItems:call.arguments!,controller: controller);
      }
  });

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
