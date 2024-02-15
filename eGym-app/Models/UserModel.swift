//
//  UserModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import Foundation

struct UserModel: Codable {
    var id: String
    var username: String
    var fullname: String
    var followers: [String]
    var following: [String]
    var profilePicture: String
    var isPublic: Bool

    private enum CodingKeys: String, CodingKey {
        case id, username, fullname, followers, following, profilePicture, isPublic = "public"
    }
}
