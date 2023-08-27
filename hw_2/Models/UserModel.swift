//
//  UserModel.swift
//  hw_2
//
//  Created by Антон Баландин on 23.08.23.
//

import Foundation

struct UserModel: Decodable {
    var response: [User]
}

struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last name"
        case photo = "photo 400 orig"
    }
}
