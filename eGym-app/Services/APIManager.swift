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
    
    func callAPI(serverURL: String? = "", strURL: String, queryItems: [URLQueryItem]? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping ((AFDataResponse<Any>) -> Void), failure: @escaping ((FailureMessage) -> Void)) async {
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
            await AF.request(url, method: method, parameters: parameters, headers: headers)
                .validate()
                .responseJSON { response in
                    guard case let .failure(error) = response.result else { return }

                        if let error = error as? AFError {
                            switch error {
                            case .invalidURL(let url):
                                print("Invalid URL: \(url) - \(error.localizedDescription)")
                            case .parameterEncodingFailed(let reason):
                                print("Parameter encoding failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                            case .multipartEncodingFailed(let reason):
                                print("Multipart encoding failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                            case .responseValidationFailed(let reason):
                                print("Response validation failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")

                                switch reason {
                                case .dataFileNil, .dataFileReadFailed:
                                    print("Downloaded file could not be read")
                                case .missingContentType(let acceptableContentTypes):
                                    print("Content Type Missing: \(acceptableContentTypes)")
                                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                                case .unacceptableStatusCode(let code):
                                    print("Response status code was unacceptable: \(code)")
                                case .customValidationFailed(error: let error):
                                    print(error.localizedDescription)
                                }
                            case .responseSerializationFailed(let reason):
                                print("Response serialization failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                            case .createUploadableFailed(error: let error):
                                print(error.localizedDescription)
                            case .createURLRequestFailed(error: let error):
                                print(error.localizedDescription)
                            case .downloadedFileMoveFailed(error: let error, source: let source, destination: let destination):
                                print(error.localizedDescription)
                            case .explicitlyCancelled:
                                print(error.localizedDescription)
                            case .parameterEncoderFailed(reason: let reason):
                                print(error.localizedDescription)
                            case .requestAdaptationFailed(error: let error):
                                print(error.localizedDescription)
                            case .requestRetryFailed(retryError: let retryError, originalError: let originalError):
                                print(error.localizedDescription)
                            case .serverTrustEvaluationFailed(reason: let reason):
                                print(error.localizedDescription)
                            case .sessionDeinitialized:
                                print(error.localizedDescription)
                            case .sessionInvalidated(error: let error):
                                print(error!.localizedDescription)
                            case .sessionTaskFailed(error: let error):
                                print(error.localizedDescription)
                            case .urlRequestValidationFailed(reason: let reason):
                                print(error.localizedDescription)
                            }

                            print("Underlying error: \(String(describing: error.underlyingError))")
                        } else if let error = error as? URLError {
                            print("URLError occurred: \(error)")
                        } else {
                            print("Unknown error: \(error)")
                        }
                }
        }
}
