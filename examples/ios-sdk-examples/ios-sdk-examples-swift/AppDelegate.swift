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
    #error("Register for API Key and insert here. Then delete this line.")
    MFServices.provideAccessKey("YOUR_API_KEY")
    return true
  }


}

