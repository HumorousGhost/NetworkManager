//
//  UserInfo.swift
//  NetworkManager
//
//  Created by qihoo on 2023/2/24.
//

import Foundation
import SwiftyJSON

struct UserInfo: JSONable {
    
    var name: String = ""
    var age: Int = 0
    
    init(_ data: JSON) {
        self.name = data["name"].stringValue
        self.age = data["age"].intValue
    }
}
