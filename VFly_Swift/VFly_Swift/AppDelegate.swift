//
//  AppDelegate.swift
//  VFly_Swift
//
//  Created by Digital One on 12/13/15.
//  Copyright © 2015 Syntel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch

        
        /* to arrange slide views to left */
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leftMenu: LeftMenuViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LeftMenuViewController") as! LeftMenuViewController


        SlideNavigationController .sharedInstance().leftMenu = leftMenu
        SlideNavigationController .sharedInstance().menuRevealAnimationDuration = 0.18

        
        
        let button = UIButton(type:UIButtonType.System) as UIButton
        
        button.frame = CGRectMake(0, 0, 30, 30)
        button.backgroundColor = UIColor.whiteColor()
        button.setImage(UIImage(named: "menu.png"), forState: UIControlState.Normal)
        

        
        button.addTarget(SlideNavigationController.sharedInstance(), action: "toggleRightMenu", forControlEvents: .TouchUpInside)
        
        NSNotificationCenter.defaultCenter().addObserverForName(SlideNavigationControllerDidClose, object: nil, queue: nil, usingBlock: {(note: NSNotification) -> Void in
            let menu  = note.userInfo!["menu"];
            print("Closed %@", menu)
            

        })
        NSNotificationCenter.defaultCenter().addObserverForName(SlideNavigationControllerDidOpen, object: nil, queue: nil, usingBlock: {(note: NSNotification) -> Void in
            let menu  = note.userInfo!["menu"];
            print("Closed %@", menu)

        })
        NSNotificationCenter.defaultCenter().addObserverForName(SlideNavigationControllerDidReveal, object: nil, queue: nil, usingBlock: {(note: NSNotification) -> Void in
            let menu  = note.userInfo!["menu"];
            print("Closed %@", menu)

        })
        
        return true;
        
        
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


}

