//
//  Json.swift
//  JsonParsing
//
//  Created by Sharad Kumar on 11/8/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import Foundation

struct User: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
extension User{
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case completed
    }
}
