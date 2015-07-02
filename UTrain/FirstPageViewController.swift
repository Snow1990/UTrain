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

    //公开课推荐的banner课程
    var bannerCourses = [CourseInfo](){
        didSet{
            self.courseCollectionView.reloadData()
        }
    }
    
    //公开课推荐的body课程
    var bodyCourses = [MaxType]() {
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
    //滚动图片
    var adImageArr = [UIImage]() {
        didSet{
            self.courseCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var courseCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        
        self.initTabBar()

        self.initCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 从网络下载数据
    func initData() {

        //下载广告页数据
        Alamofire.request(.GET, Network.GetBannerCourses).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for course in json {
                    let courseInfo = CourseInfo(bannerCoursesJson: course)
                    self.bannerCourses.append(courseInfo)
                    
                    //下载图片数据
                    Alamofire.request(Network.Router.Image(imagePath: courseInfo.imagePath!)).responseImage() {(_, _, image, error) in
                        if error == nil && image != nil {
                            self.adImageArr.append(image!)
                        }
                    }
                }
            }
        }
        
        //下载Collection里的数据
        Alamofire.request(.GET, Network.GetBodyCourses).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for type in json {
                    let maxType = MaxType(bodyCoursesJson: type)
                    self.bodyCourses.append(maxType)
                    
                    //下载图片数据
                    for courseInfo in maxType.maxTypeCourses {
                        Alamofire.request(Network.Router.Image(imagePath: courseInfo.imagePath!)).responseImage() {(_, _, image, error) in
                            if error == nil && image != nil {
                                self.imageDictionary[courseInfo.imagePath!] = image!
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "首页"
        self.navigationController?.tabBarItem.image = UIImage(named: "table_icon1_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "table_icon1_pressed")
    }
    
    // MARK: - Collection View 初始化
    func initCollectionView() {

        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        
        //注册collectionCellID
        courseCollectionView.registerClass(CourseCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageReusableCellID)
        //注册广告页CellID
        courseCollectionView.registerClass(CourseAdCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: Constants.HomePageAdReusableCellID)
        //注册collection section header ID
        courseCollectionView.registerClass(CourseCollectionHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID)
        //注册collection section footer ID
        courseCollectionView.registerClass(CourseCollectionFooter.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionFooterViewReusableCellID)
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
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageAdReusableCellID, forIndexPath: indexPath) as! CourseAdCollectionViewCell

            cell.scrollView.imageNameArray = self.adImageArr

            return cell
        }else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.HomePageReusableCellID, forIndexPath: indexPath) as! CourseCollectionViewCell
            
            //获取课程详细信息
            var course = self.bodyCourses[indexPath.section - 1].maxTypeCourses[indexPath.row]
            cell.title.text = course.name
            cell.source = course.sourceName!
            cell.clickCountNum = course.hits!
            cell.starNum = Int(course.avgStarScore! + 0.5)
            if let path = course.imagePath {
                cell.imageView.image = imageDictionary[path]
            }

            return cell
        }
        
    }
    
    // MARK: - Collection delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView?

        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Constants.CollectionHeaderViewReusableCellID, forIndexPath: indexPath) as! CourseCollectionHeader

            headerView.lable.text = self.bodyCourses[indexPath.section - 1].maxTypeName
            reusableView = headerView
            
            reusableView!.backgroundColor = UIColor.clearColor()
            
            
        }else {
            let footView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: Constants.CollectionFooterViewReusableCellID, forIndexPath: indexPath) as! CourseCollectionFooter
            reusableView = footView
            reusableView!.backgroundColor = Constants.backgroundColor
            
        }
        return reusableView!
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CourseAdCollectionViewCell.getSize()
        }else {
            return CourseCollectionViewCell.getSize()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsetsZero
        }else {

            let Gap: CGFloat = 12 * Constants.Scale
            return UIEdgeInsetsMake(0, Gap, 0, Gap)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeZero
        }else {
            return CGSizeMake(0, 40)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSizeMake(0, 10)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    
}
