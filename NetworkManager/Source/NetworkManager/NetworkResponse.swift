//
//  NetworkResponse.swift
//  Network
//
//  Created by qihoo on 2023/2/24.
//

import Foundation
import Moya
import RxSwift
import SwiftyJSON

public extension Response {
    
    /// Response data processing
    /// - Parameters:
    ///   - target: TargetType
    ///   - observer: observer
    public func resultProcessing<T: TargetType>(_ target: T, observer: AnyObserver<JSON>) {
        switch target.task {
        case .uploadMultipart, .requestParameters, .requestPlain, .uploadCompositeMultipart:
            guard let jsonAny = (try? JSONSerialization.jsonObject(with: self.data, options: [])) else {
                observer.onError(NetworkError.jsonSerializationFailed(message: "JSON parsing failed"))
                return
            }
            self.replaceable(jsonAny, observer: observer)
        default:
            break
        }
    }
    
    /// The method can be replaced according to the needs of the project
    /// - Parameters:
    ///   - jsonAny: response data
    ///   - observer: observer
    public func replaceable(_ jsonAny: Any, observer: AnyObserver<JSON>) {
//        guard let _ = jsonAny as? [String: Any] else {
//            observer.onError(NetworkError.jsonToDictionaryFailed(message: "Failed to convert JSON to dictionary"))
//            return
//        }
//        let code = dict["code"] as? Int ?? -1
//        let msg = dict["msg"] as? String ?? "null"
//        if code != 0 {
//            observer.onError(NetworkError.exception(message: msg))
//            return
//        }
        let json = JSON(jsonAny)
        observer.onNext(json)
        observer.onCompleted()
    }
}
