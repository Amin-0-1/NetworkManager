//
//  Bundle.swift
//  NetworkManager
//
//  Created by Amin on 6/14/24.
//

import Foundation

fileprivate class Target{}

extension Bundle {
    static var networkManager: Bundle {
        return Bundle(for: Target.self)
    }
}
