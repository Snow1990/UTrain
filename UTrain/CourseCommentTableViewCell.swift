//
//  CourseCommentTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/7/3.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit


enum UserType: Int {
    case Tourist
    case Student
    case Lecture
    case Anonymity
}
class CourseCommentTableViewCell: UITableViewCell {
    
    var userName = "" {
        didSet {
            userLabel.text = userTypeStr + userName
        }
    }
    var commentTime = "" {
        didSet {
            timeLabel.text = commentTime
        }
    }

    var content = "" {
        didSet {
            contentLabel.text = content
            
            self.updateView()
        }
    }
    // 用户类型
    var userType = UserType.Tourist {
        didSet {
            userLabel.text = userTypeStr + userName
        }
    }

    var userTypeStr: String {
        switch userType {
        case .Tourist:
            return "游客"
        case UserType.Student:
            return "学员"
        case .Lecture:
            return "讲师"
        case .Anonymity:
            return "匿名"
        }
    }
    
    
    
    var avatarView = UIImageView()
    var userLabel = UILabel()
    var timeLabel = UILabel()
    var contentLabel = UILabel()
    var separateView = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        
        
        // 用户头像
        avatarView.image = UIImage(named: "details_picture")
        avatarView.frame = CGRectMake(
            37 * Constants.Scale,
            25 * Constants.Scale,
            72 * Constants.Scale,
            72 * Constants.Scale)
        self.addSubview(avatarView)
        
        // 用户名称
        userLabel.backgroundColor = UIColor.clearColor()
        userLabel.font = Constants.Font1
        userLabel.textColor = UIColor.grayColor()
        userLabel.frame = CGRectMake(
            130 * Constants.Scale,
            25 * Constants.Scale,
            250 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(userLabel)
        

        // 评论时间
        timeLabel.backgroundColor = UIColor.clearColor()
        timeLabel.font = Constants.Font1
        timeLabel.textColor = UIColor.grayColor()
        timeLabel.frame = CGRectMake(
            450 * Constants.Scale,
            25 * Constants.Scale,
            235 * Constants.Scale,
            24 * Constants.Scale)
        self.addSubview(timeLabel)

        
        // 评论内容
        contentLabel.backgroundColor = UIColor.clearColor()
        contentLabel.font = Constants.Font1
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        contentLabel.frame = CGRectMake(
            130 * Constants.Scale,
            68 * Constants.Scale,
            550 * Constants.Scale,
            66 * Constants.Scale)
        self.addSubview(contentLabel)
        
        // 标题下的分割线
        separateView.backgroundColor = Constants.SeparateColor
        separateView.frame = CGRectMake(
            130 * Constants.Scale,
            contentLabel.frame.maxY + 25 * Constants.Scale,
            550 * Constants.Scale,
            1 * Constants.Scale)
        self.addSubview(separateView)

        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
    }
    
    // 更新视图
    func updateView() {
        
        let size = UILabel.sizeOfString(contentLabel.text!, font: contentLabel.font, maxWidth: 550 * Constants.Scale)
        contentLabel.frame = CGRectMake(
            130 * Constants.Scale,
            68 * Constants.Scale,
            size.width,
            size.height)
        separateView.frame = CGRectMake(
            130 * Constants.Scale,
            contentLabel.frame.maxY + 25 * Constants.Scale,
            550 * Constants.Scale,
            1 * Constants.Scale)
        self.frame = CGRectMake(
            self.frame.origin.x,
            self.frame.origin.y,
            self.frame.width,
            contentLabel.frame.maxY + 26 * Constants.Scale)
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
