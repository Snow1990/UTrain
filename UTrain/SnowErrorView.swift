//
//  SnowErrorView.swift
//  UTrain
//
//  Created by SN on 15/6/30.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SnowErrorView: UIView {
    
    
    var imageView = UIImageView()
    var errorMessage = UILabel()
    var refreshButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 错误图片

        let ImageWidth: CGFloat = 44.0 * 5
        let ImageHeight: CGFloat = 27.0 * 5
        imageView.frame = CGRectMake(
            (Constants.ScreenRect.width - ImageWidth)/2,
            100,
            ImageWidth,
            ImageHeight)
        imageView.image = UIImage(named: "search_error")
        self.addSubview(imageView)
        
        // 错误信息
        let ErrorMsgWidth: CGFloat = 200
        let ErrorMsgHeight: CGFloat = 40
        errorMessage.frame = CGRectMake(
            (Constants.ScreenRect.width - ErrorMsgWidth)/2,
            100 + ImageHeight + 10,
            ErrorMsgWidth,
            ErrorMsgHeight)
        errorMessage.numberOfLines = 0
        errorMessage.textAlignment = NSTextAlignment.Center
        errorMessage.text = "网络不给力，链接错误啊！"
        errorMessage.font = Constants.Font2
        self.addSubview(errorMessage)
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
