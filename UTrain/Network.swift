//
//  Network.swift
//  UTrain
//
//  Created by SN on 15/6/17.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation
import Alamofire


@objc public protocol ResponseCollectionSerializable {
    static func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> [Self]
}
extension Alamofire.Request {
    public func responseCollection<T: ResponseCollectionSerializable>(completionHandler: (NSURLRequest, NSHTTPURLResponse?, [T]?, NSError?) -> Void) -> Self {
        let serializer: Serializer = { (request, response, data) in
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let (JSON: AnyObject?, serializationError) = JSONSerializer(request, response, data)
            if response != nil && JSON != nil {
                return (T.collection(response: response!, representation: JSON!), nil)
            } else {
                return (nil, serializationError)
            }
        }
        return response(serializer: serializer, completionHandler: { (request, response, object, error) in
            completionHandler(request, response, object as? [T], error)
        })
    }
}

@objc public protocol ResponseObjectSerializable {
    init(response: NSHTTPURLResponse, representation: AnyObject)
}

extension Alamofire.Request {
    
    public func responseObject<T: ResponseObjectSerializable>(completionHandler: (NSURLRequest, NSHTTPURLResponse?, T? , NSError?) -> Void) -> Self {
        let serializer: Serializer = { (request, response, data) in
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let (JSON: AnyObject?, serializationError) = JSONSerializer(request, response, data)
            if response != nil && JSON != nil {
                return (T(response: response!, representation: JSON!) , nil)
            } else {
                return (nil, serializationError)
            }
        }
        return response(serializer: serializer, completionHandler: { (request, response, object, error) in
            completionHandler(request, response, object as? T, error)
        })
    }
}

extension Alamofire.Request {
    /**
    创建了一个Image的Serializer
    */
    public class func ImageResponseSerializer() -> Serializer {
        return { request, response, data in
            if data == nil || data?.length == 0 {
                return (nil, nil)
            }
            var serializationError: NSError?
            
            let image = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
            
            return (image, serializationError)
        }
    }
    /**
    Image的处理闭包
    */
    public func responseImage(completionHandler: (NSURLRequest, NSHTTPURLResponse?, UIImage?, NSError?) -> Void) -> Self {
        return response(serializer: Request.ImageResponseSerializer(), completionHandler: { request, response, image, error in
            completionHandler(request, response, image as? UIImage, error)
        })
    }
}

struct Network {
    
    
    enum Router: URLRequestConvertible {

        case Image(imagePath:String)
        case CourseByPage(pageNo: Int, pageSize: Int)
        case CourseByType(pageNo: Int, maxTypeId: String)
        
        var URLRequest: NSURLRequest {
            let (path:String, parameters: [String:AnyObject]) = {
                switch self {
                case Router.Image(let imagePath):
                    let params = [
                        "image": imagePath
                    ]
                    return (GetImage, params)
                case Router.CourseByPage(let pageNo, let pageSize):
                    let params: [String:AnyObject] = [
                        "pageNo": pageNo,
                        "pageSize": pageSize
                    ]
                    return (GetPublicCourses, params)
                
                case Router.CourseByType(let pageNo, let maxTypeId):
                let params: [String:AnyObject] = [
                    "pageNo": pageNo,
                    "pageSize": 20,
                    "maxTypeId": maxTypeId
                ]
                return (GetPublicCourses, params)
                }
            }()
        
            let url = NSURL(string: path)!
            let request = NSURLRequest(URL: url)
            
            return Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters).0
        }
        
    }

    
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
    // 获取图片资源
    static let GetImage = Domain + "/file/load"
    
    
    //获取文件路径
    func getFilePath(#fileName:String)->String{
        var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentDirectory = path[0] as! String
        return documentDirectory.stringByAppendingPathComponent(fileName)
    }

}