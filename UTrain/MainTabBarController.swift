//
//  MainTabBarController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, BWWalkthroughViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey(Constants.FirstLaunchNUD) {
            
            showWalkthrough()
            println("viewDidLoad")
            userDefaults.setBool(true, forKey: Constants.FirstLaunchNUD)
            userDefaults.synchronize()
        }

    }
    
    func showWalkthrough() {
    
        //Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        
        let walkthrough = stb.instantiateViewControllerWithIdentifier("walk") as! BWWalkthroughViewController
        let page_zero = stb.instantiateViewControllerWithIdentifier("walk0") as! UIViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("walk1") as! UIViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("walk2")as! UIViewController
        let page_three = stb.instantiateViewControllerWithIdentifier("walk3") as! UIViewController
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        walkthrough.addViewController(page_three)
        walkthrough.addViewController(page_zero)
        
        self.presentViewController(walkthrough, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Walkthrough delegate -
    
    func walkthroughPageDidChange(pageNumber: Int) {
//        println("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
