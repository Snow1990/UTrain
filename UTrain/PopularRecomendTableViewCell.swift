//
//  PopularRecomendTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class PopularRecomendTableViewCell: UITableViewCell {

    
//    let CellHight: CGFloat = 40

    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
            setNumberLabelColor()
        }
    }
    var numberLabel = UILabel()
    var titleLabel = UILabel()
    var separateImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // 数字
        numberLabel.frame = CGRectMake(
            32 * Constants.Scale,
            20 * Constants.Scale,
            44 * Constants.Scale,
            44 * Constants.Scale)
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        numberLabel.backgroundColor = UIColor.clearColor()
        self.addSubview(numberLabel)
        
        // 标题
        titleLabel.frame = CGRectMake(
            100 * Constants.Scale,
            20 * Constants.Scale,
            555 * Constants.Scale,
            44 * Constants.Scale)
        titleLabel.font = Constants.Font2
        titleLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        self.addSubview(titleLabel)
        
        // 分割线
        separateImageView = UIImageView(frame: CGRectMake(
            0,
            80 * Constants.Scale - 2,
            Constants.ScreenRect.width,
            2))
        let Image = UIImage(named: "search_separate")!
        separateImageView.image = Image
        separateImageView.backgroundColor = UIColor.clearColor()
        self.addSubview(separateImageView)
        
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func getCellHeight() -> CGFloat {
        return 80 * Constants.Scale
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNumberLabelColor() {
        switch number {
        case 1: numberLabel.textColor = UIColor.redColor()
        case 2: numberLabel.textColor = UIColor(red: 222/255, green: 100/255, blue: 0/255, alpha: 1)
        case 3: numberLabel.textColor = UIColor(red: 217/255, green: 162/255, blue: 16/255, alpha: 1)
        default: numberLabel.textColor = UIColor(red: 110/255, green: 115/255, blue: 115/255, alpha: 1)
        }
    }


}
