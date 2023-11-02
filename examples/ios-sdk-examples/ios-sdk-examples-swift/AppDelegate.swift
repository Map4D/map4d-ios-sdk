//
//  AppDelegate.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let version = Bundle(for: MFMapView.self).infoDictionary?["CFBundleShortVersionString"] as? String
    // let version = Bundle(for: MFMapView.self).infoDictionary?["CFBundleVersion"] as? String
    print("Map4D Map version: \(version ?? "unknow")")

    return true
  }


}

