//
//  CreateLoginRequest.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 19/1/24.
//

import Foundation

struct CreateLoginRequest: Codable {
    var grant_type: String
    var username: String
    var password: String
    var scope: String?
    var client_id: String?
    var client_secret: String?
}
