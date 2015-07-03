//
//  RelateRecomendView.swift
//  UTrain
//
//  Created by SN on 15/7/2.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class RelateRecomendView: UIView {

    // 课程信息列表
    var courseInfoArr = [CourseInfo]() {
        didSet {
            setCourseScrollView()
            self.reloadView()
        }
    }
    
    var titleLabel = UILabel()
    var separateView = UIView()
    var courseScrollView = UIScrollView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        // 简介标题
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "相关推荐"
        titleLabel.font = Constants.Font3
        titleLabel.frame = CGRectMake(
            32 * Constants.Scale,
            22 * Constants.Scale,
            200 * Constants.Scale,
            40 * Constants.Scale)
        self.addSubview(titleLabel)
        
        // 标题下的分割线
        separateView.backgroundColor = Constants.SeparateColor
        separateView.frame = CGRectMake(
            32 * Constants.Scale,
            84 * Constants.Scale,
            656 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(separateView)
        
        // 课程滚动视图
        courseScrollView.backgroundColor = UIColor.clearColor()
        courseScrollView.showsHorizontalScrollIndicator = true
        courseScrollView.showsVerticalScrollIndicator = false
        courseScrollView.frame = CGRectMake(
            0,
            106 * Constants.Scale,
            Constants.ScreenRect.width,
            220 * Constants.Scale)
        courseScrollView.contentSize = CGSize(
            width: Constants.ScreenRect.width * 2,
            height: courseScrollView.frame.height)
        self.addSubview(courseScrollView)
        
    }


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCourseScrollView() {
        // 清空子视图
        for subView in courseScrollView.subviews{
            subView.removeFromSuperview()
        }
        // 添加课程视图
        for (index,course) in enumerate(courseInfoArr) {
            var imageView = UIImageView()
            imageView.frame = CGRectMake(
                32 * Constants.Scale + 244 * Constants.Scale * CGFloat(index),
                0,
                224 * Constants.Scale,
                140 * Constants.Scale)
            imageView.backgroundColor = UIColor.brownColor()
            courseScrollView.addSubview(imageView)
            
            var recomendCourseLabel = UILabel()
            recomendCourseLabel.backgroundColor = UIColor.clearColor()
            recomendCourseLabel.text = course.name
            recomendCourseLabel.font = Constants.Font1
            recomendCourseLabel.numberOfLines = 0
            recomendCourseLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
            let labelSize = UILabel.sizeOfString(recomendCourseLabel.text!, font: recomendCourseLabel.font, maxWidth: 224 * Constants.Scale)
            recomendCourseLabel.frame = CGRectMake(
                32 * Constants.Scale + 244 * Constants.Scale * CGFloat(index),
                150 * Constants.Scale,
                labelSize.width,
                labelSize.height)
            courseScrollView.addSubview(recomendCourseLabel)
        }
    }
    
    // 内容改变后更新滚动视图
    func reloadView() {
        courseScrollView.contentSize = CGSize(
            width: 32 * Constants.Scale + 244 * Constants.Scale * CGFloat(courseInfoArr.count),
            height: courseScrollView.contentSize.height)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
