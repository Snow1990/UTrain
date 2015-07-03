//
//  RelateRecomendView.swift
//  UTrain
//
//  Created by SN on 15/7/2.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class RelateRecomendView: UIView {

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
        courseScrollView.showsHorizontalScrollIndicator = false
        courseScrollView.showsVerticalScrollIndicator = false
        courseScrollView.pagingEnabled = false
        courseScrollView.frame = CGRectMake(
            0,
            106 * Constants.Scale,
            Constants.ScreenRect.width,
            220 * Constants.Scale)
        self.addSubview(courseScrollView)

//        //创建一个对话框
//        let messageView = MessageView(origin: CGPoint(x: 0, y: scrollView1.contentSize.height), message: message)
//        scrollView1.backgroundColor = UIColor(patternImage: UIImage(named: "chat_bg_default")!)
//        scrollView1.addSubview(messageView)
//        //对话框高度
//        var messageHeight = messageView.bounds.height
//        //增加scrollView高度
//        scrollView1.contentOffset = CGPoint(x: 0, y: scrollView1.contentSize.height)
//        scrollView1.contentSize.height += messageHeight
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var courseInfoArr = [CourseInfo]() {
        didSet {
            setCourseScrollView()
        }
    }
    func setCourseScrollView() {
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
            recomendCourseLabel.frame = CGRectMake(
                32 * Constants.Scale + 244 * Constants.Scale * CGFloat(index),
                150 * Constants.Scale,
                224 * Constants.Scale,
                24 * Constants.Scale)
            courseScrollView.addSubview(recomendCourseLabel)
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
