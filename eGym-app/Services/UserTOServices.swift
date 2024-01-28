//
//  UserTOServices.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 19/1/24.
//

import Foundation
import Alamofire

struct UserTOServices {
    public static let shared = UserTOServices()
    
    func callGetRoutinesByCreator(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: [GetRoutinesTOResponse]?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        headers.add(.authorization(bearerToken: Auth.shared.getAccessToken() ?? "error"))
        
        if let username = Auth.shared.getUsername() {
            let url = Constants.URL.endpointGetRoutinesTOByCreator.appending(username)
            
            await APIManager.shared.callAPI(strURL: url, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
                do {
                    if let data = response.data {
                        let getRoutinesTOResponse = try JSONDecoder().decode([GetRoutinesTOResponse].self, from: data)
                        success(getRoutinesTOResponse)
                    }
                } catch {
                    print("ERROR: " + String(error.asAFError?.responseCode ?? 0))
                    failure(error as! FailureMessage)
                }
            }, failure: { error in
                print("ERROR: " + error.localizedDescription)
                failure(error)
            })
        }
    }
    
    func callGetExercisesByCreator(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: [GetExercisesTOResponse]?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        headers.add(.authorization(bearerToken: Auth.shared.getAccessToken() ?? "error"))
        
        if let username = Auth.shared.getUsername() {
            let url = Constants.URL.endpointGetExercisesTOByCreator.appending(username)
            
            await APIManager.shared.callAPI(strURL: url, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
                do {
                    if let data = response.data {
                        let getExercisesTOResponse = try JSONDecoder().decode([GetExercisesTOResponse].self, from: data)
                        success(getExercisesTOResponse)
                    }
                } catch {
                    print("ERROR: " + String(error.asAFError?.responseCode ?? 0))
                    failure(error as! FailureMessage)
                }
            }, failure: { error in
                print("ERROR: " + error.localizedDescription)
                failure(error)
            })
        }
    }
}
