//
//  Comment.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation


class Comment {
    //课程ID
    var courseId: String!
//    //学员ID（登录学员必传值）
//    var stuId: String!
    //评论内容
    var content: String!
    //评论时间
    var time: Int!
    //游客名称
    var touristName: String?
    //用户类型（1：游客；2：学员；3：讲师；4：匿名用户）
    var userType: Int!
    //学员
    var student: Student?
}