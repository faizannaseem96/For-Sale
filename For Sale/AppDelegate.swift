//
//  AppDelegate.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNService.shared.authorize()
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("did register notifications")
        print(Messaging.messaging().fcmToken! + "faizam")
    }
}

