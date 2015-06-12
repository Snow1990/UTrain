//
//  CourseCollectionHeaderView.swift
//  UTrain
//
//  Created by SN on 15/6/11.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class CourseCollectionHeaderView: UICollectionReusableView {
    

    
    
    var lable = UILabel()
    var image = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lable.frame = CGRectMake(10, 0, UIScreen.mainScreen().bounds.width-50, 40)
        lable.text = "团（队）务"

        lable.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        lable.textColor = Constants.DarkGreen
//        lable.backgroundColor = UIColor.yellowColor()
        self.addSubview(lable)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    

    
}
