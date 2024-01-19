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
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
    }
}
