//
//  Response.swift
//
//
//  Created by Amin on 25/04/2024.
//

import Foundation

struct Response {
    let response: URLResponse
    let data: Data

    init(response: URLResponse, data: Data) {
        self.response = response
        self.data = data
    }
}
