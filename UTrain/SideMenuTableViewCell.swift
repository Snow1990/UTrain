//
//  SideMenuTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/7/1.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    var title = "" {
        didSet {
            titleLabel.text = title
            let size = UILabel.sizeOfString(title,
                font: Constants.Font3,
                maxWidth: 280 * Constants.Scale)
            titleLabel.frame = CGRectMake(
                60 * Constants.Scale,
                28 * Constants.Scale,
                280 * Constants.Scale,
                size.height)
            separateImageView.frame = CGRectMake(
                50 * Constants.Scale,
                56 * Constants.Scale + size.height,
                280 * Constants.Scale,
                2)
//            println(titleLabel.frame)
//            cellHeight = size.height + 58 * Constants.Scale
        }
    }
//    var cellHeight: CGFloat = 0
    var separateImageView: UIImageView!
    var titleLabel: UILabel!

    struct Argument {
        // 标题缩进
//        static let Retract: CGFloat = 60 * Constants.Scale
        // 分割线缩进
        static let SeparateRetract: CGFloat = 50 * Constants.Scale
        // 抽屉宽度
        static let SideMenuWidth: CGFloat = 380 * Constants.Scale
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()

        
        
        // 标题
        titleLabel = UILabel(frame: CGRectMake(
            60 * Constants.Scale,
            28 * Constants.Scale,
            280 * Constants.Scale,
            36 * Constants.Scale))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        titleLabel.font = Constants.Font3
        self.addSubview(titleLabel)
        
        // 分割线
        separateImageView = UIImageView(frame: CGRectMake(
            50 * Constants.Scale,
            88 * Constants.Scale,
            280 * Constants.Scale,
            2))
        let Image = UIImage(named: "side_menu_separate")!
        separateImageView.image = Image
        separateImageView.backgroundColor = UIColor.clearColor()
        self.addSubview(separateImageView)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func getCellHeight() -> CGFloat {
        return 96 * Constants.Scale
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
