//
//  EndPoint.swift
//
//  Created by Amin on 17/10/2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

public protocol EndPoint {
    var base: String { get }
    var path: String { get }
    var header: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethods { get }
    var encoding: Encoding { get }
}

public extension EndPoint {
    var urlComponents: URLComponents {
        guard var components = URLComponents(string: base) else {
            print("Invalid URL: \(base)")
            return .init()
        }
        components.path = path
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents.url else {
            print("failed to load URL from \(urlComponents)")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        if let parameters = parameters {
            do {
                try encoding.encode(urlRequest: &urlRequest, with: parameters)
            } catch {
                print(error)
                return nil
            }
        }
        return urlRequest
    }
}
