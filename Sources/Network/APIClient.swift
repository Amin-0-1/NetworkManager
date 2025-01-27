//
//  APIClient.swift
//
//  Created by Amin on 17/10/2023.
//

import Foundation
import Combine

public protocol ModernConcurrencyAPIProtocol {

    /// executes async endpoint using async await
    /// - Parameter request: Endpoint case that contains all data to perofrm api call like endpoint, headers, encoding etc.
    /// - Returns: either return Data object or just throws an error
    func execute(request: EndPoint) async throws -> Data
}

public final class APIClient {
    var session: URLSession
    var request: URLRequest?

    public init(config: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: config)
    }

    func handleSuccess(response: Response) throws -> Data {
        response.log()
        guard let httpResponse = response.response as? HTTPURLResponse else {
            throw NetworkError.serverError(response.data)
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.errorCode(httpResponse.statusCode)
        }

        return response.data
    }
    
    func handle(error: Error) -> NetworkError {
        let errorCode = Int(error.localizedDescription) ?? -1
        if let urlError = error as? URLError {
            print(urlError.code)
            switch urlError.code {
                case .notConnectedToInternet:
                    return NetworkError.noInternetConnection(errorCode)
                case .timedOut:
                    return NetworkError.timeout(errorCode)
                case .badURL, .unsupportedURL:
                    let url = self.request?.url?.absoluteString
                    return NetworkError.invalidURL(url)
                default:
                    return NetworkError.noInternetConnection(errorCode)
            }
        } else if let error = error as? NetworkError {
            switch error {
                case .errorCode(let code):
                    return .errorCode(code)
                case .serverError(let data):
                    return .serverError(data)
                default: return .timeout(errorCode)
            }

        } else {
            return .timeout(errorCode)
        }
    }
}
