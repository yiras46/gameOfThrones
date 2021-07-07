//
//  AppDelegate.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = CategoriesRouter.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }
}

