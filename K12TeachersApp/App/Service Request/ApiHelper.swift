//
//  ApiHelper.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//
import Foundation

class ApiHelper: Any {
var header = [String: String]()
static let shared = ApiHelper()
private init (){}
private func MakeRequest<T>(method: HTTPMethod, endpoint: APIEndPoints, httpHeaders: [String:String]? = nil, payloadBody: [String: Any]? = nil, failure: @escaping (serviceError) -> (), success: @escaping (_ data: T)->()) {
        
        let SET_URL = URL(string: "\(endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding ?? "")")
        var urlRequest = URLRequest(url: SET_URL!)
        urlRequest.httpMethod = "\(method)"
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        if method != .get {
            guard   let body = try? JSONSerialization.data(withJSONObject: payloadBody ?? "") else {
                print("\n*** serialize sad\n")
                return
            }
            urlRequest.httpBody = body
        }
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            if let err = error {
                failure(serviceError.defaultError(error: err as NSError))
                return
            }
            
            guard let data = data else { return }
            if let response = data as? T {
                success(response)
            }
        }
    urlSession.resume()
    }
}

extension ApiHelper {
    public func GetRequest<T>(endpoint: APIEndPoints, headers: [String: String]? = nil, failure: @escaping (serviceError) -> (), success: @escaping (_ data: T)->()) {
        MakeRequest(method: .get, endpoint: endpoint, httpHeaders: headers, payloadBody: nil, failure: failure, success: success)
    }
    
    public func PostRequest<T>(endpoint: APIEndPoints,headers: [String: String]? = nil, payloads: [String: Any]? = nil, failure: @escaping (serviceError) -> (), success: @escaping (_ data: T)->()) {
        MakeRequest(method: .post, endpoint: endpoint, httpHeaders: headers, payloadBody: payloads, failure: failure, success: success)
    }
}
