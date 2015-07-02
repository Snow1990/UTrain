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
        

        let Width = 28 * Constants.Scale
        let Height = 28 * Constants.Scale
//        let CellHeight = 90 * Constants.Scale
        
        imageView.frame = CGRectMake(
            25 * Constants.Scale,
            44 * Constants.Scale,
            Width,
            Height)
        imageView.image = UIImage(named: "search_hot")
        self.addSubview(imageView)
        
        lable.frame = CGRectMake(
            64 * Constants.Scale,
            44 * Constants.Scale,
            200 * Constants.Scale,
            28 * Constants.Scale)
        lable.font = Constants.Font2
        lable.textColor = UIColor.grayColor()
//        lable.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        self.addSubview(lable)

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    class func getHeaderHeight() -> CGFloat {
        return 90 * Constants.Scale
    }

}
