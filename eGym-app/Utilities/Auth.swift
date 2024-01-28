//
//  Auth.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 22/1/24.
//

import Foundation
import SwiftKeychainWrapper

class Auth: ObservableObject {
    
    static let shared: Auth = Auth()
    private let keychain: KeychainWrapper = KeychainWrapper.standard
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        isLoggedIn = hasAccessToken()
    }
    
    func getCredentials() -> Credentials {
        return Credentials(
            accessToken: keychain.string(forKey: KeychainKey.accessToken.rawValue),
            refreshToken: keychain.string(forKey: KeychainKey.refreshToken.rawValue),
            username: keychain.string(forKey: KeychainKey.username.rawValue)
        )
    }
    
    func setCredentials(accessToken: String, refreshToken: String, username: String) {
        keychain.set(accessToken, forKey: KeychainKey.accessToken.rawValue)
        keychain.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
        keychain.set(username, forKey: KeychainKey.username.rawValue)
        
        isLoggedIn = true
    }
    
    func hasAccessToken() -> Bool {
        return getCredentials().accessToken != nil
    }
    
    func getAccessToken() -> String? {
        return getCredentials().accessToken
    }

    func getRefreshToken() -> String? {
        return getCredentials().refreshToken
    }
    
    func getUsername() -> String? {
        return getCredentials().username
    }

    func logout() {
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.accessToken.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.refreshToken.rawValue)
        
        isLoggedIn = false
    }
    
}
