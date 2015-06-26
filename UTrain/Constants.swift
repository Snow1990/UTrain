//
//  Constants.swift
//  UTrain
//
//  Created by SN on 15/6/8.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation
import UIKit



struct Constants {
    enum CourseType: String{
        case TDW = "团（队）务"
        case GYFZ = "公益发展"
        case JYCY = "就业创业"
        case XQAH = "兴趣爱好"
        case KWHD = "课外活动"
        case QGCSJPK = "全国城市精品课"
        case WYGKK = "网易公开课"
    }
    
    //NSUserDefault中键值名
    static let FirstLaunchNUD = "UTrainFirstLaunch"
    
    
    //场景过度
    static let ToSearchSegue = "toSearchSegue"
    static let ToCourseDetailSegue = "toCourseDetailSegue"
    
    
    //可重用cellID
    static let HomePageReusableCellID = "HomePageCell"
    static let HomePageAdReusableCellID = "HomePageAdCell"
    static let SideMenuReusableCellID = "SideMenuCell"
    static let PopularRecomendReusableCellID = "PopularRecomendCell"
    static let CollectionHeaderViewReusableCellID = "CollectionHeaderView"
    static let CollectionFooterViewReusableCellID = "CollectionFooterView"
    static let CollectionLoadingViewReusableCellID = "CollectionLoadingView"
    
    
    //颜色
    static let DarkGreen = UIColor(red: 35/255, green: 144/255, blue: 30/255, alpha: 1)
    static let LightGreen = UIColor(red: 217/255, green: 247/255, blue: 217/255, alpha: 1)
    static let CellFooterColor = UIColor(red: 230/255, green: 237/255, blue: 229/255, alpha: 1)
    static let OpenCourseBGColor = UIColor(red: 230/255, green: 237/255, blue: 229/255, alpha: 1)
    static let SideMenuBGColor = UIColor(red: 54/255, green: 134/255, blue: 50/255, alpha: 0.8)

    

}