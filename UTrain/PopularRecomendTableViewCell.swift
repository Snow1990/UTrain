//
//  PopularRecomendTableViewCell.swift
//  UTrain
//
//  Created by SN on 15/6/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class PopularRecomendTableViewCell: UITableViewCell {

    
    let CellHight: CGFloat = 40

    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
            setNumberLabelColor()
        }
    }
    var numberLabel = UILabel()
    var titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let rect = UIScreen.mainScreen().bounds

        numberLabel.frame = CGRectMake(5, 5, 60, CellHight - 10)
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters

        numberLabel.backgroundColor = UIColor.clearColor()
        self.addSubview(numberLabel)
        
        titleLabel.frame = CGRectMake(numberLabel.frame.width, 5, rect.width - numberLabel.frame.width - 20, CellHight - 10)
        titleLabel.font = Constants.GenneralFont
        titleLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters

        self.addSubview(titleLabel)
        
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
    func setNumberLabelColor() {
        switch number {
        case 1: numberLabel.textColor = UIColor.redColor()
        case 2: numberLabel.textColor = UIColor(red: 222/255, green: 100/255, blue: 0/255, alpha: 1)
        case 3: numberLabel.textColor = UIColor(red: 217/255, green: 162/255, blue: 16/255, alpha: 1)
        default: numberLabel.textColor = UIColor(red: 110/255, green: 115/255, blue: 115/255, alpha: 1)
        }
    }


}
