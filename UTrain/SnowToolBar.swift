//
//  SnowToolBar.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SnowToolBar: UIView {
    
    var backgroundView = UIView()
    var textFieldBackground = UIImageView()
    var textField = UITextField()
    var leftBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var searchBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let screenRect : CGRect = UIScreen.mainScreen().bounds
        let topHight : CGFloat = 20
        
        // 工具栏背景
        self.backgroundView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.backgroundView.backgroundColor = Constants.DarkGreen
        addSubview(self.backgroundView)
        
        // 返回按钮
        let Scale: CGFloat = 0.3
        let backWidth = 22 * Scale
        let backHeight = 40 * Scale
        self.leftBtn.frame = CGRectMake(10, 10 + topHight, 12, 24)
        self.leftBtn.setBackgroundImage(UIImage(named: "nav_back"), forState: UIControlState.Normal)
        self.leftBtn.tag = 1
        addSubview(self.leftBtn)

        // 搜索按钮
        self.searchBtn.frame = CGRectMake(screenRect.width - 24 - 10, 10 + topHight, 24, 24)
        self.searchBtn.setBackgroundImage(UIImage(named: "nav_icon2" ), forState: UIControlState.Normal)
        self.searchBtn.tag = 2
        addSubview(self.searchBtn)
        
        // 文本框背景
        self.textFieldBackground.frame = CGRectMake(24 + 10 * 2, 30 + topHight, screenRect.width - 24 * 2 - 10 * 4, 5)
        self.textFieldBackground.image = UIImage(named: "search_textfield_bg")
        addSubview(self.textFieldBackground)
        
        // 文本框
        self.textField.frame = CGRectMake(self.textFieldBackground.frame.origin.x + 5, 5 + topHight, self.textFieldBackground.frame.width - 10, 34)
        self.textField.borderStyle = UITextBorderStyle.None
        self.textField.backgroundColor = UIColor.clearColor()
        self.textField.textColor = UIColor.whiteColor()
        self.textField.placeholder = "请输入..."
        self.textField.tag = 3
        addSubview(self.textField)
        
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

extension UIImage {
    class func resizableImage(#named: String) -> UIImage {
        
        var image = UIImage(named: named)!
        
        let top: CGFloat = image.size.height * 0.6
        let bottom: CGFloat = image.size.height * 0.5
        let lAndr: CGFloat = image.size.height * 0.5
        
        return image.resizableImageWithCapInsets(UIEdgeInsets(top: top, left: lAndr, bottom: bottom, right: lAndr))
    }
}
