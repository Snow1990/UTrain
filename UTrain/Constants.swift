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
    
    //NSUserDefault中键值名
    static let FirstLaunchNUD = "UTrainFirstLaunch"
    
    
    //场景过度
    static let ToSearchSegue = "toSearchSegue"
    static let ToCourseDetailSegue = "toCourseDetailSegue"
    
    
    //可重用cellID
    static let HomePageReusableCellID = "HomePageCell"
    static let HomePageAdReusableCellID = "HomePageAdCell"
    static let CollectionHeaderViewReusableCellID = "CollectionHeaderView"
    static let CollectionFooterViewReusableCellID = "CollectionFooterView"
    
    
    //颜色
    static let DarkGreen = UIColor(red: 35/255, green: 144/255, blue: 30/255, alpha: 1)
    static let LightGreen = UIColor(red: 217/255, green: 247/255, blue: 217/255, alpha: 0.5)
    static let CellFooterColor = UIColor(red: 230/255, green: 237/255, blue: 229/255, alpha: 0.5)
    
    
//    
//    static let SDCARD =
//    
//    
//    public final static String SDCARD = Environment
//    .getExternalStorageDirectory().toString();
//    // 客户端文件夹包名
//    public final static String DIR_PATH = SDCARD + "/mutrain";
//    // 客户端图片缓存文件夹包名
//    public final static String IMG_PATH = DIR_PATH + "/images";
//    // 偏好设置文件名
//    public final static String PREFER_FILE_NAME = "mutrain";
//    public final static Integer PAGE_SIZE = 20;
//    // 测试
//    public final static String DOMAIN = "http://120.24.79.127:8081";
//    // 正式
//    // public final static String DOMAIN="http://edu.youths.org.cn";
//    // 登陆
//    public final static String LOGIN = DOMAIN + "/ws/app/auth/stu/login";
//    // 获取公开课推荐的banner课程
//    public final static String GET_BANNER_COURSES = DOMAIN
//    + "/ws/app/public/reco/getBannerCourses";
//    // 获取公开课推荐的body课程
//    public final static String GET_BODY_COURSES = DOMAIN
//    + "/ws/app/public/reco/getBodyCourses";
}