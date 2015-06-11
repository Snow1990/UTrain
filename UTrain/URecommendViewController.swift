//
//  URecommendViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class URecommendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    
//    var currentPage: Int = 0
//    var reloadFlag: Int = 7
    
    var leagueCourses = [String]()  //团（队）务
    var publicDevelopmentCourses = [String]()  //公益发展
    var employmentCourses = [String]()  //就业创业
    var interestCourses = [String]()  //兴趣爱好
    var activityCourses = [String]()  //课外活动
    var wholeNationCourses = [String]()  //全国团校精品课程
    var wangyiOpenCourses = [String]()  //网易公开课
    var totalCourses = [[String]]()  //所有数据集合,将课程数组按顺序存储

    //滚动广告页
    var adScrollView = UIScrollView()
    
    
    //课程Collection
    @IBOutlet weak var courseCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initData()

        self.initTabBar()
        self.initNavigation()

        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
//        let imageView = UIImageView(image: UIImage(named: "tab_line")!)
//        imageView.frame = CGRectMake(0, 64, 320, 2)
//        self.view.addSubview(imageView)
        
        courseCollectionView.registerClass(URecommendCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.URecommendReusableCellID)
        
        


        initView()
        initScrollView()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func initData() {
        
    }
    
    //MARK: TabBar布局
    func initTabBar() {
        
//        self.navigationController?.tabBarController.set
        
//        var recommendImage = UIImage(named: "mu_myclass_normal")!
//        //        var leftButton = UIButton(frame: CGRectMake(0, 0, 85, 30))
//        var leftButton = UIButton(frame: CGRectMake(0, 0, 68, 24))
//        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
//        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
//        var leftBarButtonItem = UIBarButtonItem(customView: leftButton)
//        
//        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
//        self.navigationController?.tabBarItem.

        self.navigationController?.tabBarItem.title = "U推荐"
        self.navigationController?.tabBarItem.image = UIImage(named: "mu_myclass_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "mu_myclass_pressed")
        self.navigationController?.tabBarItem.badgeValue = "5"

        
//        
//        self.tabBarItem.title=@"Web Chat";//注意如果这个标题不设置默认在页签上显示视图控制器标题
//        self.tabBarItem.image=[UIImage imageNamed:@"tabbar_mainframe.png"];//默认图片
//        self.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_mainframeHL.png"];//选中图片
        
    }
    //MARK: 导航条布局
    func initNavigation() {
        
        //左边barbuttonitem
        var leftImage = UIImage(named: "home_logo")!
//        var leftButton = UIButton(frame: CGRectMake(0, 0, 85, 30))
        var leftButton = UIButton(frame: CGRectMake(0, 0, 68, 24))
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
        var leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        //又边barbuttonitem search
        var searchImage = UIImage(named: "btn_search")!
//        var searchButton = UIButton(frame: CGRectMake(0, 0, 50, 30))

        var searchButton = UIButton(frame: CGRectMake(50, 0, 30, 18))

        searchButton.setBackgroundImage(searchImage, forState: UIControlState.Normal)
        
        searchButton.addTarget(self, action: "search", forControlEvents: UIControlEvents.TouchUpInside)

        var searchBarButtonItem = UIBarButtonItem(customView: searchButton)
//        self.navigationItem.rightBarButtonItem = searchBarButtonItem
        self.navigationItem.setRightBarButtonItem(searchBarButtonItem, animated: true)
    }

    func search() {
        
//        let searchContent = SearchViewController()
//        searchContent.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(searchContent, animated: false)
        self.performSegueWithIdentifier(Constants.ToSearchSegue, sender: self)
        
        
//        SearchViewController*searchcontent = [[SearchViewController alloc]init];
//        searchcontent.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:searchcontent animated:YES];

        
    }
    
    func initView() {
        
        let backgroundLable = UILabel(frame: UIScreen.mainScreen().bounds)
        backgroundLable.backgroundColor = UIColor.yellowColor()
        backgroundLable.alpha = 0.1
        self.courseCollectionView.addSubview(backgroundLable)
        
        
//        self.courseCollectionView.backgroundColor = UIColor.grayColor()
//        self.courseCollectionView.alpha = 0.1
        
//        UILabel*labelback = [[UILabel alloc]init];
//        labelback.backgroundColor = [UIColor grayColor];
//        labelback.alpha = 0.1;
//        labelback.frame = CGRectMake(0, 0, 320, iPhoneHeight);
//        [self.view addSubview:labelback];
    }
    
    func initScrollView() {
        
    }
    
    
    
    // MARK: - Collection data sourse
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//         return totalCourses[section].count
        return 6
    }
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.URecommendReusableCellID, forIndexPath: indexPath) as! URecommendCollectionViewCell
//        cell.frame = CGRectMake(10, 10, 200, 200)
        return cell
    }
    
    // MARK: - Collection delegate

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)
        
        
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
