//
//  OpenCourseViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class OpenCourseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    // 大类
    var maxTypeArr = [MaxType](){
        didSet {
            self.sideMenuViewController.tableView.reloadData()
        }
    }
    
    // 当前课程按页码分组
    var coursesByPage = [PageInfo](){
        didSet {
            self.courseCollectionView.reloadData()
        }
    }
    
    // 图片字典
    var imageDictionary = [String: UIImage]() {
        didSet {
            self.courseCollectionView.reloadData()
        }
    }
    
    // 当前大类ID
    var currentMaxTypeId = ""
    // 当前页码
    var currentPage = 1
    // 是否正在下载数据
    var isLoading = false
    var isLoaded = false
    
    // 抽屉效果
    var sideMenu: SnowSideMenu?
    var sideMenuViewController = UITableViewController()

    
    @IBOutlet weak var courseCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
//
//        self.loadData()

        self.initTabBar()

        self.initnavigation()
    
        self.initSideMenu()
        
        self.initTableView()
        
        self.initCollectionView()
        
        
//        let refreshControl = UIRefreshControl()
//        refreshControl.frame = CGRectMake(0, 540, 600, 60)
//
//        courseCollectionView.addSubview(refreshControl)
//        println(refreshControl.frame)
//        println(courseCollectionView.frame)
        
//        let label = UILabel(frame: CGRectMake(0, 491, 600, 60))
//        label.backgroundColor = UIColor.redColor()
//
//        courseCollectionView.addSubview(label)
        
//        loadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 下载数据
    func loadData() {
        
        if isLoading {
            return
        }
        isLoading = true
        
//        Alamofire.request(Network.Router.CourseByPage(pageNo: self.currentPage, pageSize: 10)).responseJSON { (_, _, data, error) -> Void in
        
        Alamofire.request(Network.Router.CourseByType(pageNo: self.currentPage, maxTypeId: self.currentMaxTypeId)).responseJSON { (_, _, data, error) -> Void in
            
            if error == nil {
                
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
                    self.currentPage++
                    self.isLoading = false

                    if pageInfo.pageCount == self.coursesByPage.count {
                        self.isLoaded = true
                    }
                }
            }
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y + view.frame.size.height >= scrollView.contentSize.height {
            if !self.isLoaded {
                loadData()
            }
        }
    }
    
    // 从网络下载数据
    func initData() {
        
        Alamofire.request(.GET, Network.GetPublicMaxType).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for type in json {
                    let maxType = MaxType(maxType: type)
                    self.maxTypeArr.append(maxType)
                    
                }
                if !self.maxTypeArr.isEmpty {
                    self.currentMaxTypeId = self.maxTypeArr[0].maxTypeId
                    self.loadData()
                }
            }
        }
        
        

    }
    // MARK: 导航条布局
    func initnavigation() {
        
        //左边barbuttonitem
        var leftView = UIView(frame: CGRectMake(0, 0, 75, 25))
        
        var leftImage = UIImage(named: "nav_icon1")!
        var leftButton = UIButton(frame: CGRectMake(0, 0, 25, 25))
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
        
        leftButton.addTarget(self, action: "toggle", forControlEvents: UIControlEvents.TouchUpInside)
        
        var sideMenuLabel = UILabel(frame: CGRectMake(30, 0, 50, 25))
        sideMenuLabel.textColor = UIColor.whiteColor()
        sideMenuLabel.text = "1234"
        leftView.addSubview(leftButton)
        leftView.addSubview(sideMenuLabel)
        
        var leftBarButtonItem = UIBarButtonItem(customView: leftView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        //又边barbuttonitem search
        var searchImage = UIImage(named: "nav_icon2")!
        var searchButton = UIButton(frame: CGRectMake(0, 0, 25, 25))
        searchButton.setBackgroundImage(searchImage, forState: UIControlState.Normal)
        
        searchButton.addTarget(self, action: "search", forControlEvents: UIControlEvents.TouchUpInside)
        
        var searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
        
    }
    
    
    // 切换抽屉效果
    func toggle() {
        self.sideMenu?.toggleMenu()
//        if let OpenCourseNavCon = self.parentViewController as? OpenCourseNavigationController {
//            OpenCourseNavCon.sideMenu?.toggleMenu()
//        }
    }
    // 搜索
    func search() {
        
//        let searchContent = SearchViewController()
//        searchContent.hidesBottomBarWhenPushed = true

        self.performSegueWithIdentifier(Constants.ToSearchSegue, sender: self)
    }
    

    // MARK: TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "公开课"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon2_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon2_pressed")
    }
    
    // MARK: SideMenu初始化
    func initSideMenu() {
        sideMenu = SnowSideMenu(sourceView: self.view, menuViewController: sideMenuViewController, menuPosition:.Left)
        
        sideMenuViewController.tableView.delegate = self
        sideMenuViewController.tableView.dataSource = self
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(self.navigationController!.navigationBar)
    }
    
    // MARK: Table View 初始化
    func initTableView() {
        // Customize apperance of table view
        sideMenuViewController.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        sideMenuViewController.tableView.separatorStyle = .None
        sideMenuViewController.tableView.backgroundColor = Constants.SideMenuBGColor
        sideMenuViewController.tableView.scrollsToTop = false
        sideMenuViewController.tableView.scrollEnabled = false
        
        // Preserve selection between presentations
        sideMenuViewController.clearsSelectionOnViewWillAppear = false
        
        
        
        //注册TableViewCellID
        sideMenuViewController.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: Constants.SideMenuReusableCellID)
        

    }
    // MARK: Collection View 初始化
    func initCollectionView() {
        
        courseCollectionView.backgroundColor = Constants.OpenCourseBGColor
        
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        
        
        //注册collectionCellID
        courseCollectionView.registerClass(CourseCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
        
        //注册collectionLoadingCellID
        courseCollectionView.registerClass(LoadingCollectionViewCell.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionLoadingViewReusableCellID)
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
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            
        let reusableView =  collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: Constants.CollectionLoadingViewReusableCellID, forIndexPath: indexPath) as! LoadingCollectionViewCell
        reusableView.isLoaded = self.isLoaded
        return reusableView
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CourseCollectionViewCell.getSize()
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
       
        let Rect = UIScreen.mainScreen().bounds
        let Gap: CGFloat = Rect.width/60
        return UIEdgeInsetsMake(Gap, Gap, 0, Gap)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return UIScreen.mainScreen().bounds.width/60
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == coursesByPage.count - 1 {
            return CGSizeMake(0, 40)
        } else {
            return CGSizeZero
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maxTypeArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SideMenuReusableCellID, forIndexPath: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = maxTypeArr[indexPath.row].maxTypeName
        cell.textLabel?.textColor = UIColor.whiteColor()
        //        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    // MARK: - table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.yellowColor()
//        println(indexPath.row )
        self.currentMaxTypeId = maxTypeArr[indexPath.row].maxTypeId
        self.currentPage = 1
        self.coursesByPage = []
        self.isLoaded = false
//        self.navigationItem.leftBarButtonItem?.customView?.viewWithTag(<#tag: Int#>)
        self.toggle()
        self.loadData()

    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.whiteColor()
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
