//
//  ParameterEncoding.swift
//
//  Created by Amin on 17/10/2023.
//

import Foundation

public enum Encoding {
    /// URLEncoding refers to a process of encoding URL query parameters or path components in a format that is safe for transmission over HTTP
    case URLEncoding
    /// JSONEncoding is a process used to encode request parameters or data into JSON (JavaScript Object Notation) format, which is commonly used in RESTful APIs. When making HTTP requests, especially POST, PUT, or PATCH requests, parameters are often sent in the body of the request as JSON.
    case JSONEncoding
    /// MultipartEncoding (or multipart/form-data encoding) is a way to encode data for sending large files or complex data (like forms with files) over HTTP. It’s used when an HTTP request needs to send not only key-value pairs (such as form fields) but also files like images, videos, or documents. This encoding is specifically designed for file uploads because it allows binary data to be transmitted alongside textual data.
    case MULTIPARTEncoding
    
    private struct MultipartFormData {
        let name: String
        let data: Data
        let mimeType: String
    }
    
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            switch self {
                case .URLEncoding:
                    try urlEncode(urlRequest: &urlRequest, with: parameters)
                case .JSONEncoding:
                    try jsonEncode(urlRequest: &urlRequest, with: parameters)
                case .MULTIPARTEncoding:
                    try multipartEncode(urlRequest: &urlRequest, with: parameters)
            }
        } catch {
            throw error
        }
    }
    private func jsonEncode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
    
    private func urlEncode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.invalidURL(urlRequest.url?.description) }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = []
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
    private func multipartEncode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        let boundary = "Boundary-\(UUID().uuidString)"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let httpBody = NSMutableData()
        
        for (key, value) in parameters {
            if let value = value as? String {
                let fieldString = "--\(boundary)\r\n" +
                "Content-Disposition: form-data; name=\"\(key)\"\r\n" +
                "\r\n" +
                "\(value)\r\n"
                httpBody.appendString(fieldString)
            } else if let formData = value as? MultipartFormData {
                let data = NSMutableData()
                data.appendString("--\(boundary)\r\n")
                data.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(formData.name)\"\r\n")
                data.appendString("Content-Type: \(formData.mimeType)\r\n\r\n")
                data.append(formData.data)
                data.appendString("\r\n")
                httpBody.append(data as Data)
            }
        }
        
        httpBody.appendString("--\(boundary)--")
        urlRequest.httpBody = httpBody as Data
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
