//
//  PostServices.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation
import Alamofire

struct PostServices {
    public static let shared = PostServices()
    
    func callGetPosts(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: [PostModel]?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) async {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        headers.add(.authorization(bearerToken: Auth.shared.getAccessToken() ?? "error"))
        
        let url = Constants.URL.endpointGetPosts
        
        await APIManager.shared.callAPI(strURL: url, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let getPostsResponse = try JSONDecoder().decode([PostModel].self, from: data)
                    success(getPostsResponse)
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
