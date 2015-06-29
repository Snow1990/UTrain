//
//  LoadingCollectionViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/19.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: UICollectionReusableView {
    
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
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let labelFrame = CGRectMake(0, 0, frame.width, frame.height)
        label.frame = labelFrame
        label.textColor = UIColor.blackColor()
        label.text = self.text
        label.font = Constants.FootNoteFont
        label.textAlignment = .Center
        label.baselineAdjustment = UIBaselineAdjustment.AlignCenters

        addSubview(label)
    }

}
