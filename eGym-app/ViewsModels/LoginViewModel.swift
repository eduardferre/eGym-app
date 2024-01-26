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
    @Published var isDisabled = false
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    
    @Published var createLoginResponse: CreateLoginResponse?
    
    func createLogin(request: CreateLoginRequest) async {
        await TransactionServices.shared.callCreateLogin(parameters: request.dictionary ?? [:]) { response in
            if let response = response {
                self.errorMsg = ""
                Auth.shared.setCredentials(accessToken: response.accessToken, refreshToken: response.refreshToken)
            }
        } failure: { error in
            self.errorMsg = error.responseCode == 401 ? "Username/Password are invalid!" : "Ooops! There's a problem, sorry!"
            self.hasFailed = true
            }
    }
    
    func validate() {
        if username.trimmingCharacters(in: .whitespaces).isEmpty &&
            password.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = true
            isPasswordEmpty = true
            isDisabled = true
        } else if username.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = true
            isPasswordEmpty = false
            isDisabled = true
        } else if password.trimmingCharacters(in: .whitespaces).isEmpty {
            isUsernameEmpty = false
            isPasswordEmpty = true
            isDisabled = true
        } else {
            isUsernameEmpty = false
            isPasswordEmpty = false
            isDisabled = false
        }
    }
    
    func setHasFailedFalse() {
        if self.hasFailed {
            self.hasFailed = false
        }
    }
}
