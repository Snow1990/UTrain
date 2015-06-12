//
//  HomePageViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    
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
        self.initCollectionView()

        initView()
        initScrollView()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func initData() {
        
    }
    
    //MARK: TabBar初始化
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
        
        
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "首页"
        self.navigationController?.tabBarItem.image = UIImage(named: "mu_reco_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "mu_reco_pressed")
//        self.navigationController?.tabBarItem.badgeValue = "5"

        
    }
    //MARK: 导航条初始化
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
    //Collection View 初始化
    func initCollectionView() {
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
//                let imageView = UIImageView(image: UIImage(named: "tab_line")!)
//                imageView.frame = CGRectMake(0, 64, 320, 2)
//                self.view.addSubview(imageView)
        
        courseCollectionView.registerClass(HomePageCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
        courseCollectionView.registerClass(CourseCollectionHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID)
        courseCollectionView.registerClass(CourseCollectionFooterView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionFooterViewReusableCellID)
        
        let collectionViewLayout = courseCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewLayout.headerReferenceSize = CGSizeMake(0, 40)
        collectionViewLayout.footerReferenceSize = CGSizeMake(0, 10)
    }
    
    //搜索
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
        
//        let backgroundLable = UILabel(frame: UIScreen.mainScreen().bounds)
//        backgroundLable.backgroundColor = UIColor.yellowColor()
//        backgroundLable.alpha = 0.1
//        self.courseCollectionView.addSubview(backgroundLable)
        
        
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
        return 2
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//         return totalCourses[section].count
        return 4
    }
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageReusableCellID, forIndexPath: indexPath) as! HomePageCollectionViewCell
//        cell.frame = CGRectMake(10, 10, 200, 200)
        println(cell.frame)
        return cell
    }
    
    // MARK: - Collection delegate

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)

        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID, forIndexPath: indexPath) as! CourseCollectionHeaderView
            reusableView = headerView
            
            reusableView!.backgroundColor = UIColor.clearColor()
            
            
        }else {
            let footView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionFooterViewReusableCellID, forIndexPath: indexPath) as! CourseCollectionFooterView
            reusableView = footView
            reusableView!.backgroundColor = Constants.CellFooterColor
            
        }
        
        
        
        return reusableView!
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let rect = UIScreen.mainScreen().bounds
//        println(rect)
//        println(CGSizeMake((rect.width-30)/2, 300))
//        return CGSizeMake((rect.width-30)/2, 150)
        return HomePageCollectionViewCell.getSize()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 5, 0, 5)

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
