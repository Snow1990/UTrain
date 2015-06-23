//
//  MaxType.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class MaxType {
    //大类ID
    var maxTypeId: String!
    //大类名称
    var maxTypeName: String!
    //大类包含的课程
    var maxTypeCourses = [CourseInfo]()
    
    init(maxType: NSDictionary) {
        self.maxTypeId  = maxType["id"] as? String
        self.maxTypeName = maxType["name"] as? String
    }
    
    init(bodyCoursesJson maxType: NSDictionary) {
        self.maxTypeId  = maxType["max_type_id"] as? String
        self.maxTypeName = maxType["max_type_name"] as? String
        if let json = maxType["max_type_courses"] as? [NSDictionary] {
            for course in json {
                let courseInfo = CourseInfo(bannerCoursesJson: course)
                self.maxTypeCourses.append(courseInfo)
            }
        }

    }
}