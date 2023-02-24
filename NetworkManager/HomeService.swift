//
//  HomeService.swift
//  NetworkManager
//
//  Created by qihoo on 2023/2/24.
//

import Foundation
import Moya

enum HomeService: TargetType {
    
    case home
    
    var baseURL: URL {
        switch self {
        case .home:
            return URL(string: "https://raw.githubusercontent.com/")!
        }
    }
    
    var path: String {
        switch self {
        case .home:
            return "FicowShen/MoyaWithRxSwiftDemo/master/MoyaWithRxSwiftDemo/json/basic_info.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .home:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .home:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
}
