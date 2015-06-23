//
//  AdScrollView.swift
//  UTrain
//
//  Created by SN on 15/6/15.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

enum UIPageControlShowStyle {
    case Default
    case Left
    case Center
    case Right
}


class AdScrollView: UIScrollView, UIScrollViewDelegate {

    //MARK: - 定义参数
    //广告的label
    var adLable: UILabel?
    //循环滚动的三个视图
    var leftImageView = UIImageView()
    var centerImageView = UIImageView()
    var rightImageView = UIImageView()
    //循环滚动的周期时间
    var moveTime = NSTimer()
    var pageControlShowStyle = UIPageControlShowStyle.Center
    var pageControl = UIPageControl()
    var imageNameArray = [UIImage](){
        didSet {
            pageControl.numberOfPages = imageNameArray.count
        }
    }
    //记录中间图片的下标
    var currentImageNum = 1
    let ChangeImageTime = 2.0
    
    //MARK: - 初始化，指定广告所占的frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.bounces = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.pagingEnabled = true

        self.contentOffset = CGPointMake(frame.width, 0)
        self.contentSize = CGSizeMake(frame.width * 3, frame.height)
        self.delegate = self

        leftImageView.frame = CGRectMake(0, 0, frame.width, frame.height)
        self.addSubview(leftImageView)
        centerImageView.frame = CGRectMake(frame.width, 0, frame.width, frame.height)
        self.addSubview(centerImageView)
        rightImageView.frame = CGRectMake(frame.width * 2, 0, frame.width, frame.height)
        self.addSubview(rightImageView)
        
        moveTime = NSTimer.scheduledTimerWithTimeInterval(ChangeImageTime, target: self, selector: "animalMoveImage", userInfo: nil, repeats: true)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - 设置广告所使用的图片(名字)
    func setImageName(imageNameArray: [UIImage]) {
        self.imageNameArray = imageNameArray
    }

    //MARK: - 创建pageControl,指定其显示样式
    func setPageControlShowStyle() {
        pageControl.numberOfPages = imageNameArray.count
        switch self.pageControlShowStyle {
        case .Default:
            pageControl = UIPageControl()
        case .Left:
            pageControl.frame = CGRectMake(10.0, self.frame.origin.y + self.frame.height - 20, 20 * CGFloat(pageControl.numberOfPages), 20)
        case .Center:
            pageControl.frame = CGRectMake(0, 0, 20 * CGFloat(pageControl.numberOfPages), 20)
            pageControl.center = CGPointMake(self.frame.width/2, self.frame.origin.y + self.frame.height - 10)
        case .Right:
            pageControl.frame = CGRectMake(self.frame.width - 20 * CGFloat(pageControl.numberOfPages), self.frame.origin.y + self.frame.height - 20, 20 * CGFloat(pageControl.numberOfPages), 20)
        }
        pageControl.currentPage = 0
        pageControl.enabled = false
    }
    
    //由于PageControl这个空间必须要添加在滚动视图的父视图上(添加在滚动视图上的话会随着图片滚动,而达不到效果)
    func addPageControl() {
        setPageControlShowStyle()
        self.superview?.addSubview(pageControl)
    }
    
    //MARK: - 计时器到时,系统滚动图片
    func animalMoveImage() {
        self.setContentOffset(CGPointMake(self.frame.width * CGFloat(2), 0), animated: true)
        NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "scrollViewDidEndDecelerating:", userInfo: nil, repeats: false)
    }
    
    //MARK: - 图片停止时,调用该函数使得滚动视图复用
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        if self.contentOffset.x == 0 {
            currentImageNum = getForward(currentImageNum)
            pageControl.currentPage = getForward(currentImageNum)
        }else if self.contentOffset.x == self.frame.width * 2 {
            currentImageNum = getNext(currentImageNum)
            pageControl.currentPage = getForward(currentImageNum)
        }else {
            return
        }
        if imageNameArray.count >= 3{
            
            leftImageView.image = imageNameArray[getForward(currentImageNum)]
            centerImageView.image = imageNameArray[currentImageNum]
            rightImageView.image = imageNameArray[getNext(currentImageNum)]
        }
        
        self.contentOffset = CGPointMake(self.frame.width, 0)
      
        //手动控制图片滚动应该取消那个三秒的计时器
        moveTime.fireDate = NSDate(timeIntervalSinceNow: ChangeImageTime)
    }
    
    //MARK: - 公共方法
    func getForward(index: Int) -> Int {
        if imageNameArray.isEmpty {
            return 0
        }
        if index <= 0 {
            return imageNameArray.count - 1
        }else {
            return index - 1
        }
    }
    
    func getNext(index: Int) -> Int {
        if imageNameArray.isEmpty {
            return 0
        }
        if index >= imageNameArray.count - 1 {
            return 0
        }else {
            return index + 1
        }
    }

   
    
}
