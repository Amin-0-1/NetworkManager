//
//  File.swift
//  NetworkManager
//
//  Created by Amin on 1/27/25.
//

import Foundation

enum TestEndPoint {
    case fetchImages
}

extension TestEndPoint: EndPoint {
    var base: String {
        "https://picsum.photos"
    }
    
    var path: String {
        switch self {
            case .fetchImages:
//                "/200/300x"
                ""
        }
    }
    
    var header: NetworkManager.HTTPHeaders? {
        nil
    }
    
    var parameters: NetworkManager.Parameters? {
        nil
    }
    
    var method: NetworkManager.HTTPMethods {
        .get
    }
    
    var encoding: NetworkManager.Encoding {
        .URLEncoding
    }
    

}
