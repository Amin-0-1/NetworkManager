//
//  Loggers.swift
//
//
//  Created by Amin on 25/04/2024.
//

import Foundation
// MARK: - RequestLogger
public extension URLRequest {
    func log() {
        print("🤝 Request:\nURL: \(self.url?.absoluteString ?? "No URL")")
        print("Method: \(self.httpMethod ?? "No HTTP Method")")
        if let headers = self.allHTTPHeaderFields {
            print("Headers:")
            for (key, value) in headers {
                print("\t\(key): \(value)")
            }
        }
        if let bodyData = self.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            print("Body:")
            print(bodyString)
        }
    }
}

// MARK: - ResponseLogger
public extension Response {
    func log() {
        if let httpResponse = self.response as? HTTPURLResponse {
            print("✅ Response:\nStatus Code: \(httpResponse.statusCode)")

            do {
                let object = try JSONSerialization.jsonObject(with: self.data,options: [])
                if let prettyPrintedData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
                   let jsonString = String(data: prettyPrintedData, encoding: .utf8) {
                    print("Serialized Object: ",jsonString)
                } else {
                    print("Failed to pretty print JSON")
                }
            } catch {
                print("Serialized Error: ",error.localizedDescription, error)
            }
        }
    }
}
