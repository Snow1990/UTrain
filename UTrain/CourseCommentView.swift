//
//  CourseCommentView.swift
//  UTrain
//
//  Created by SN on 15/7/3.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCommentView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // 评论数量
    var commentCount: Int = 0 {
        didSet {
            commentCountLabel.text = "(\(commentCount)条)"
        }
    }
    // 当前评论按页码分组
    var commentsByPage = [PageInfo]() {
        didSet {
            self.commentTableView.reloadData()
            self.updateView()
        }
    }

    
    var titleLabel = UILabel()
    var commentCountLabel = UILabel()
    var separateView = UIView()
    var loginBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var commentTableView = UITableView()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        // 评论标题
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "评  论"
        titleLabel.font = Constants.Font3
        titleLabel.frame = CGRectMake(
            32 * Constants.Scale,
            22 * Constants.Scale,
            108 * Constants.Scale,
            36 * Constants.Scale)
        self.addSubview(titleLabel)
        
        // 评论数量
        commentCountLabel.backgroundColor = UIColor.clearColor()
        commentCountLabel.font = Constants.Font1
        commentCountLabel.textColor = UIColor.grayColor()
        commentCountLabel.frame = CGRectMake(
            140 * Constants.Scale,
            33 * Constants.Scale,
            200 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(commentCountLabel)
        
        // 标题下的分割线
        separateView.backgroundColor = Constants.SeparateColor
        separateView.frame = CGRectMake(
            32 * Constants.Scale,
            84 * Constants.Scale,
            656 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(separateView)
        
        // 登录按钮
        loginBtn.backgroundColor = Constants.backgroundColor
        loginBtn.setTitle("登录后可发表评论", forState: UIControlState.Normal)
        loginBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        loginBtn.titleLabel?.font = Constants.Font1
        loginBtn.frame = CGRectMake(
            57 * Constants.Scale,
            110 * Constants.Scale,
            605 * Constants.Scale,
            60 * Constants.Scale)
        loginBtn.layer.cornerRadius = 30 * Constants.Scale
        self.addSubview(loginBtn)
        
        // 评论列表
        commentTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        commentTableView.frame = CGRectMake(
            0,
            170 * Constants.Scale,
            Constants.ScreenRect.width,
            200 * Constants.Scale)
        commentTableView.dataSource = self
        commentTableView.delegate = self
        //注册TableViewCellID
        commentTableView.registerClass(CourseCommentTableViewCell.self, forCellReuseIdentifier: Constants.CourseCommentReusableCellID)
        

        self.addSubview(commentTableView)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 更新视图
    func updateView() {
        // 更新评论tableview视图
        commentTableView.frame = CGRectMake(
            commentTableView.frame.origin.x,
            commentTableView.frame.origin.y,
            commentTableView.contentSize.width,
            commentTableView.contentSize.height )
        // 更新评论视图
        self.frame = CGRectMake(
            self.frame.origin.x,
            self.frame.origin.y,
            self.frame.width,
            170 * Constants.Scale + commentTableView.frame.height)
        //        self.backgroundColor = UIColor.redColor()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return commentsByPage.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsByPage[section].currentComments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CourseCommentReusableCellID, forIndexPath: indexPath) as! CourseCommentTableViewCell
        let comment = commentsByPage[indexPath.section].currentComments[indexPath.row]
        
        cell.userName = comment.touristName
        cell.commentTime = comment.time
        cell.content = comment.content
//        cell.title = maxTypeArr[indexPath.row].maxTypeName
        
        return cell
    }
    
    // MARK: - Table view delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let comment = commentsByPage[indexPath.section].currentComments[indexPath.row]
        let size = UILabel.sizeOfString(comment.content,
            font: Constants.Font1,
            maxWidth: 550 * Constants.Scale)
        
        let cellHeight = size.height + 94 * Constants.Scale
        
        return cellHeight
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let footerView = CourseCommentFooter(frame: CGRectMake(0, 0, 0, 0))

        footerView.isLoaded = false
        
        return footerView
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == commentsByPage.count - 1{
            return 74 * Constants.Scale

        }else {
            return 0
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
