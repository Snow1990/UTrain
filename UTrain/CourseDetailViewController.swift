//
//  CourseDetailViewController.swift
//  UTrain
//
//  Created by SN on 15/6/10.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {

    
    var scrollView: UIScrollView!
    var coursePlayerView: UIView!
    var coursePlayerFooter: UIView!
    var introduceView: CourseIntroduceView!
    var introduceFooter: UIView!
    var relateRecomendView: RelateRecomendView!
    var relateRecomendFooter: UIView!
    var commentView: CourseCommentView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.blackColor()

        // 添加滚动视图
        scrollView = UIScrollView(frame: CGRectMake(
            0,
            0,
            Constants.ScreenRect.width,
            Constants.ScreenRect.height))
        scrollView.backgroundColor = Constants.backgroundColor
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.bounces = false
        // 内容size不确定
        scrollView.contentSize = CGSize(
            width: Constants.ScreenRect.width,
            height: Constants.ScreenRect.height * 2)
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        scrollView.backgroundColor = UIColor.blackColor()
        view.addSubview(scrollView)

        // 添加播放视频视图
        coursePlayerView = UIView(frame: CGRectMake(
            0,
            0,
            Constants.ScreenRect.width,
            406 * Constants.Scale))
        coursePlayerView.backgroundColor = UIColor.grayColor()
        scrollView.addSubview(coursePlayerView)


        // 添加播放视频视图Footer
        coursePlayerFooter = UIView(frame: CGRectMake(
            0,
            406 * Constants.Scale,
            Constants.ScreenRect.width,
            13 * Constants.Scale))
        coursePlayerFooter.backgroundColor = Constants.backgroundColor
        scrollView.addSubview(coursePlayerFooter)

        // 添加简介视图
        introduceView = CourseIntroduceView(frame: CGRectMake(
            0,
            coursePlayerFooter.frame.maxY,
            Constants.ScreenRect.width,
            444 * Constants.Scale))
        introduceView.source = "广州团校"
        introduceView.introduce = "此处未测试文本1。此处未测试文本2。此处未测试文本3。此处未测试文本。此处未测试文本。此处未测试文本。此处未测试文本。此处未测试文本7。此处未测试文本8。此处未测试文本9。"
        introduceView.lecture = "朱韧"
        scrollView.addSubview(introduceView)
        
        // 添加简介视图Footer
        introduceFooter = UIView(frame: CGRectMake(
            0,
            introduceView.frame.maxY,
            Constants.ScreenRect.width,
            13 * Constants.Scale))
        introduceFooter.backgroundColor = Constants.backgroundColor
        scrollView.addSubview(introduceFooter)
        
        // 添加相关推荐视图
        relateRecomendView = RelateRecomendView(frame: CGRectMake(
            0,
            introduceFooter.frame.maxY,
            Constants.ScreenRect.width,
            344 * Constants.Scale))
        let course1 = CourseInfo(id: "123", name: "测试专用测试专用")
        let course2 = CourseInfo(id: "123", name: "测试专用测试专用测试专用测试专用")
        relateRecomendView.courseInfoArr.append(course1)
        relateRecomendView.courseInfoArr.append(course2)
        relateRecomendView.courseInfoArr.append(course1)
        relateRecomendView.courseInfoArr.append(course2)
        scrollView.addSubview(relateRecomendView)
        
        // 添加相关推荐视图Footer
        relateRecomendFooter = UIView(frame: CGRectMake(
            0,
            relateRecomendView.frame.maxY,
            Constants.ScreenRect.width,
            13 * Constants.Scale))
        relateRecomendFooter.backgroundColor = Constants.backgroundColor
        scrollView.addSubview(relateRecomendFooter)
        
        // 添加评论视图
        commentView = CourseCommentView(frame: CGRectMake(
            0,
            relateRecomendFooter.frame.maxY,
            Constants.ScreenRect.width,
            500 * Constants.Scale))
        commentView.commentCount = 243
        var testComment = PageInfo()
        commentView.commentsByPage.append(testComment)
        commentView.commentsByPage.append(testComment)

        scrollView.addSubview(commentView)

        // 更新滚动视图内容
        scrollView.contentSize = CGSize(
            width: Constants.ScreenRect.width,
            height: commentView.frame.maxY)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)

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
