//
//  Page.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class Page {
    
    //页码
    var pageNumber: Int!
    //每页显示数量
    var pageSize: Int!
    //总记录数
    var total: Int!
    //总页数
    var pageCount: Int!
    //当前页包含的课程列表
    var rows: NSData?
}