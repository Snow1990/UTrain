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
    
    //课程图片
    var imageView = UIImageView()
    //课程简介
    var title = UILabel()
    //“来源：”
    var source: String = "" {
        didSet{
            sourceContent.text = "  来源：" + source
        }
    }
    //来源
    var sourceContent = UILabel()
    //评分
    var starNum: Int = 0 {
        didSet{
            setupStarImage()
        }
    }
    var starImageArr = [UIImageView]()
    //多少人点击
    var clickCount = UILabel()
    //点击次数
    var clickCountNum: Int = 0 {
        didSet{
            clickCount.text = "点击：\(clickCountNum)"
        }
    }

    

    
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
        return CGSizeMake(Argument.CellWidth, Argument.CellHight)
    }
    
    private struct Argument {


        //collection cell 宽高比
        static let Scale: CGFloat = 16/10
        static let Gap: CGFloat = Constants.ScreenRect.width/60
        
        static let CellWidth: CGFloat = (Constants.ScreenRect.width - Gap * 3)/2
        static let CellHight: CGFloat = ImageHight + TitleHight + ClickCountHight + Gap
        
        static let ImageWidth: CGFloat = CellWidth
        static let ImageHight: CGFloat = ImageWidth/Scale
        
        static let TitleWidth: CGFloat = CellWidth-10
        static let TitleHight: CGFloat = 20
        
        static let ClickLabelScale: CGFloat = 0.6
        static let ClickCountWidth: CGFloat = (CellWidth-10) * ClickLabelScale
        static let ClickCountHight: CGFloat = 20
        
        static let StarViewWidth: CGFloat = (CellWidth-10) * (1 - ClickLabelScale)
        static let StarViewHight: CGFloat = 20
        
        static let SourceWidth: CGFloat = ImageWidth
        static let SourceHight: CGFloat = 20
        
    }
    

    private func setupCell() {
        
        //课程图片
        imageView.backgroundColor = UIColor.brownColor().colorWithAlphaComponent(0.5)
        imageView.opaque = false
        imageView.frame = CGRectMake(
            0, 0,
            Argument.ImageWidth,
            Argument.ImageHight)
        self.addSubview(imageView)
        
        
        //课程名称
        title.backgroundColor = UIColor.clearColor()
        title.text = "标题示例文字"
        title.font = Constants.Font2
        title.frame = CGRectMake(
            5,
            imageView.frame.height,
            Argument.TitleWidth,
            Argument.TitleHight)
        self.addSubview(title)
        
        //课程点击次数
        clickCountNum = 12334
        clickCount.backgroundColor = UIColor.clearColor()
        clickCount.textColor = UIColor.grayColor()
        clickCount.font = Constants.Font1
        clickCount.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        clickCount.frame = CGRectMake(
            5,
            imageView.frame.height + title.frame.height,
            Argument.ClickCountWidth,
            Argument.ClickCountHight)
        self.addSubview(clickCount)
        
        //评价星级
        self.starNum = 3
        let starImageFrame = CGRectMake(Argument.CellWidth * Argument.ClickLabelScale, imageView.frame.height + title.frame.height, Argument.StarViewWidth, Argument.StarViewHight)
        for index in 0..<5 {
            let Scale:CGFloat = 0.8
            let X = starImageFrame.origin.x + starImageFrame.width/5*CGFloat(index)
            let Y = starImageFrame.origin.y + (starImageFrame.height - starImageFrame.width/5)/2
            let Width = starImageFrame.width/5 * Scale
            let Height = starImageFrame.width/5 * Scale
            starImageArr.append(UIImageView(frame: CGRectMake(
                X,
                Y,
                Width,
                Height)))
            
            self.addSubview(starImageArr[index])
        }
        
        
        //来源
        source = "广州团校"
        sourceContent.textColor = UIColor.whiteColor()
        sourceContent.font = Constants.Font1
        sourceContent.frame = CGRectMake(
            0,
            title.frame.origin.y - Argument.SourceHight,
            Argument.SourceWidth,
            Argument.SourceHight)
        self.addSubview(sourceContent)
        
        insertTransparentGradient(view: sourceContent)
        
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
