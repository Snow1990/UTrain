//
//  PopularRecomendTableView.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class PopularRecomendTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var courses = [CourseInfo](){
        didSet {
            self.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)

        initData()
        initTableView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func initData() {
        
        //下载公开课热门搜索课程
        Alamofire.request(.GET, Network.GetHotSearch).responseJSON { (request, _, data, error) -> Void in

            if let json = data as? [NSDictionary] {
                for course in json {
                    let courseInfo = CourseInfo(PopRecomendCoursesJson: course)
                    self.courses.append(courseInfo)
                }
            }
        }
    }
    
    func initTableView() {
        self.backgroundColor = Constants.CellFooterColor

        
        self.dataSource = self
        self.delegate = self
        //注册TableViewCellID
        self.registerClass(PopularRecomendTableViewCell.self, forCellReuseIdentifier: Constants.PopularRecomendReusableCellID)
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.PopularRecomendReusableCellID, forIndexPath: indexPath) as! PopularRecomendTableViewCell
        
        cell.number = indexPath.row + 1
        cell.titleLabel.text = courses[indexPath.row].name
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "热门搜索"
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }

    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
