//
//  OpenCourseViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class OpenCourseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SideMenuTableViewDelegate {

    
    // 大类课程信息字典
    var coursesDictionary = [String: OpenCourseMaxTypeInfo]() {
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
    
    // 当前大类
    var currentMaxType:MaxType? {
        didSet {
            self.courseCollectionView.reloadData()
        }
    }
    
    // 抽屉效果
    var sideMenu: SnowSideMenu?
    var sideMenuViewController = SideMenuTableViewController()

    @IBOutlet weak var courseCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.initData()
//
//        self.loadData()

        self.initTabBar()

        self.initnavigation()
    
        self.initSideMenu()
        
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
    func loadData(maxType: MaxType) {

        // 获取当前大类详细信息，如果没有，新建
        var maxTypeInfo = coursesDictionary[maxType.maxTypeId] ?? OpenCourseMaxTypeInfo()
        // 正在下载中或已下载完成 返回
        if maxTypeInfo.isLoading || maxTypeInfo.isLoaded {
            return
        }
        // 设置正在下载
        maxTypeInfo.isLoading = true
        
        // 网络请求 参数：当前页，大类Id
        Alamofire.request(Network.Router.CourseByType(pageNo: maxTypeInfo.currentPage, maxTypeId: maxType.maxTypeId)).responseJSON { (_, _, data, error) -> Void in

            if error == nil {
                
                if let json = data as? NSDictionary {
                    
                    let pageInfo = PageInfo(pageCoursesJson: json)
                    maxTypeInfo.coursesByPage.append(pageInfo)

                    //下载图片数据
                    for courseInfo in pageInfo.currentCourses {
                        if let path = courseInfo.imagePath {
                            // 图片Dictionary中如果没有数据，则下载图片
                            if self.imageDictionary[path] == nil {
                                Alamofire.request(Network.Router.Image(imagePath: path)).responseImage() {(_, _, image, error) in
                                    if error == nil && image != nil {
                                        self.imageDictionary[path] = image!
                                    }
                                }
                            }
                        }
                    }
                    
                    maxTypeInfo.currentPage++
                    maxTypeInfo.isLoading = false

                    // 课程页码和当前大类课程数量相同，加载完成
                    if pageInfo.pageCount == maxTypeInfo.coursesByPage.count {
                        maxTypeInfo.isLoaded = true
                    }
                    // 将当前大类课程信息写入coursesDictionary
                    self.coursesDictionary[maxType.maxTypeId] = maxTypeInfo

                }
            }
        }
    }
    
    // MARK: - ScrollView delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // 如果scrollView里有数据，并且滚动超过90%
        if scrollView.contentOffset.y + view.frame.size.height >= scrollView.contentSize.height * 0.9 && scrollView.contentSize.height > 0 {
            // 如果当前课程有数据，并且未全部加载完成，记载数据
            if currentMaxType != nil {
                if (!coursesDictionary[currentMaxType!.maxTypeId]!.isLoaded) {
                    loadData(self.currentMaxType!)
                }
            }
        }
    }
    
    // 从网络下载数据
    func initData() {
        
    }
    
    // MARK: - 导航条初始化
    func initnavigation() {
        
        // 左边barbuttonitem
        var leftView = UIView(frame: CGRectMake(0, 0, 75, 20))
        
        var leftImage = UIImage(named: "nav_icon1")!
        var leftButton = UIButton(frame: CGRectMake(0, 0, 20, 20))
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Normal)
        leftButton.setBackgroundImage(leftImage, forState: UIControlState.Highlighted)
        leftButton.addTarget(self, action: "toggle", forControlEvents: UIControlEvents.TouchUpInside)

        // 边栏标题
        var sideMenuLabel = UILabel(frame: CGRectMake(30, 0, 200, 20))
        sideMenuLabel.textColor = UIColor.whiteColor()
        sideMenuLabel.tag = 1
        
        leftView.addSubview(leftButton)
        leftView.addSubview(sideMenuLabel)
        var leftBarButtonItem = UIBarButtonItem(customView: leftView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // 右边barbuttonitem search
        var searchImage = UIImage(named: "nav_icon2")!
        var searchButton = UIButton(frame: CGRectMake(0, 0, 20, 20))
        searchButton.setBackgroundImage(searchImage, forState: UIControlState.Normal)
        
        searchButton.addTarget(self, action: "search", forControlEvents: UIControlEvents.TouchUpInside)
        
        var searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
        

    }
    
    
    // 切换抽屉效果
    func toggle() {
        self.sideMenu?.toggleMenu()
    }
    // 搜索
    func search() {
        // 跳转到搜索页面
        self.performSegueWithIdentifier(Constants.ToSearchSegue, sender: self)
    }
    

    // MARK: - TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "公开课"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon2_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon2_pressed")
    }
    
    // MARK: - SideMenu初始化
    func initSideMenu() {
        sideMenu = SnowSideMenu(sourceView: self.view, menuViewController: sideMenuViewController, menuPosition: .Left)
        sideMenu?.menuWidth = Constants.ScreenRect.width * 0.53
        sideMenuViewController.delegate = self
        
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(self.navigationController!.navigationBar)
    }
    
    
    // MARK: - Collection View 初始化
    func initCollectionView() {
        
        courseCollectionView.backgroundColor = Constants.backgroundColor
        
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        
        
        //注册collectionCellID
        courseCollectionView.registerClass(CourseCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
        
        //注册collectionLoadingCellID
        courseCollectionView.registerClass(LoadingCollectionViewCell.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionLoadingViewReusableCellID)
    }
    
    // MARK: - Collection data sourse
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // 如果当前大类有数据，返回课程页码数量
        if self.currentMaxType != nil {
            if let maxTypeInfo = coursesDictionary[self.currentMaxType!.maxTypeId] {
                return maxTypeInfo.coursesByPage.count
            }
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 如果当前大类有数据，返回课程数量
        if self.currentMaxType != nil {
            if let maxTypeInfo = coursesDictionary[self.currentMaxType!.maxTypeId] {
                return maxTypeInfo.coursesByPage[section].currentCourses.count
            }
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageReusableCellID, forIndexPath: indexPath) as! CourseCollectionViewCell
        
        //获取课程详细信息
        if self.currentMaxType != nil {
            let maxTypeInfo = coursesDictionary[self.currentMaxType!.maxTypeId]!
            var course = maxTypeInfo.coursesByPage[indexPath.section].currentCourses[indexPath.row]
            
            cell.title.text = course.name
            cell.source = course.sourceName!
            cell.clickCountNum = course.hits!
            cell.starNum = Int(course.avgStarScore! + 0.5)
            cell.imageView.image = nil
            if let path = course.imagePath {
                cell.imageView.image = imageDictionary[path]
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            
        let reusableView =  collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: Constants.CollectionLoadingViewReusableCellID, forIndexPath: indexPath) as! LoadingCollectionViewCell
        
        // 向collection footer 传值 ，是否加载完成
        
        if self.currentMaxType != nil {
            let maxTypeInfo = coursesDictionary[self.currentMaxType!.maxTypeId]!
            reusableView.isLoaded = maxTypeInfo.isLoaded
        }

        return reusableView
        
    }
    
    // MARK: - Collection delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // 跳转到课程详情
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)

    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CourseCollectionViewCell.getSize()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
       

        let Gap: CGFloat = 12 * Constants.Scale
        return UIEdgeInsetsMake(Gap, Gap, 0, Gap)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 12 * Constants.Scale
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        // 如果是最后一行，并且有数据，返回Footer Size
        if self.currentMaxType != nil {
            let maxTypeInfo = coursesDictionary[self.currentMaxType!.maxTypeId]!
            if section == maxTypeInfo.coursesByPage.count - 1 {
                return CGSizeMake(0, 40)
            }
        }
        return CGSizeZero

    }
    
    // MARK: - 抽屉效果委托
    // 点击某个大类
    func sideMenu(didSelectMaxType maxType: MaxType) {
        
        // 设置当前大类
        self.currentMaxType = maxType
        // 滚动到CollectionView最顶端 navigation bar 的宽度为64
        self.courseCollectionView.setContentOffset(CGPointMake(0, -64), animated: true)

        // 设置左上角名称
        let leftBarButtonLabel = self.navigationItem.leftBarButtonItem?.customView?.viewWithTag(1) as? UILabel
        leftBarButtonLabel?.text = maxType.maxTypeName
        // 关闭抽屉
        self.sideMenu?.toggleMenu(false)
        
        self.loadData(self.currentMaxType!)

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
