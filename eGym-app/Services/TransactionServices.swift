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
        
        print(parameters)
        
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
}
