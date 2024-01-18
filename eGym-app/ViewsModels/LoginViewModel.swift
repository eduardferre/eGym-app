//
//  LoginViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import Foundation
import SwiftyJSON

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isUsernameEmpty = false
    @Published var isPasswordEmpty = false
    private var loginJSON = JSON()
    
    init() {}
    
    func login() {
        if !validate() { return }
        
        
        loginJSON["username"] = JSON(username)
        //TODO: Encode password according backend
        loginJSON["password"] = JSON(password)
        
        print(loginJSON)
        
        //TODO: Call login endpoint and send information
    }
    
    private func validate() -> Bool {
        if username.trimmingCharacters(in: .whitespaces).isEmpty &&
            password.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = true
            isPasswordEmpty = true
            return false
        } else if username.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = true
            isPasswordEmpty = false
            return false
        } else if password.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = false
            isPasswordEmpty = true
            return false
        }
        
        isUsernameEmpty = false
        isPasswordEmpty = false
        return true
    }
}
