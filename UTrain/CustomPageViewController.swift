//
//  CustomPageViewController.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit


//引入第三方类库，自定义起始页面
class CustomPageViewController: UIViewController, BWWalkthroughPage {

    @IBOutlet var imageView:UIImageView?
    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var textLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: BWWalkThroughPage protocol
    
    func walkthroughDidScroll(position: CGFloat, offset: CGFloat) {
        var tr = CATransform3DIdentity
        tr.m34 = -1/500.0
        
        titleLabel?.layer.transform = CATransform3DRotate(tr, CGFloat(M_PI) * (1.0 - offset), 1, 1, 1)
        textLabel?.layer.transform = CATransform3DRotate(tr, CGFloat(M_PI) * (1.0 - offset), 1, 1, 1)
        
        var tmpOffset = offset
        if(tmpOffset > 1.0){
            tmpOffset = 1.0 + (1.0 - tmpOffset)
        }
        imageView?.layer.transform = CATransform3DTranslate(tr, 0 , (1.0 - tmpOffset) * 200, 0)
    }

}
