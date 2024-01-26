//
//  CreateRegisterRequest.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 25/1/24.
//

import Foundation

struct CreateRegisterRequest: Codable {
    var username: String
    var password: String
    var firstname: String
    var lastname: String
    var fullname: String
    var email: String
    var phone: String
    var birthDate: String
    var age: Int
    var height: Float
    var weight: Float
    var physicalActivity: Float
    var role: String
    var followers: [String]
    var following: [String]
    var postsLog: [String]
    var routinesLog: [String]
    var routines: [String]
    var profilePicture: String
    var backgroundPicture: String
    var isPublic: Bool

    private enum CodingKeys: String, CodingKey {
        case username, password, firstname, lastname, fullname, email, phone, birthDate, age, height, weight, physicalActivity, role, followers, following, postsLog, routinesLog, routines, profilePicture, backgroundPicture, isPublic = "public"
    }
}
