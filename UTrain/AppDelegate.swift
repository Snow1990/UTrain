//
//  AppDelegate.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.initializePlat()
        self.initdata()
        
        
        application.setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        
        
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        UINavigationBar.appearance().barTintColor = Constants.MainColor

//
//        UIToolbar.appearance().barStyle = .BlackTranslucent
        UITabBar.appearance().barStyle = UIBarStyle.Default
        UITabBar.appearance().translucent = true
        UITabBar.appearance().tintColor = Constants.MainColor
        UITabBar.appearance().barTintColor = Constants.TabViewBGGreen
        UITabBar.appearance().opaque = false

//
//        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
//
//        UIButton.appearance().tintColor = UIColor.whiteColor()

//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: 初始化数据
    //初始化数据
    func initdata(){
        
    }
    
    //有网络的时候数据存储
    func database(){
        
    }
    
    //没有网络的时候从数据库中加载数据
    func downloaddata(){
        
    }
    
    // MARK: 初始化社会化平台的AppKeys
    func initializePlat(){
        
    }


}

