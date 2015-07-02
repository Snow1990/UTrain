//
//  CourseDetailViewController.swift
//  UTrain
//
//  Created by SN on 15/6/10.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {

    
    var scrollView: UIScrollView!
    var coursePlayerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        

        coursePlayerView = UIView(frame: CGRectMake(0, 0, Constants.ScreenRect.width, 100))
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = CGSize(width: Constants.ScreenRect.width, height: Constants.ScreenRect.height * 2)
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        scrollView.addSubview(coursePlayerView)
        view.addSubview(scrollView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
