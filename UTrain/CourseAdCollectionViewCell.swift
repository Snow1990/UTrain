//
//  CourseAdCollectionViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/12.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseAdCollectionViewCell: UICollectionViewCell {
    
    //测试用图片
//    let imageArray = ["tutorial_background_00","tutorial_background_01","tutorial_background_02","tutorial_background_03","tutorial_background_04"]
    
    var scrollView: AdScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView = AdScrollView(frame: frame)
        self.addSubview(scrollView)
        
        scrollView.pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        scrollView.pageControl.currentPageIndicatorTintColor = Constants.LightGreen
        scrollView.addPageControl()

    }
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func reuseIdentifier() -> String{
        return Constants.HomePageAdReusableCellID
    }
    
    class func getSize() -> CGSize {
        return CGSizeMake(Argument.CellWidth, Argument.CellHeight)
    }
    private struct Argument {
        static let Rect = UIScreen.mainScreen().bounds
        //广告页宽高比
        static let Scale:CGFloat = 19/8
        static let CellWidth: CGFloat = Rect.width
        static let CellHeight: CGFloat = CellWidth/Scale
//        static let AdPageControlWidth: CGFloat = CellWidth/5
//        static let AdPageControlHeight: CGFloat = 10
//        static let AdPageNumber: Int = 5
    }
    /*
    private func setupCell() {
        
        scrollView.frame = self.frame
        scrollView.pagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self

        let width = Argument.CellWidth
        let height = Argument.CellHeight

        scrollView.contentSize = CGSize(width: width * 5, height: height)
        for i in 0 ..< imageArray.count{
            let origin = CGPoint(x: CGFloat(i) * width, y: 0)
            let frame = CGRect(origin: origin, size: CGSize(width: width, height: height))
            let imageView = UIImageView(frame:frame)
            imageView.image = UIImage(named: imageArray[i])
            scrollView.addSubview(imageView)
        }
        self.addSubview(scrollView)

        
        pageControl.frame = CGRectMake((
            scrollView.frame.width - Argument.AdPageControlWidth)/2,
            scrollView.frame.height - Argument.AdPageControlHeight,
            Argument.AdPageControlWidth,
            Argument.AdPageControlHeight
        )
        pageControl.numberOfPages = 5
        pageControl.addTarget(self, action: "pageChanged", forControlEvents: UIControlEvents.ValueChanged)
        
        self.addSubview(pageControl)
    }
    
    
    // MARK: - 计时器到时,系统滚动图片

    
    func pageChanged(){
        self.scrollView.setContentOffset(CGPointMake(UIScreen.mainScreen().bounds.width * CGFloat(pageControl.currentPage), 0), animated: true)
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "autoChangeScrollView", userInfo: nil, repeats: false)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let curPage = scrollView.contentOffset.x / UIScreen.mainScreen().bounds.width
        pageControl.currentPage = Int(curPage)
    }
    // MARK: - 图片停止时,调用该函数使得滚动视图复用
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        restartAutoTimer()
        if self.scrollView.contentOffset.x == 0 {
            
        }
        
//        
//        if (self.contentOffset.x == 0)
//        {
//            currentImage = (currentImage-1)%_imageNameArray.count;
//            _pageControl.currentPage = (_pageControl.currentPage - 1)%_imageNameArray.count;
//        }
//        else if(self.contentOffset.x == UISCREENWIDTH * 2)
//        {
//            
//            currentImage = (currentImage+1)%_imageNameArray.count;
//            _pageControl.currentPage = (_pageControl.currentPage + 1)%_imageNameArray.count;
//        }
//        else
//        {
//            return;
//        }
    }
    

    
    // MARK: - 定时滑动
    
    func addAutoTimer() {
        myAutoTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "autoChangeScrollView", userInfo: nil, repeats: true)
    }
    func autoChangeScrollView() {
        //向前自动滑动
        if pageControl.currentPage < Argument.AdPageNumber - 1 {
            pageControl.currentPage++
        }else {
            pageControl.currentPage = 0
        }
        pageChanged()
    }
    func stopAutoTimer() {
        myAutoTimer?.invalidate()
//        myAutoTimer = nil
    }
    func restartAutoTimer() {
        addAutoTimer()
    }
    

*/
    
}
