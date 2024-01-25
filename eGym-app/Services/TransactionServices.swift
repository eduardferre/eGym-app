//
//  TransactionServices.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 19/1/24.
//

import Foundation
import Alamofire

struct TransactionServices {
    public static let shared = TransactionServices()
    
    func callCreateLogin(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateLoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/x-www-form-urlencoded"
        
        let parameters: [String: String] = [
            "username": "eduardferre",
            "password": "edu",
            "grant_type": "password"
        ]
        
        await APIManager.shared.callAPI(strURL: Constants.URL.endpointLogin, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let createLoginResponse = try JSONDecoder().decode(CreateLoginResponse.self, from: data)
                    success(createLoginResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
        }, failure: { error in
            failure(FailureMessage(error))})
    }
    
    func callCreateRegister(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateRegisterResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        let parameters: [String: Any?] = [
          "username": "eduuu",
          "password": "edu",
          "firstname": "Eduard",
          "lastname": "Ferre",
          "fullname": "Eduard Ferre",
          "email": "eduard@gmail.com",
          "phone": "616127758",
          "birthDate": "2000-04-07",
          "age": 0,
          "height": 0,
          "weight": 0,
          "physicalActivity": 0,
          "role": "",
          "followers": [],
          "following": [],
          "postsLog": [],
          "routinesLog": [],
          "routines": [],
          "profilePicture": "",
          "backgroundPicture": "",
          "public": true
        ]
        
        await APIManager.shared.callAPI(strURL: Constants.URL.endpointRegister, queryItems: queryItems, method: .post, headers: headers, parameters: parameters as Parameters, success: { response in
            do {
                if let data = response.data {
                    let createRegisterResponse = try JSONDecoder().decode(CreateRegisterResponse.self, from: data)
                    success(createRegisterResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
        }, failure: { error in
            failure(FailureMessage(error))})
    }
}
