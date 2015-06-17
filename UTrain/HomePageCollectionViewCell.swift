//
//  HomePageCollectionViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/9.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    //课程图片
    var imageView = UIImageView()
    //课程简介
    var title = UILabel()
    //“来源：”
    var source = ""
    //来源
    var sourceContent = UILabel()
    //评分
    var starNum = Int()
    //多少人点击
    var clickCount = UILabel()
    //点击次数
    var clickCountNum = Int()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        static let Rect = UIScreen.mainScreen().bounds

        //collection cell 宽高比
        static let Scale: CGFloat = 16/10
        static let Gap: CGFloat = Rect.width/60
        
        static let CellWidth: CGFloat = (Rect.width - Gap * 3)/2
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
        imageView.frame = CGRectMake(0, 0, Argument.ImageWidth, Argument.ImageHight)
        self.addSubview(imageView)
        
        
        //课程名称
        title.backgroundColor = UIColor.clearColor()
        title.text = "标题示例文字"
        title.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        title.frame = CGRectMake(5, imageView.frame.height, Argument.TitleWidth, Argument.TitleHight)
        self.addSubview(title)
        
        //课程点击次数
        clickCountNum = 12334
        clickCount.text = "点击：\(clickCountNum)"
        clickCount.backgroundColor = UIColor.clearColor()
        clickCount.textColor = UIColor.grayColor()
        clickCount.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        clickCount.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        clickCount.frame = CGRectMake(5, imageView.frame.height + title.frame.height, Argument.ClickCountWidth, Argument.ClickCountHight)
        self.addSubview(clickCount)
        
        //评价星级
        self.starNum = 3
        setupStarImage(frame: CGRectMake(Argument.CellWidth * Argument.ClickLabelScale, imageView.frame.height + title.frame.height, Argument.StarViewWidth, Argument.StarViewHight))

        
        
        //来源
        source = "广州团校"
        sourceContent.text = "  来源：" + source
        sourceContent.textColor = UIColor.whiteColor()
        sourceContent.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        sourceContent.frame = CGRectMake(0, title.frame.origin.y - Argument.SourceHight, Argument.SourceWidth, Argument.SourceHight);
        self.addSubview(sourceContent)
        
        insertTransparentGradient(frame: sourceContent.frame)
        
        /*
        
        mainSpeaker.text = "主讲："
        mainSpeaker.backgroundColor = UIColor.clearColor()
        mainSpeaker.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        mainSpeaker.frame = CGRectMake(5, 105, 35, 20);
        self.addSubview(mainSpeaker)
        
        
        mainSpeakerContent.text = "赵钱孙李"
        mainSpeakerContent.backgroundColor = UIColor.clearColor()
        mainSpeakerContent.textColor = UIColor.grayColor()
        mainSpeakerContent.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        mainSpeakerContent.frame = CGRectMake(40, 105, 105, 20);
        self.addSubview(mainSpeakerContent)
        
        

        source.text = "来源："
        source.backgroundColor = UIColor.clearColor()
        source.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        source.frame = CGRectMake(5, 125, 35, 20);
        self.addSubview(source)
        
        
        sourceContent.text = "网络资源部"
        sourceContent.backgroundColor = UIColor.clearColor()
        sourceContent.textColor = UIColor.grayColor()
        sourceContent.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        sourceContent.frame = CGRectMake(40, 125, 105, 20);
        self.addSubview(sourceContent)
        
        
        

        about.backgroundColor = UIColor.blackColor()
        about.textColor = UIColor.whiteColor()
        about.text = "标题名称示例文字"
        sourceContent.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        about.alpha = 0.6
        about.frame = CGRectMake(0, 85, 145, 20)
        self.addSubview(about)
        
        
        
        self.starNum = 3
        setupStarImage(frame: CGRectMake(20, 150, 50, 10))
        
        
        peopleImgView.image = UIImage(named: "o_click")
        peopleImgView.frame = CGRectMake(10, 165, 15, 15)
        self.addSubview(peopleImgView)
        
        studyCountNum = 200
        studyCount.text = "\(studyCountNum)人在学"
        studyCount.backgroundColor = UIColor.clearColor()
        studyCount.textColor = UIColor.grayColor()
        studyCount.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        studyCount.frame = CGRectMake(25, 167, 100, 15)
        self.addSubview(studyCount)
        
//        //多少人在学
//        var studyCount = UILabel()
//        //在学人数
//        var studyCountNum = Int()
//        
 
        */
        
    }
    
    func setupStarImage(#frame: CGRect) {
        
        let starNormalImage = UIImage(named: "start2")
        let starPressedImage = UIImage(named: "start1")
        
        for index in 0..<5 {
            let Scale:CGFloat = 0.8
            let X = frame.origin.x + frame.width/5*CGFloat(index)
            let Y = frame.origin.y + (frame.height - frame.width/5)/2
            let Width = frame.width/5 * Scale
            let Height = frame.width/5 * Scale
            let starImageView = UIImageView(frame: CGRectMake(X, Y, Width, Height))
            
            if index < self.starNum {
                starImageView.image = starPressedImage
            }else {
                starImageView.image = starNormalImage
            }
            
            self.addSubview(starImageView)
        }
    }
    
    //Transparent Gradient Layer
    func insertTransparentGradient(#frame: CGRect) {
        
        let colorOne = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0)
        let colorTwo = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
        let colors = [colorOne.CGColor, colorTwo.CGColor]
        let stopOne = 0.0
        let stopTwo = 1.0
        let locations = [stopOne, stopTwo]
        
        let headerLayer = CAGradientLayer()
        headerLayer.colors = colors
        headerLayer.locations = locations
        headerLayer.frame = frame
        self.layer.insertSublayer(headerLayer, atIndex: 0)
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
