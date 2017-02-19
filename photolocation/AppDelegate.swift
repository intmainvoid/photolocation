//
//  AppDelegate.swift
//  photolocation
//
//  Created by Gavin Conway on 19/2/17.
//  Copyright © 2017 Gavin Conway. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        Model.sharedInstance.save()
    }

}

