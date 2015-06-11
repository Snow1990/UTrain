//
//  URecommendCollectionViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/9.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class URecommendCollectionViewCell: UICollectionViewCell {
    
    //课程图片
    var imageView = UIImageView()
    //课程简介
    var about = UILabel()
    //“主讲：”
    var mainSpeaker = UILabel()
    //主讲人
    var mainSpeakerContent = UILabel()
    //“来源：”
    var source = UILabel()
    //来源
    var sourceContent = UILabel()
    //评分星星图片
//    var imageViewStarArr = [UIImageView]()
    //评分
    var starNum = Int()
    //用户图片
    var peopleImgView = UIImageView()
    //多少人在学
    var studyCount = UILabel()
    //在学人数
    var studyCountNum = Int()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        
//        messageLabel.font = Constants.ChatFont
//        messageLabel.numberOfLines = 0
//        
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        addSubview(avatar)
//        addSubview(messageBackgroundImageView)
//        addSubview(messageLabel)
//        self.backgroundColor = UIColor.clearColor()
//    }
    
    
    
    class func reuseIdentifier() -> String{
        return Constants.URecommendReusableCellID
    }
    
//    private struct Scale {
//        static let imageHight = 0.6
//        static let aboutHight = 0.6
//        static let mainSpeakerHight = 0.6
//        static let imageHight = 0.6
//        static let imageHight = 0.6
//
//        
//    }
    

    func setupCell() {
//        frame = (145,185)
//        let Rect = UIScreen.mainScreen().bounds
//        
//        println(Rect.width)
//        println(Rect.height)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
//        self.alpha = 0.1
//        self.opaque = true
        

        
        imageView.backgroundColor = UIColor.redColor()
        imageView.frame = CGRectMake(0, 0, 145, 105)
        self.addSubview(imageView)
        
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
 

        
    }
    
    func setupStarImage(#frame: CGRect) {
        
        let starNormalImage = UIImage(named: "rating_normal")
        let starPressedImage = UIImage(named: "rating_pressed")
        
        for index in 0..<5 {
            
            let starImageView = UIImageView(frame: CGRectMake(frame.origin.x + frame.width/5*CGFloat(index) , frame.origin.y, frame.width/5, frame.height))
            starImageView.backgroundColor = UIColor.clearColor()
            
            if index < self.starNum {
                starImageView.image = starPressedImage
            }else {
                starImageView.image = starNormalImage
            }
            
            self.addSubview(starImageView)
//            imageViewStarArr.append(starImageView)
        }
        

        
        
//        let starImageView1 = UIImageView(frame: CGRectMake(20, 150, 10, 10))
//        starImageView1.backgroundColor = UIColor.clearColor()
//        self.addSubview(starImageView1)
//        
//        let starImageView2 = UIImageView(frame: CGRectMake(30, 150, 10, 10))
//        starImageView2.backgroundColor = UIColor.clearColor()
//        self.addSubview(starImageView2)
//        
//        let starImageView3 = UIImageView(frame: CGRectMake(40, 150, 10, 10))
//        starImageView3.backgroundColor = UIColor.clearColor()
//        self.addSubview(starImageView3)
//        
//        let starImageView4 = UIImageView(frame: CGRectMake(50, 150, 10, 10))
//        starImageView4.backgroundColor = UIColor.clearColor()
//        self.addSubview(starImageView4)
//        
//        let starImageView5 = UIImageView(frame: CGRectMake(60, 150, 10, 10))
//        starImageView5.backgroundColor = UIColor.clearColor()
//        self.addSubview(starImageView5)
    }
    
    

    
}
