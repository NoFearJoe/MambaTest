//
//  AppDelegate.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if let view = window?.rootViewController as? View {
            ModuleAssembly<Entity>.assembly(with: view)
//            ModuleAssembly<OtherEntity>.assembly(with: view)
        }
        
        return true
    }

}

