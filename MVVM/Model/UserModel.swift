//
//  UserModel.swift
//  MVVM
//
//  Created by Nitish on 26/09/21.
//

import Foundation

struct userModel: Codable {
    let userId: Int?
    let title: String?
    
    enum codingKeys: String,CodingKey {
        case userId = "userId", title = "title"
    }
}
