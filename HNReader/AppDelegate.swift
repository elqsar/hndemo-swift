//
//  AppDelegate.swift
//  HNReader
//
//  Created by Boris on 04.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Customize navigation bar
        styleNavigationBar()
        
        return true
    }
    
    func styleNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 223/255, green: 105/255, blue: 23/255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)]
    }

}

