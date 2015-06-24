//
//  OpenCourseMaxTypeInfo.swift
//  UTrain
//
//  Created by SN on 15/6/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class OpenCourseMaxTypeInfo {
    
    // 当前课程按页码分组
    var coursesByPage = [PageInfo]()
    
    // 当前大类
    var currentMaxType:MaxType!
    // 当前页码
    var currentPage = 1
    // 是否正在下载数据
    var isLoading = false
    // 数据下载完成
    var isLoaded = false
}