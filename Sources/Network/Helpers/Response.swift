//
//  Response.swift
//
//
//  Created by Amin on 25/04/2024.
//

import Foundation

public struct Response {
    public let response: URLResponse
    public let data: Data

    public init(response: URLResponse, data: Data) {
        self.response = response
        self.data = data
    }
}
