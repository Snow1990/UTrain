//
//  CourseIntroduceView.swift
//  UTrain
//
//  Created by SN on 15/7/2.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseIntroduceView: UIView {

    // 来源
    var source: String = "" {
        didSet {
            sourceLabel.text = "来源：" + source
        }
    }
    
    // 简介
    var introduce: String = "" {
        didSet {
            introduceLabel.text = "课程简介：" + introduce
            self.reloadView()
        }
    }
    
    // 讲师
    var lecture: String = "" {
        didSet {
            lectureLabel.text = "讲师：" + lecture
        }
    }
    
    
    var titleLabel = UILabel()
    var storeBtn = UIButton()
    var shareBtn = UIButton()
    var titleSeparateView = UIView()
    var sourceLabel = UILabel()
    var introduceLabel = UILabel()
    var introduceSeparateView = UIImageView()
    var lectureLabel = UILabel()
    var lectureBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        // 简介标题
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "简  介"
        titleLabel.font = Constants.Font3
        titleLabel.frame = CGRectMake(
            32 * Constants.Scale,
            22 * Constants.Scale,
            200 * Constants.Scale,
            40 * Constants.Scale)
        self.addSubview(titleLabel)
        
        // 收藏按钮
        storeBtn.backgroundColor = UIColor.clearColor()
        storeBtn.setBackgroundImage(UIImage(named: "details_collect")!, forState: UIControlState.Normal)
        storeBtn.frame = CGRectMake(
            547 * Constants.Scale,
            18 * Constants.Scale,
            44 * Constants.Scale,
            44 * Constants.Scale)
        self.addSubview(storeBtn)
        
        // 分享按钮
        shareBtn.backgroundColor = UIColor.clearColor()
        shareBtn.setBackgroundImage(UIImage(named: "details_share_normal")!, forState: UIControlState.Normal)
        shareBtn.frame = CGRectMake(
            647 * Constants.Scale,
            18 * Constants.Scale,
            44 * Constants.Scale,
            44 * Constants.Scale)
        self.addSubview(shareBtn)
        
        // 标题下的分割线
        titleSeparateView.backgroundColor = Constants.SeparateColor
        titleSeparateView.frame = CGRectMake(
            32 * Constants.Scale,
            84 * Constants.Scale,
            656 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(titleSeparateView)
        
        // 来源
        sourceLabel.backgroundColor = UIColor.clearColor()
        sourceLabel.font = Constants.Font1
        sourceLabel.frame = CGRectMake(
            32 * Constants.Scale,
            106 * Constants.Scale,
            400 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(sourceLabel)
        
        // 简介
        introduceLabel.backgroundColor = UIColor.clearColor()
        introduceLabel.numberOfLines = 0
        introduceLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        introduceLabel.font = Constants.Font2
        introduceLabel.frame = CGRectMake(
            32 * Constants.Scale,
            145 * Constants.Scale,
            656 * Constants.Scale,
            28 * Constants.Scale)
        self.addSubview(introduceLabel)
        
        // 简介下的分割线
        introduceSeparateView.backgroundColor = Constants.SeparateColor
        introduceSeparateView.frame = CGRectMake(
            32 * Constants.Scale,
            introduceLabel.frame.maxY + 20 * Constants.Scale,
            656 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(introduceSeparateView)
        
        // 讲师
        lectureLabel.backgroundColor = UIColor.clearColor()
        lectureLabel.font = Constants.Font1
        lectureLabel.frame = CGRectMake(
            32 * Constants.Scale,
            introduceSeparateView.frame.maxY + 24 * Constants.Scale,
            300 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(lectureLabel)
        
        // 讲师按钮
        lectureBtn.backgroundColor = UIColor.clearColor()
        lectureBtn.setBackgroundImage(UIImage(named: "details_back")!, forState: UIControlState.Normal)
        lectureBtn.frame = CGRectMake(
            675 * Constants.Scale,
            introduceSeparateView.frame.maxY + 24 * Constants.Scale,
            13 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(lectureBtn)
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func reloadView() {
        let size = UILabel.sizeOfString(introduceLabel.text!, font: Constants.Font2, maxWidth: 656 * Constants.Scale)
        introduceLabel.frame = CGRectMake(
            32 * Constants.Scale,
            145 * Constants.Scale,
            size.width,
            size.height)
        
        introduceSeparateView.frame = CGRectMake(
            32 * Constants.Scale,
            introduceLabel.frame.maxY + 20 * Constants.Scale,
            656 * Constants.Scale,
            1 * Constants.Scale)
        
        lectureLabel.frame = CGRectMake(
            32 * Constants.Scale,
            introduceSeparateView.frame.maxY + 24 * Constants.Scale,
            300 * Constants.Scale,
            24 * Constants.Scale)
        
        lectureBtn.frame = CGRectMake(
            675 * Constants.Scale,
            introduceSeparateView.frame.maxY + 24 * Constants.Scale,
            13 * Constants.Scale,
            24 * Constants.Scale)
        
        self.frame = CGRectMake(
            self.frame.origin.x,
            self.frame.origin.y,
            self.frame.width,
            lectureLabel.frame.maxY + 22 * Constants.Scale)
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
