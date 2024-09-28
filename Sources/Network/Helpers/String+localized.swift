//
//  String+Localized.swift
//  NetworkManager
//
//  Created by Amin on 6/14/24.
//

import Foundation


extension String {
    /// Custom function that takes a key,  bundle and argument then return localized value
    static func localize(key: String, bundle: Bundle = .networkManager, arguments: any CVarArg...) -> String {
        let localized = NSLocalizedString(key,tableName: nil,bundle: bundle,comment: "")
        return String(format: localized, arguments: arguments)
    }
}
