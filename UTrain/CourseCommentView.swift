//
//  CourseCommentView.swift
//  UTrain
//
//  Created by SN on 15/7/3.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCommentView: UIView {
    
    // 来源
    var commentCount: Int = 0 {
        didSet {
            commentCountLabel.text = "(\(commentCount)条)"
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
            100 * Constants.Scale,
            40 * Constants.Scale)
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
        commentTableView.backgroundColor = UIColor.redColor()
        commentTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        commentTableView.frame = CGRectMake(
            0,
            170 * Constants.Scale,
            Constants.ScreenRect.width,
            200 * Constants.Scale)
        self.addSubview(commentTableView)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
