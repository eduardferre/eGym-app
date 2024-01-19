//
//  CreateLoginRequest.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 19/1/24.
//

import Foundation

struct CreateLoginRequest: Codable {
    var username: String?
    var password: String?
}
