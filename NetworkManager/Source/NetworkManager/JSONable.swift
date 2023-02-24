//
//  JSONable.swift
//  Network
//
//  Created by qihoo on 2023/2/21.
//

import Foundation
import SwiftyJSON

public protocol JSONable {
    init(_ data: JSON)
}
