import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDHBMw1neOYHQeSYqyGWSKmhGzyCLUQ9Oc")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
