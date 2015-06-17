//
//  FirstPageViewController.swift
//  UTrain
//
//  Created by SN on 15/6/12.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class FirstPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

//    
//    var leagueCourses = [String]()  //团（队）务
//    var publicDevelopmentCourses = [String]()  //公益发展
//    var employmentCourses = [String]()  //就业创业
//    var interestCourses = [String]()  //兴趣爱好
//    var activityCourses = [String]()  //课外活动
//    var wholeNationCourses = [String]()  //全国团校精品课程
//    var wangyiOpenCourses = [String]()  //网易公开课
//    var totalCourses = [[String]]()  //所有数据集合,将课程数组按顺序存储
    
    //公开课推荐的banner课程
    var bannerCourses = [CourseInfo]()
    //公开课推荐的body课程
    var bodyCourses = [MaxType]() {
        didSet{
            self.courseCollectionView.reloadData()
        }
    }
    
    //滚动广告页
    var adScrollView = UIScrollView()
    
    @IBOutlet weak var courseCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        
        self.initTabBar()

        self.initCollectionView()
        

       


//        //注册collectionCellID
//        courseCollectionView.registerClass(HomePageCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {

        Alamofire.request(.GET, Constants.GetBannerCourses, parameters: nil).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for course in json {
                    let courseInfo = CourseInfo(bannerCoursesJson: course)
                    self.bannerCourses.append(courseInfo)
                }
            }
        }
        
        Alamofire.request(.GET, Constants.GetBodyCourses, parameters: nil).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for type in json {
                    let maxType = MaxType(BodyCoursesJson: type)
                    self.bodyCourses.append(maxType)
                }
            }
        }
    }
    
    //MARK: TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "首页"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon1_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon1_pressed")
    }
    
    //MARK: Collection View 初始化
    func initCollectionView() {
        
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        
        
        //注册collectionCellID
        courseCollectionView.registerClass(HomePageCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
        //注册广告页CellID
        courseCollectionView.registerClass(HomePageAdCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageAdReusableCellID)
        //注册collection section header ID
        courseCollectionView.registerClass(CourseCollectionHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID)
        //注册collection section footer ID
        courseCollectionView.registerClass(CourseCollectionFooterView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionFooterViewReusableCellID)
    }
    
    
    // MARK: - Collection data sourse
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.bodyCourses.count + 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else {
            return self.bodyCourses[section - 1].maxTypeCourses.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //如果是广告页
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageAdReusableCellID, forIndexPath: indexPath) as! HomePageAdCollectionViewCell
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageReusableCellID, forIndexPath: indexPath) as! HomePageCollectionViewCell
            
            var course = self.bodyCourses[indexPath.section - 1].maxTypeCourses[indexPath.row]
            cell.title.text = course.name
            cell.source = course.sourceName!
            cell.clickCountNum = course.hits!
            cell.setNeedsDisplay()
            return cell
        }
        
    }
    
    // MARK: - Collection delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        //        if indexPath.section == 0 && kind == UICollectionElementKindSectionHeader {
        //            return UICollectionReusableView().prepareForReuse()
        //        }
        var reusableView: UICollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID, forIndexPath: indexPath) as! CourseCollectionHeaderView
//            headerView.lable.text = getCollectionHeaderTitle(indexPath.section)
            headerView.lable.text = self.bodyCourses[indexPath.section - 1].maxTypeName
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
        
        if indexPath.section == 0 {
            return HomePageAdCollectionViewCell.getSize()
        }else {
            return HomePageCollectionViewCell.getSize()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsetsZero
        }else {
            let Rect = UIScreen.mainScreen().bounds
            let Gap: CGFloat = Rect.width/60
            return UIEdgeInsetsMake(0, Gap, 0, Gap)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        //        let collectionViewLayout = courseCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        collectionViewLayout.headerReferenceSize = CGSizeMake(0, 40)
        //        collectionViewLayout.footerReferenceSize = CGSizeMake(0, 10)
        
        if section == 0 {
            return CGSizeMake(0, 0)
        }else {
            return CGSizeMake(0, 40)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSizeMake(0, 10)
    }
    
    
    // MARK: - functions

    func getCollectionHeaderTitle(section: Int) -> String{
        switch section{
        case 0:
            return ""
        case 1:
            return "团（队）务"
        case 2:
            return "公益发展"
        case 3:
            return "创业就业"
        case 4:
            return "兴趣爱好"
        case 5:
            return "课外活动"
        case 6:
            return "全国城市精品"
        case 7:
            return "网易公开课"
        default:
            return ""
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
