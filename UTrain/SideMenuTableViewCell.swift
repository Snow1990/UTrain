//
//  SideMenuTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/7/1.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    var separateImageView: UIImageView!
    var title: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()



        // 标题缩进
        let Retract: CGFloat = 60 * Constants.Scale
        // 分割线缩进
        let SeparateRetract: CGFloat = 50 * Constants.Scale
        // 抽屉宽度
        let SideMenuWidth: CGFloat = Constants.ScreenRect.width*0.53
        
        // 标题
        title = UILabel(frame: CGRectMake(
            Retract,
            0,
            SideMenuWidth - Retract * 2,
            self.frame.height))
        title.textColor = UIColor.whiteColor()
        title.font = Constants.Font3
        self.addSubview(title)
        
        // 分割线
        separateImageView = UIImageView(frame: CGRectMake(
            SeparateRetract,
            frame.height - 2,
            SideMenuWidth - SeparateRetract * 2,
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
        return 100 * Constants.Scale
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
