//
//  CreateLoginResponse.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 19/1/24.
//

import Foundation

struct CreateLoginResponse: Codable {
    var accessToken: String
    var refreshToken: String
    var tokenType: String
}
