//
//  SearchViewController.swift
//  UTrain
//
//  Created by SN on 15/6/9.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    var searchToolBar: SnowToolBar!
    var popRecomendTableView: PopularRecomendTableView?
    var searchResultTableView: UITableView?
    let screenRect : CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        // 搜索输入栏
        searchToolBar = SnowToolBar(frame: CGRectMake(0, 0, screenRect.width, 64))
        if let backBtn = searchToolBar.viewWithTag(1) as? UIButton {
            // 添加后退事件
            backBtn.addTarget(self, action: "dismissClicked", forControlEvents: UIControlEvents.TouchUpInside)
        }
        if let searchBtn = searchToolBar.viewWithTag(2) as? UIButton {
            // 添加搜索事件
            searchBtn.addTarget(self, action: "searchBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        self.view.addSubview(searchToolBar)
        
        // 热门推荐课程
        popRecomendTableView = PopularRecomendTableView(frame: CGRectMake(0, 64, screenRect.width, screenRect.height - 64), style: UITableViewStyle.Grouped)

        self.view.addSubview(popRecomendTableView!)

        
//        self.navigationItem.title = "123"
//        self.hidesBottomBarWhenPushed = true
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 后退
    func dismissClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    // 搜索
    func searchBtnClicked() {
        if let keyword = self.searchToolBar.viewWithTag(3) as? UITextField {
            if keyword.text != "" {
                self.popRecomendTableView?.removeFromSuperview()
                
                // 搜索结果
                searchResultTableView = UITableView(frame: CGRectMake(0, 64, screenRect.width, screenRect.height - 64), style: UITableViewStyle.Grouped)

            }
        }
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
