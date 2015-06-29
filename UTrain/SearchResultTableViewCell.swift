//
//  SearchResultTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    //课程图片
    var courseImageView = UIImageView()
    //课程简介
    var title = UILabel()
    //“来源：”
    var source: String = "" {
        didSet{
            sourceContent.text = "来源：" + source
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
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupCell()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private struct Argument {
        static let Rect = UIScreen.mainScreen().bounds
        
        //collection cell 宽高比
        static let Scale: CGFloat = 16/10
        static let HightGap: CGFloat = Rect.width/20
        static let WidthGap: CGFloat = Rect.width/25
        
        static let CellWidth: CGFloat = Rect.width
        static let CellHight: CGFloat = ImageHight + HightGap * 2
        
        static let ImageWidth: CGFloat = Rect.width/3
        static let ImageHight: CGFloat = ImageWidth/Scale
        
        static let TitleWidth: CGFloat = CellWidth-ImageWidth-WidthGap*3
        static let TitleHight: CGFloat = ImageHight/2
        
        static let SourceWidth: CGFloat = CellWidth-ImageWidth-WidthGap*3
        static let SourceHight: CGFloat = ImageHight/4

//        static let ClickLabelScale: CGFloat = 0.6
        static let ClickCountWidth: CGFloat = SourceWidth/2
        static let ClickCountHight: CGFloat = ImageHight/4
        
        static let StarViewWidth: CGFloat = SourceWidth/2
        static let StarViewHight: CGFloat = ImageHight/4
        
    }
    class func getCellHight() -> CGFloat {
        return Argument.ImageHight + Argument.HightGap * 2
    }
    
    func setupCell() {
        
        self.backgroundColor = UIColor.clearColor()
        
        //课程图片
        courseImageView.backgroundColor = UIColor.brownColor()
        courseImageView.opaque = false
        courseImageView.frame = CGRectMake(
            Argument.WidthGap,
            Argument.HightGap,
            Argument.ImageWidth,
            Argument.ImageHight)
        self.addSubview(courseImageView)
        
        //课程名称
        title.backgroundColor = UIColor.clearColor()
        title.text = "标题示例文字"
        title.numberOfLines = 2
        title.font = Constants.GenneralFont
        
        title.frame = CGRectMake(
            Argument.WidthGap * 2 + Argument.ImageWidth,
            Argument.HightGap,
            Argument.TitleWidth,
            Argument.TitleHight)
        self.addSubview(title)

        //来源
        source = "广州团校"
        sourceContent.backgroundColor = UIColor.clearColor()
        sourceContent.textColor = UIColor.grayColor()
        sourceContent.font = Constants.FootNoteFont
        sourceContent.frame = CGRectMake(
            title.frame.origin.x,
            Argument.HightGap + title.frame.height,
            Argument.SourceWidth,
            Argument.SourceHight)
        self.addSubview(sourceContent)
        
        //课程点击次数
        clickCountNum = 12334
        clickCount.backgroundColor = UIColor.clearColor()
        clickCount.textColor = UIColor.grayColor()
        clickCount.font = Constants.FootNoteFont
        clickCount.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        clickCount.frame = CGRectMake(
            title.frame.origin.x,
            sourceContent.frame.origin.y + sourceContent.frame.height,
            Argument.ClickCountWidth,
            Argument.ClickCountHight)
        self.addSubview(clickCount)
        
        //评价星级
        self.starNum = 3
        let starImageFrame = CGRectMake(
            clickCount.frame.origin.x + clickCount.frame.width,
            clickCount.frame.origin.y,
            Argument.StarViewWidth,
            Argument.StarViewHight)
        for index in 0..<5 {
            
            let Scale:CGFloat = 0.8
            let imageView = UIImageView(frame: CGRectMake(
                starImageFrame.origin.x + starImageFrame.width/5*CGFloat(index),
                starImageFrame.origin.y + (starImageFrame.height - starImageFrame.width/5)/2,
                starImageFrame.width/5 * Scale,
                starImageFrame.width/5 * Scale))
            self.addSubview(imageView)
            starImageArr.append(imageView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}
