//
//  NetworkError.swift
//  Network
//
//  Created by qihoo on 2023/2/21.
//

import Foundation

// 网络错误处理枚举
public enum NetworkError: Error  {
    case jsonSerializationFailed(message: String)       // json解析失败
    case jsonToDictionaryFailed(message: String)        // json转字典失败
    case loginStateIsexpired(message: String?)          // 登录状态变化
    case serverResponse(message: String?, code: Int)    // 服务器返回的错误
    case exception(message: String)                     // 自定义错误
}

extension NetworkError {
    var message: String? {
        switch self {
        case let .jsonSerializationFailed(msg):
            return msg
        case let .jsonToDictionaryFailed(msg):
            return msg
        case let .loginStateIsexpired(msg):
            return msg
        case let .serverResponse(msg, _):
            return msg
        case let .exception(msg):
            return msg
        }
    }
    
    var code: Int {
        switch self {
        case let .serverResponse(_, code):
            return code
        default:
            return -1
        }
    }
}
