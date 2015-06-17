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
    
    
    //文件存储
    static let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
        NSSearchPathDomainMask.UserDomainMask, true)
    static let DocumentDirectory = path[0] as! String
    static let SDCard = DocumentDirectory
    // 客户端文件夹包名
    static let DirPath = SDCard + "/mutrain"
    // 客户端图片缓存文件夹包名
    static let ImgPath = DirPath + "/images"
    // 偏好设置文件名
    static let PreferFileName = "mutrain"
    static let PageSize = 20
    // 测试
    static let Domain = "http://120.24.79.127:8081"
//    // 正式
//    static let Domain = "http://edu.youths.org.cn"
    // 登陆
    static let Login = Domain + "/ws/app/auth/stu/login"
    // 获取公开课推荐的banner课程
    static let GetBannerCourses = Domain + "/ws/app/public/reco/getBannerCourses"
    // 获取公开课推荐的body课程
    static let GetBodyCourses = Domain + "/ws/app/public/reco/getBodyCourses"
    // 获取单个公开课课程的详细信息
    static let GetPublicCourse = Domain + "/ws/app/public/getCourse"
    // 获取公开课相关推荐课程（共10个）
    static let GetPublicRecommendCourses = Domain + "/ws/app/public/getRecommendCourses"
    // 获取公开课热门搜索课程（共10个）
    static let GetHotSearch = Domain + "/ws/app/public/getHotSearch"
    // 获取公开课课程列表
    static let GetPublicCourses = Domain + "/ws/app/public/getCourses"
    // 获取公开课的课程类型（只包含大类）
    static let GetPublicMaxType = Domain + "/ws/app/public/getMaxType"
    // 获取公开课课程评论列表
    static let PublicComments = Domain + "/ws/app/public/comment/list"
    // 保存公开课课程评论
    static let SavePublicComment = Domain + "/ws/app/public/comment/save"
    // 公开课收藏操作
    static let SavePublicFavourite = Domain + "/ws/app/public/favorites/save"
    // 公开课取消收藏操作
    static let DeletePublicFavourite = Domain + "/ws/app/public/favorites/delete"
    // 获取培训班的课程类型
    static let GetSeriesType = Domain + "/ws/app/series/getType"
    // 获取培训班的系列课列表
    static let GetSeriesCourses = Domain + "/ws/app/series/getSeriesCourses"
    
    
    
    //获取文件路径
    func getFilePath(#fileName:String)->String{
        var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentDirectory = path[0] as! String
        return documentDirectory.stringByAppendingPathComponent(fileName)
    }
}