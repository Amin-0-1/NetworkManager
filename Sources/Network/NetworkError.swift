//
//  NetworkError.swift
//
//  Created by Amin on 17/10/2023.
//

import Foundation

public enum NetworkError: Error, CustomNSError, LocalizedError{
    /// when the request fail becaue of the connection
    case noInternetConnection(Int)
    /// when the request takes too large time
    case timeout(Int)
    /// in case of bad or unsupported url
    case invalidURL(String?)
    /// the body or params encoding with the request has issues
    case encodingFailed
    /// the request completed successfully but the received not valid response
    case serverError(Data)
    /// the request completed successfully but the received error code out of the rage 200..300
    case errorCode(Int)

    public var errorDescription: String? {
        switch self {
            case .noInternetConnection(let code):
                return .localize(key: "noInternetConnectionError", arguments: code)
            case .timeout(let code):
                return .localize(key: "timeoutError", arguments: code)
            case .invalidURL(let url):
                var urlString: String = .localize(key: "invalidURLError")
                if let url {
                    urlString = .localize(key: "invalidURLError", arguments: url)
                }
                return urlString
            case .encodingFailed:
                return .localize(key: "encodingDataError")
            case .serverError:
                return .localize(key: "serverError")
            case .errorCode(let errorCode):
                return errorCode.description

        }
    }
}
