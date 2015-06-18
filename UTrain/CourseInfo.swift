//
//  CourseInfo.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation


class CourseInfo:NSObject {
    
    //课程ID
    var id: String!
    //课程名称
    var name: String!
    //总点击量
    var hits: Int?
    //平均星级得分
    var avgStarScore: Double?
    //课程banner图片的相对路径
    var imagePath: String?
    //课程来源
    var sourceName: String?
    
    
    //课程小类ID
    var minTypeId: String?
    //课程小类名称
    var minTypeName: String?
    //课程视频播放参数unique
    var unique: String?
    //描述或简介
    var courseDescription: String?
    //讲师
    var lectureInfo: LectureInfo?
    //true：已收藏；false：未收藏
    var favorites = false
    
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    init(bannerCoursesJson course: NSDictionary) {
        self.id  = course["id"] as? String
        self.name = course["name"] as? String
        self.hits = course["hits"] as? Int
        self.avgStarScore = course["avg_star_score"] as? Double
        self.imagePath = course["img_path"] as? String
        self.sourceName = course["source_name"] as? String
        
        if let lectureId = course["teacher_id"] as? String,
            let lectureName = course["teacher_name"] as? String {
                lectureInfo = LectureInfo(id: lectureId, name: lectureName)
        }
    }

}