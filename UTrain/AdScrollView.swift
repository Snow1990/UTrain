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

    //广告的label
    var adLable: UILabel?
    //循环滚动的三个视图
    var leftImageView = UIImageView()
    var centerImageView = UIImageView()
    var rightImageView = UIImageView()
    //循环滚动的周期时间
    var moveTime = NSTimer()
    //用于确定滚动式由人导致的还是计时器到了,系统帮我们滚动的,true,则为系统滚动,false则为客户滚动(ps.在客户端中客户滚动一个广告后,这个广告的计时器要归0并重新计时)
    var isTimeUp = false
    
    var pageControl = UIPageControl()
    var imageNameArray = [String]()

    
    
    //记录中间图片的下标,开始总是为1
    var currentImageNum = 1

   
    private struct Argument {
        static let ChangeImageTime = 3.0
    }
    


    //MARK: - 自由指定广告所占的frame
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
        
        moveTime = NSTimer.scheduledTimerWithTimeInterval(Argument.ChangeImageTime, target: self, selector: "animalMoveImage", userInfo: nil, repeats: true)

    

    }
    
    
    //MARK: - 设置广告所使用的图片(名字)
    func setImageName(imageNameArray: [String]) {
        self.imageNameArray = imageNameArray
        leftImageView.image = UIImage(named: imageNameArray[0])
        centerImageView.image = UIImage(named: imageNameArray[1])
        rightImageView.image = UIImage(named: imageNameArray[2])
    }

    //MARK: - 创建pageControl,指定其显示样式
    func setPageControlShowStyle(pageControlShowStyle: UIPageControlShowStyle) {
        pageControl.numberOfPages = imageNameArray.count

        switch pageControlShowStyle {
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
        self.targetForAction("addPageControl", withSender: self)
    }
    
   
    
    
    //由于PageControl这个空间必须要添加在滚动视图的父视图上(添加在滚动视图上的话会随着图片滚动,而达不到效果)
    func addPageControl() {
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
            currentImageNum = (currentImageNum - 1) % imageNameArray.count
            pageControl.currentPage = (pageControl.currentPage - 1) % imageNameArray.count
        }else if self.contentOffset.x == self.frame.width * 2 {
            currentImageNum = (currentImageNum + 1) % imageNameArray.count
            pageControl.currentPage = (pageControl.currentPage + 1) % imageNameArray.count
        }else {
            return
        }
        
        leftImageView.image = UIImage(named: imageNameArray[(currentImageNum - 1) % imageNameArray.count])
        centerImageView.image = UIImage(named: imageNameArray[currentImageNum % imageNameArray.count])
        rightImageView.image = UIImage(named: imageNameArray[(currentImageNum + 1) % imageNameArray.count])

        self.contentOffset = CGPointMake(self.frame.width, 0)
      
        
        //手动控制图片滚动应该取消那个三秒的计时器
        if (!isTimeUp) {
  
            moveTime.fireDate = NSDate(timeIntervalSinceNow: Argument.ChangeImageTime)

        }
        isTimeUp = false
        
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
