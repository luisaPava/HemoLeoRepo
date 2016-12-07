//
//  AppDelegate.swift
//  iPhone
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let userModel = UserModel.sharedUserModel

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor(netHex: 0x2BC16B)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController: UIViewController!
        
        if userModel.getUsersCount() == 1 {
            userModel.setUser(index: 0)
            
            initialViewController = storyboard.instantiateViewController(withIdentifier: "tabBarMain") as! UITabBarController
            
            let frame = UIScreen.main.bounds
            window = UIWindow(frame: frame)
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()

        }
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor(netHex: 0x2ECC71)]
        UINavigationBar.appearance().tintColor = UIColor(netHex: 0x2ECC71)

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

