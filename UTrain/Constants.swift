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
    
    // NSUserDefault中键值名
    static let FirstLaunchNUD = "UTrainFirstLaunch"
    
    
    // 场景过度
    static let ToSearchSegue = "toSearchSegue"
    static let ToCourseDetailSegue = "toCourseDetailSegue"
    
    
    // 可重用cellID
    static let HomePageReusableCellID = "HomePageCell"
    static let HomePageAdReusableCellID = "HomePageAdCell"
    static let SideMenuReusableCellID = "SideMenuCell"
    static let PopularRecomendReusableCellID = "SearchResultCell"
    static let SearchResultReusableCellID = "PopularRecomendCell"
    static let CourseCommentReusableCellID = "CourseCommentCell"
    static let CollectionHeaderViewReusableCellID = "CollectionHeaderView"
    static let CollectionFooterViewReusableCellID = "CollectionFooterView"
    static let CollectionLoadingViewReusableCellID = "CollectionLoadingView"
    static let PopularRecomendHeaderReusableCellID = "PopularRecomendHeader"
    
    
    // 颜色
//    static let DarkGreen = UIColor(red: 35/255, green: 144/255, blue: 30/255, alpha: 1)
    static let TabViewBGGreen = UIColor(red: 217/255, green: 247/255, blue: 217/255, alpha: 0.8)
//    static let CellFooterColor = UIColor(red: 230/255, green: 237/255, blue: 229/255, alpha: 1)
//    static let OpenCourseBGColor = UIColor(red: 230/255, green: 237/255, blue: 229/255, alpha: 1)
    static let SideMenuBGColor = UIColor(red: 37/255, green: 155/255, blue: 36/255, alpha: 0.75)
    static let SelectedBGColor = UIColor(red: 240/255, green: 247/255, blue: 242/255, alpha: 1)
    static let SeparateColor = UIColor(red: 219/255, green: 225/255, blue: 221/255, alpha: 1)
    
    static let MainColor = UIColor(red: 37/255, green: 155/255, blue: 36/255, alpha: 1)
    static let backgroundColor = UIColor(red: 241/255, green: 248/255, blue: 240/255, alpha: 1)
    static let AssistColor1 = UIColor(red: 163/255, green: 233/255, blue: 164/255, alpha: 1)
    static let AssistColor2 = UIColor(red: 249/255, green: 212/255, blue: 10/255, alpha: 1)
    static let AssistColor3 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.87)
    static let AssistColor4 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.73)
    static let AssistColor5 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.54)
    static let AssistColor6 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let AssistColor7 = UIColor(red: 5/255, green: 111/255, blue: 0/255, alpha: 1)
    
    // 字体
//    static let Font1 = UIFont.boldSystemFontOfSize(12)
//    static let Font2 = UIFont.boldSystemFontOfSize(14)
//    static let Font3 = UIFont.boldSystemFontOfSize(18)
//    static let Font4 = UIFont.boldSystemFontOfSize(20)
    
    static let Font1 = UIFont.systemFontOfSize(12)
    static let Font2 = UIFont.systemFontOfSize(14)
    static let Font3 = UIFont.systemFontOfSize(18)
    static let Font4 = UIFont.systemFontOfSize(20)

    
 
    
//    static let FootNoteFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
//    static let HeadlineFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
//    static let BodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
//    static let GenneralFont = UIFont.systemFontOfSize(13)
    
    // 和设计图比例
    static let ScreenRect = UIScreen.mainScreen().bounds
    static let Scale = ScreenRect.width/720
    static let NavScale: CGFloat = 44/96
    
    
    

    

}