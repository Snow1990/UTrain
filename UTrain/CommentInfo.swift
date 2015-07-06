//
//  CommentInfo.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation


class CommentInfo {
    //课程ID
//    var courseId: String!
//    //学员ID（登录学员必传值）
//    var stuId: String!
    //评论内容
    var content: String!
    //评论时间
    var time: String!
    //游客名称
    var touristName: String!
    //用户类型（1：游客；2：学员；3：讲师；4：匿名用户）
    var userType: Int!
//    //学员
//    var studentInfo: StudentInfo?
    var nickName: String?
    var headImage: String?
    
    init(comment: String,time: String, touristName: String, userType: Int) {
        self.content = comment
        self.time = time
        self.touristName = touristName
        self.userType = userType
    }
    init(commentJson comment: NSDictionary) {
        self.content  = comment["content"] as? String
        self.time = comment["create_time"] as? String
        self.touristName = comment["tourist_name"] as? String
        self.userType = comment["user_type"] as? Int
        self.nickName = comment["stu_nickname"] as? String
        self.headImage = comment["head_image"] as? String
        
        
    }
}