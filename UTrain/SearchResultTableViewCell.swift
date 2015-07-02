//
//  SearchResultTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    // 课程图片
    var courseImageView = UIImageView()
    
    // 课程名称
    var title: String = "" {
        didSet{
            titleLable.text = title
            let size = UILabel.sizeOfString(title, font: Constants.Font2, maxWidth: Argument.TitleWidth)
            titleLable.frame = CGRectMake(
                273 * Constants.Scale,
                Argument.HightGap,
                size.width,
                size.height)
        }
    }
    // 课程名称Label
    var titleLable = UILabel()

    // “来源：”
    var source: String = "" {
        didSet{
            sourceContent.text = "来源：" + source
        }
    }
    // 来源
    var sourceContent = UILabel()
    // 评分
    var starNum: Int = 0 {
        didSet{
            setupStarImage()
        }
    }
    var starImageArr = [UIImageView]()
    // 多少人点击
    var clickCount = UILabel()
    // 点击次数
    var clickCountNum: Int = 0 {
        didSet{
            clickCount.text = "点击：\(clickCountNum)"
        }
    }
    // 分割线
    var separateImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupCell()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private struct Argument {

        
        //collection cell 宽高比
//        static let Scale: CGFloat = 16/10
        static let HightGap: CGFloat = 36 * Constants.Scale
        static let WidthGap: CGFloat = 28 * Constants.Scale
        
        static let CellWidth: CGFloat = Constants.ScreenRect.width
        static let CellHight: CGFloat = 213 * Constants.Scale
        
        static let ImageWidth: CGFloat = 222 * Constants.Scale
        static let ImageHight: CGFloat = 140 * Constants.Scale
        
        static let TitleWidth: CGFloat = 425 * Constants.Scale
        static let TitleHight: CGFloat = 40 * Constants.Scale
        
        static let SourceWidth: CGFloat = 425 * Constants.Scale
        static let SourceHight: CGFloat = 34 * Constants.Scale

//        static let ClickLabelScale: CGFloat = 0.6
        static let ClickCountWidth: CGFloat = 165 * Constants.Scale
        static let ClickCountHight: CGFloat = 34 * Constants.Scale
        
        static let StarViewWidth: CGFloat = 133 * Constants.Scale
        static let StarViewHight: CGFloat = 34 * Constants.Scale
        
    }
    class func getCellHight() -> CGFloat {
        return Argument.CellHight
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
        
        
        
//        NSString *str = @"你要放在label里的文本字符串  \n  换行符";
//        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(width,10000.0f)lineBreakMode:UILineBreakModeWordWrap]；
//        
//        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(x,y,size.width,size.height)];
//        lb.numberOfLines = 0; // 最关键的一句
//        lb.text = str;
//        lb.font = [UIFont systemFontOfSize:14];
//        [self.view addSubview:lb];
        
        
        //课程名称
        titleLable.backgroundColor = UIColor.clearColor()
        titleLable.text = "标题示例文字"
        titleLable.numberOfLines = 0
        titleLable.font = Constants.Font2
        titleLable.lineBreakMode = NSLineBreakMode.ByCharWrapping
        titleLable.frame = CGRectMake(
            273 * Constants.Scale,
            Argument.HightGap,
            Argument.TitleWidth,
            Argument.TitleHight)
        self.addSubview(titleLable)

        //来源
        source = "广州团校"
        sourceContent.backgroundColor = UIColor.clearColor()
        sourceContent.textColor = UIColor.grayColor()
        sourceContent.font = Constants.Font1
        sourceContent.frame = CGRectMake(
            titleLable.frame.origin.x,
            112 * Constants.Scale,
            Argument.SourceWidth,
            Argument.SourceHight)
        self.addSubview(sourceContent)
        
        //课程点击次数
        clickCountNum = 12334
        clickCount.backgroundColor = UIColor.clearColor()
        clickCount.textColor = UIColor.grayColor()
        clickCount.font = Constants.Font1
        clickCount.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        clickCount.frame = CGRectMake(
            titleLable.frame.origin.x,
            sourceContent.frame.origin.y + sourceContent.frame.height,
            Argument.ClickCountWidth,
            Argument.ClickCountHight)
        self.addSubview(clickCount)
        
        //评价星级
        self.starNum = 3
        let starImageFrame = CGRectMake(
            clickCount.frame.origin.x + 185 * Constants.Scale,
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
        
        // 分割线
        separateImageView = UIImageView(frame: CGRectMake(
            0,
            213 * Constants.Scale - 2,
            Constants.ScreenRect.width,
            2))
        let Image = UIImage(named: "search_separate")!
        separateImageView.image = Image
        separateImageView.backgroundColor = UIColor.clearColor()
        self.addSubview(separateImageView)
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

extension UILabel {
    class func sizeOfString(string: String, font: UIFont, maxWidth: CGFloat) -> CGSize{
        
        var size: CGSize = string.boundingRectWithSize(CGSizeMake(maxWidth, 999),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font],
            context: nil).size
        return size
    }
}

