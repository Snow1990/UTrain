//
//  CourseCommentFooter.swift
//  UTrain
//
//  Created by SN on 15/7/6.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCommentFooter: UIView {

   
    var isLoaded = false {
        didSet {
            label.text = self.text
        }
    }
    var text: String {
        if isLoaded {
            return "亲~已全部加载完成~"
        }else {
            return "正在加载，请稍后……"
        }
    }
    var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        label.frame = CGRectMake(
            0,
            25 * Constants.Scale,
            Constants.ScreenRect.width,
            24 * Constants.Scale)
        label.textAlignment = NSTextAlignment.Center
        label.font = Constants.Font1
        label.textColor = UIColor.grayColor()

        self.addSubview(label)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
