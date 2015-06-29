//
//  SearchViewController.swift
//  UTrain
//
//  Created by SN on 15/6/9.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PopularRecomendDelegate {

    
    // 搜索结果课程列表
    var resultCourses = [CourseInfo]() {
        didSet{
            self.searchResultTableView.reloadData()
        }
    }

    // 图片字典
    var imageDictionary = [String: UIImage]() {
        didSet{
            self.searchResultTableView.reloadData()
        }
    }

    var popRecomendTableView: PopularRecomendTableView!
    var searchToolBar: SnowToolBar!
    var searchResultTableView: UITableView!
    let screenRect : CGRect = UIScreen.mainScreen().bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchToolBar()
        initPopularRecomendTableView()
        initSearchResultTableView()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 初始化
    // 初始化搜索栏
    func initSearchToolBar() {
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
        
    }
    
    // 初始化搜索热门推荐课程
    func initPopularRecomendTableView() {
        
        // 热门推荐课程
        popRecomendTableView = PopularRecomendTableView(frame: CGRectMake(0, 64, screenRect.width, screenRect.height - 64), style: UITableViewStyle.Grouped)
        popRecomendTableView.popularRecomendDelegate = self
        
        self.view.addSubview(popRecomendTableView)
        
    }
    
    // 初始化搜索结果表格
    func initSearchResultTableView() {
        
        // 搜索结果
        searchResultTableView = UITableView(frame: CGRectMake(0, 64, screenRect.width, screenRect.height - 64), style: UITableViewStyle.Plain)
        
        searchResultTableView.backgroundColor = Constants.CellFooterColor
        searchResultTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        // 设置委托
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
      
        //注册TableViewCellID
        searchResultTableView.registerClass(SearchResultTableViewCell.self, forCellReuseIdentifier: Constants.SearchResultReusableCellID)
    }
    
    // 后退
    func dismissClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 搜索
    func searchBtnClicked() {
        if let keyword = self.searchToolBar.viewWithTag(3) as? UITextField {
            if keyword.text != "" {
                self.searchToolBar.textField.resignFirstResponder()

                self.popRecomendTableView.removeFromSuperview()
                self.view.addSubview(searchResultTableView)
                loadSearchData(keyword.text)
            }
        }
    }
    
    // MARK: - 下载搜索结果数据
    func loadSearchData(keyword: String) {
        // 下载搜索结果课程 参数：当前页，大类Id
        Alamofire.request(Network.Router.CourseByKeyword(keyword: keyword)).responseJSON { (_, _, data, error) -> Void in
            
            if error == nil {
                
                if let json = data as? NSDictionary {
                    
                    let pageInfo = PageInfo(pageCoursesJson: json)
                    self.resultCourses = pageInfo.currentCourses
                    
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
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultCourses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SearchResultReusableCellID, forIndexPath: indexPath) as! SearchResultTableViewCell

        //获取课程详细信息
        let course = resultCourses[indexPath.row]
        cell.title.text = course.name
        cell.source = course.sourceName!
        cell.clickCountNum = course.hits!
        cell.starNum = Int(course.avgStarScore! + 0.5)
        if let path = course.imagePath {
            cell.courseImageView.image = imageDictionary[path]
        }
        return cell
    }
    
    // MARK: - Table view delegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return SearchResultTableViewCell.getCellHight()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(Constants.ToCourseDetailSegue, sender: self)
    }
    
    // MARK: - popular recomend table view delegate
    func popularRecomendTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
