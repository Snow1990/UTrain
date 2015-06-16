//
//  MyClassViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class MyClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.initdata()
        
        self.initTabBar()

        self.initnavigation()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: 导航条布局
    func initnavigation() {
        
        //左边barbuttonitem
        var leftImage = UIImage(named: "home_logo")!
        var leftButton = UIButton(frame: CGRectMake(0, 0, 85, 30))
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
        var leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        //又边barbuttonitem search
        var searchImage = UIImage(named: "btn_search")!
        var searchButton = UIButton(frame: CGRectMake(0, 0, 50, 30))
        searchButton.setBackgroundImage(searchImage, forState: UIControlState.Normal)
        
        searchButton.addTarget(self, action: "search", forControlEvents: UIControlEvents.TouchUpInside)
        
        var searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
        
    }
    
    func search() {
        
//        let searchContent = SearchViewController()
//        searchContent.hidesBottomBarWhenPushed = true
        self.performSegueWithIdentifier(Constants.ToSearchSegue, sender: self)
    }
    
    
    //MARK: TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "我的"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon4_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon4_pressed")
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
