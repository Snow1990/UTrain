//
//  PageInfo.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class PageInfo {
    
    // 页码
    var pageNumber: Int!
    // 每页显示数量
    var pageSize: Int!
    // 总记录数
    var total: Int!
    // 总页数
    var pageCount: Int!
    // 当前页包含的课程列表
    var currentCourses = [CourseInfo]()
    // 当前页包含的评论
    var currentComments = [CommentInfo]()
    
    init(pageCoursesJson maxType: NSDictionary) {
        self.pageNumber  = maxType["pageNo"] as? Int
        self.pageSize = maxType["pageSize"] as? Int
        self.total = maxType["total"] as? Int
        self.pageCount = maxType["pageCount"] as? Int
        if let json = maxType["rows"] as? [NSDictionary] {
            for course in json {
                let courseInfo = CourseInfo(bannerCoursesJson: course)
                self.currentCourses.append(courseInfo)
            }
        }
        
    }

    init(pageCommentsJson maxType: NSDictionary) {
        self.pageNumber  = maxType["pageNo"] as? Int
        self.pageSize = maxType["pageSize"] as? Int
        self.total = maxType["total"] as? Int
        self.pageCount = maxType["pageCount"] as? Int
        if let json = maxType["rows"] as? [NSDictionary] {
            for comment in json {
                let commentInfo = CommentInfo(commentJson: comment)
                
                self.currentComments.append(commentInfo)
            }
        }
        
    }
    // 测试
    init() {
        self.pageNumber = 1
        self.pageSize = 10
        self.total = 2
        self.pageCount = 1
        let comment = CommentInfo(
            comment: "想请教郭老师啊，请留个联系方式.想请教郭老师啊，请留个联系方式.",
            time: "2015-03-01 00:00:00",
            touristName: "1425185556995",
            userType: 1)
        self.currentComments.append(comment)
    }
}



