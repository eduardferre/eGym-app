//
//  RegisterViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 10/1/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    @Published var birthDate = Date()
    
    @Published var isUsernameValid = false
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var isVerifyPasswordValid = false
    @Published var isBirthDateValid = false

    @Published var isUsernameLoading = true
    @Published var isEmailLoading = true
    @Published var isPasswordLoading = true
    @Published var isVerifyPasswordLoading = true
    
    @Published var isUsernameEmpty = false
    @Published var isEmailEmpty = false
    @Published var isPasswordEmpty = false
    @Published var isVerifyPasswordEmpty = false
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    
    @Published var createRegisterResponse: CreateRegisterResponse?
    
    func createRegister(request: CreateRegisterRequest) async {
        await TransactionServices.shared.callCreateRegister(parameters: request.dictionary ?? [:]) { response in
            if let response = response {
                self.errorMsg = ""
                print(response)
            }
        } failure: { error in
            self.errorMsg = error.responseCode == 401 ? "Username/Password are invalid!" : "Ooops! There's a problem, sorry!"
            self.hasFailed = true
            }
    }
    
    func setHasFailedFalse() {
        if self.hasFailed {
            self.hasFailed = false
        }
    }
}
