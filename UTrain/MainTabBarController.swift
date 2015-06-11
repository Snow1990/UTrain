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
        

        
//        if let dest = self.viewControllers[0] as? UINavigationController {
//            if let uRecommendViewController = dest.viewControllers[0] as? URecommendViewController {
//                
//            }
//        }
//        if let b = self.toolbarItems as? [UINavigationController] {
//            println(b[0].viewControllers[0].title)
//
//        }
        
//        if let dest = segue.destinationViewController as? UINavigationController {
//            if let chatViewController = dest.viewControllers[0] as? ChatViewController {
//                
//                //把当前选择的单元格用户传递给聊天视图
//                chatViewController.toBuddy = currentBuddy!
//                
        
        
        

    }
    override func viewDidAppear(animated: Bool) {
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey(Constants.FirstLaunchNUD) {
            
            showWalkthrough()
            
            userDefaults.setBool(true, forKey: Constants.FirstLaunchNUD)
            userDefaults.synchronize()
        }
        super.viewDidAppear(animated)


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

    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func unwindToMainTabBar(segue: UIStoryboardSegue) {
        
    }

}
