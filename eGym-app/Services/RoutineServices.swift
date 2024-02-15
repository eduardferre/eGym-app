//
//  RoutineServices.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation
import Alamofire

struct RoutineServices {
    public static let shared = RoutineServices()
    
    func callGetRoutinesByCreator(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: [RoutineModel]?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        headers.add(.authorization(bearerToken: Auth.shared.getAccessToken() ?? "error"))
        
        if let username = Auth.shared.getUsername() {
            let url = Constants.URL.endpointGetRoutinesByCreator.appending(username)
            
            await APIManager.shared.callAPI(strURL: url, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
                do {
                    if let data = response.data {
                        let getRoutineResponse = try JSONDecoder().decode([RoutineModel].self, from: data)
                        success(getRoutineResponse)
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
