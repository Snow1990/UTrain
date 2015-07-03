//
//  CourseCollectionHeader.swift
//  UTrain
//
//  Created by SN on 15/6/11.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCollectionHeader: UICollectionReusableView {
    
 
    var lable = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 标题
        lable.frame = CGRectMake(
            26 * Constants.Scale,
            22 * Constants.Scale,
            500 * Constants.Scale,
            36 * Constants.Scale)
        lable.font = Constants.Font3
        lable.textColor = Constants.MainColor
        self.addSubview(lable)

        
//        let Scale: CGFloat = 0.3
//        let Width = 22 * Scale
//        let Height = 40 * Scale
//        let X = Constants.ScreenRect.width - Width - 20
//        let Y = (40 - Height)/2
        
        imageView.frame = CGRectMake(
            674 * Constants.Scale,
            30 * Constants.Scale,
            13 * Constants.Scale,
            24 * Constants.Scale)
        imageView.image = UIImage(named: "home_more")
//        imageView.backgroundColor = UIColor.redColor()
        self.addSubview(imageView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    

    
}
