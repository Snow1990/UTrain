//
//  PopularRecomendHeader.swift
//  UTrain
//
//  Created by SN on 15/6/29.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class PopularRecomendHeader: UITableViewHeaderFooterView {

    
    var lable = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let Scale: CGFloat = 0.4
        let Width = 40 * Scale
        let Height = 40 * Scale
        
        imageView.frame = CGRectMake(
            40 - Width,
            40 - Height,
            Width,
            Height)
        imageView.image = UIImage(named: "search_hot")
        self.addSubview(imageView)
        
        lable.frame = CGRectMake(
            50,
            15,
            UIScreen.mainScreen().bounds.width-40,
            40)
        lable.font = Constants.GenneralFont
        lable.textColor = UIColor.grayColor()
//        lable.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        self.addSubview(lable)

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
