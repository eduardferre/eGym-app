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
    
    @Published var createLoginResponse: CreateLoginResponse?
    
    @Published var isUserAuthorized = false
    
    private var loginJSON = JSON()
    
    init() {}
    
    func createLogin(request: CreateLoginRequest) async {
        await TransactionServices.shared.callCreateLogin(parameters: request.dictionary ?? [:]) { response in
            if let response = response {
                print(response)
            }
        } failure: { error in
            return
            }
        isUserAuthorized = true
    }
    
    func validate() -> Bool {
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
