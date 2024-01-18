//
//  APIManager.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 18/1/24.
//

import Foundation
import Alamofire

public typealias FailureMessage = String


public class APIManager {
    // A Singleton instance
    public static let shared = APIManager()
    
    ///   - serverURL:                  Optional value for pass your root url.
    ///   - strURL:                         String URL value.
    ///   - queryItems:                  add number of parameters in the API request
    ///   - method:                        `HTTPMethod` for the `URLRequest`. `.get` by default.
    ///   - headers:                       `HTTPHeaders` value to be added to the `URLRequest`. `nil` by default.
    ///   - parameter:                    `Parameters` (a.k.a. `[String: Any]`) value to be encoded into the `URLRequest`. `nil` by default.
    ///   - success:                        Completion handler for get `Data`
    ///   - failure:                           Completion handler for get `FailureMessage`(a.k.a. `String`)
    
    func callAPI(serverURL: String? = "", strURL: String, queryItems: [URLQueryItem]? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping ((AFDataResponse<Any>) -> Void), failure: @escaping ((FailureMessage) -> Void)) {
            var finalURL = serverURL ?? ""

            if let serverURL = serverURL, serverURL == "" {
                finalURL = Constants.serverURL
            }

            guard var url = URLComponents(string: "\(finalURL)\(strURL)") else {
                failure("Invalid URL")
                return
            }

            if let queryItems = queryItems {
                url.queryItems = queryItems
            }

            // Network request
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        success(response)
                    case let .failure(error):
                        failure(error.localizedDescription)
                    }
                }
        }
}
