//
//  AppDelegate.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private(set) var rootVC: UINavigationController?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialVC = AlbumsViewController()
        rootVC = UINavigationController(rootViewController: initialVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

