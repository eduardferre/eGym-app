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
    
    //TODO: Implement register validations and call register endpoint
    @Published var createRegisterResponse: CreateRegisterResponse?
    
    func createRegister(request: CreateRegisterResponse) async {
        await TransactionServices.shared.callCreateRegister(parameters: request.dictionary ?? [:]) { response in
            if let response = response {
                
            }
        } failure: { error in
            print(error)
            }
    }
    
}
