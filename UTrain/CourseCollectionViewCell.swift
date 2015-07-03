//
//  CourseCollectionViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/9.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

class CourseCollectionViewCell: UICollectionViewCell {
    
    // “来源：”
    var source: String = "" {
        didSet{
            sourceContent.text = "来源：" + source
        }
    }
    // 评分
    var starNum: Int = 0 {
        didSet{
            setupStarImage()
        }
    }
    // 点击次数
    var clickCountNum: Int = 0 {
        didSet{
            clickCount.text = "点击：\(clickCountNum)"
        }
    }
    
    
    // 课程图片
    var imageView = UIImageView()
    // 课程简介
    var title = UILabel()
    
    // 来源
    var sourceContent = UILabel()
    
    var starImageArr = [UIImageView]()
    // 多少人点击
    var clickCount = UILabel()
    
    // 逐渐透明阴影
    var shadowView = UIView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        setupCell()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    class func reuseIdentifier() -> String{
        return Constants.HomePageReusableCellID
    }
    
    class func getSize() -> CGSize {
        return CGSizeMake(
            342 * Constants.Scale,
            318 * Constants.Scale)
    }

    private func setupCell() {
        
        //课程图片
        imageView.backgroundColor = UIColor.brownColor().colorWithAlphaComponent(0.5)
        imageView.opaque = false
        imageView.frame = CGRectMake(
            0, 0,
            342 * Constants.Scale,
            214 * Constants.Scale)
        self.addSubview(imageView)
        
        
        //课程名称
        title.backgroundColor = UIColor.clearColor()
        title.text = "标题示例文字"
        title.font = Constants.Font2
        title.frame = CGRectMake(
            14 * Constants.Scale,
            227 * Constants.Scale,
            310 * Constants.Scale,
            28 * Constants.Scale)
        self.addSubview(title)
        
        //课程点击次数
        clickCountNum = 12334
        clickCount.backgroundColor = UIColor.clearColor()
        clickCount.textColor = UIColor.grayColor()
        clickCount.font = Constants.Font1
        clickCount.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        clickCount.frame = CGRectMake(
            14 * Constants.Scale,
            268 * Constants.Scale,
            168 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(clickCount)
        
        //评价星级
        self.starNum = 3
        let starImageFrame = CGRectMake(
            200 * Constants.Scale,
            268 * Constants.Scale,
            124 * Constants.Scale,
            20 * Constants.Scale)
        for index in 0..<5 {
            let Scale:CGFloat = 0.8
            let X = starImageFrame.origin.x + starImageFrame.width/5*CGFloat(index)
            let Y = starImageFrame.origin.y + (starImageFrame.height - starImageFrame.width/5)/2
            let Width = starImageFrame.width/5 * Scale
            let Height = starImageFrame.width/5 * Scale
            starImageArr.append(UIImageView(frame: CGRectMake(
                200 * Constants.Scale + 26 * Constants.Scale * CGFloat(index),
                268 * Constants.Scale,
                20 * Constants.Scale,
                20 * Constants.Scale)))
            
            self.addSubview(starImageArr[index])
        }
        
        // 阴影
        shadowView.frame = CGRectMake(
            0,
            161 * Constants.Scale,
            342 * Constants.Scale,
            53 * Constants.Scale)
        insertTransparentGradient(view: shadowView)
        self.addSubview(shadowView)

        // 来源
        source = "广州团校"
        sourceContent.textColor = UIColor.whiteColor()
        sourceContent.font = Constants.Font1
        sourceContent.frame = CGRectMake(
            14 * Constants.Scale,
            174 * Constants.Scale,
            300 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(sourceContent)
    }
    
    func setupStarImage() {
        
        let starNormalImage = UIImage(named: "start2")
        let starPressedImage = UIImage(named: "start1")

        
        for index in 0..<starImageArr.count {
            if index < self.starNum {
                starImageArr[index].image = starPressedImage
            }else {
                starImageArr[index].image = starNormalImage
            }
        }
    }
    
//    func setupStarImage(#frame: CGRect) {
//        
//        let starNormalImage = UIImage(named: "start2")
//        let starPressedImage = UIImage(named: "start1")
//        
//        for index in 0..<5 {
//            let Scale:CGFloat = 0.8
//            let X = frame.origin.x + frame.width/5*CGFloat(index)
//            let Y = frame.origin.y + (frame.height - frame.width/5)/2
//            let Width = frame.width/5 * Scale
//            let Height = frame.width/5 * Scale
//            let starImageView = UIImageView(frame: CGRectMake(X, Y, Width, Height))
//            
//            if index < self.starNum {
//                starImageView.image = starPressedImage
//            }else {
//                starImageView.image = starNormalImage
//            }
//            
//            self.addSubview(starImageView)
//        }
//    }
    
    //Transparent Gradient Layer
    func insertTransparentGradient(#view: UIView) {
        
        let colorOne = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0)
        let colorTwo = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
        let colors = [colorOne.CGColor, colorTwo.CGColor]
        let stopOne = 0.0
        let stopTwo = 1.0
        let locations = [stopOne, stopTwo]
        
        let headerLayer = CAGradientLayer()
        headerLayer.colors = colors
        headerLayer.locations = locations
        headerLayer.frame = CGRectMake(0, 0, view.frame.width, view.frame.height)
        view.layer.insertSublayer(headerLayer, atIndex: 0)
    }
    
    //color gradient layer
    func insertColorGradient(#frame: CGRect) {
        
        let colorOne = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let colorTwo = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        
        let colors = [colorOne.CGColor, colorTwo.CGColor]
        let stopOne = 0.0
        let stopTwo = 1.0
        let locations = [stopOne, stopTwo]
        
        let headerLayer = CAGradientLayer()
        headerLayer.colors = colors
        headerLayer.locations = locations
        headerLayer.frame = frame
        self.layer.insertSublayer(headerLayer, above: nil)

    }
    
    
    
    
    
    
    

    
}
