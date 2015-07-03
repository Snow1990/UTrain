//
//  CourseCommentTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/7/3.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCommentTableViewCell: UITableViewCell {
    
    var separateView = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        
//        // 标题缩进
//        let Retract: CGFloat = 60 * Constants.Scale
        // 分割线缩进
        let SeparateRetract: CGFloat = 133 * Constants.Scale

        
        // 标题下的分割线
        separateView.backgroundColor = Constants.SeparateColor
        separateView.frame = CGRectMake(
            133 * Constants.Scale,
            frame.height - 2,
            548 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(separateView)
        
//        // 分割线
//        separateImageView.frame = CGRectMake(
//            133 * Constants.Scale,
//            frame.height - 2,
//            SideMenuWidth - SeparateRetract * 2,
//            2)
//        let Image = UIImage(named: "side_menu_separate")!
//        separateImageView.image = Image
//        separateImageView.backgroundColor = UIColor.clearColor()
//        self.addSubview(separateImageView)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
