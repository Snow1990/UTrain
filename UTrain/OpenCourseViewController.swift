//
//  OpenCourseViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class OpenCourseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    //当前课程按页码分组
    var coursesByPage = [PageInfo](){
        didSet{
            self.courseCollectionView.reloadData()
        }
    }
    
    //图片字典
    var imageDictionary = [String: UIImage]() {
        didSet{
            self.courseCollectionView.reloadData()
        }
    }
    
    
    @IBOutlet weak var courseCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initData()

        self.initTabBar()

        self.initnavigation()
    
        self.initCollectionView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //从网络下载数据
    func initData() {
        
        Alamofire.request(Network.Router.CourseByPage(pageNo: 1, pageSize: 10)).responseJSON { (request, _, data, error) -> Void in
            
            if let json = data as? NSDictionary {

                let pageInfo = PageInfo(pageCoursesJson: json)
                self.coursesByPage.append(pageInfo)
                
                //下载图片数据
                for courseInfo in pageInfo.currentCourses {
                    if let path = courseInfo.imagePath {
                        Alamofire.request(Network.Router.Image(imagePath: path)).responseImage() {(_, _, image, error) in
                            if error == nil && image != nil {
                                self.imageDictionary[courseInfo.imagePath!] = image!
                            }
                        }
                    }
                }
            }
        }
    }
    //MARK: 导航条布局
    func initnavigation() {
        
        //左边barbuttonitem
        var leftImage = UIImage(named: "nav_icon1")!
        var leftButton = UIButton(frame: CGRectMake(0, 0, 25, 25))
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
        var leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        //又边barbuttonitem search
        var searchImage = UIImage(named: "nav_icon2")!
        var searchButton = UIButton(frame: CGRectMake(0, 0, 25, 25))
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
        self.navigationController?.tabBarItem.title = "公开课"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon2_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon2_pressed")
    }
    
    //MARK: Collection View 初始化
    func initCollectionView() {
        
        courseCollectionView.backgroundColor = Constants.OpenCourseBGColor
        
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        
        
        //注册collectionCellID
        courseCollectionView.registerClass(CourseCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
    }
    
    // MARK: - Collection data sourse
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.coursesByPage.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.coursesByPage[section].currentCourses.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageReusableCellID, forIndexPath: indexPath) as! CourseCollectionViewCell
        

        //获取课程详细信息
        var course = self.coursesByPage[indexPath.section].currentCourses[indexPath.row]

        cell.title.text = course.name
        cell.source = course.sourceName!
        cell.clickCountNum = course.hits!
        cell.starNum = Int(course.avgStarScore! + 0.5)
        cell.imageView.image = nil
        if let path = course.imagePath {
            cell.imageView.image = imageDictionary[path]
        }
        

        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CourseCollectionViewCell.getSize()
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
       
        let Rect = UIScreen.mainScreen().bounds
        let Gap: CGFloat = Rect.width/60
        return UIEdgeInsetsMake(Gap, Gap, Gap, Gap)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return UIScreen.mainScreen().bounds.width/60
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
