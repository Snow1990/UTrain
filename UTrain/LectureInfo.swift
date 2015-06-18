//
//  LectureInfo.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class LectureInfo {
    
    var id: String!
    var name: String!
    //讲师描述
    var description: String?
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}