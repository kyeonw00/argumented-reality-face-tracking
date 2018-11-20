//
//  AppDelegate.swift
//  ARFaceTracking
//
//  Created by Henry Morris on 20/11/2018.
//  Copyright © 2018 Altair. All rights reserved.
//

import UIKit
import ARKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        /*
         All applications cannot require face-tracking-compatible device, and those applications must offer face-tracking AR as additional feature.
         'isSupported' property can be used to determine whether to offer face tracking AR features.
         This application shows only face-tracking AR, so this application will replace AR view with an alterante view controller containing a static error message.
         */
        
        if !ARFaceTrackingConfiguration.isSupported {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "unsupportedDeviceMessage")
        }
        
        return true
    }
}
