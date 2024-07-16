//
//  APIConfig.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 24/06/2024.
//

import Foundation

class APIConfig {
    static let shared = APIConfig()
    
    private init() {}
    
    enum Keys {
        static let API_KEY = "BACKEND_42_UID"
        static let API_SECRET = "BACKEND_42_SECRET"
    }
    
    static let bundleIdentifier: String = {
        guard let id = Bundle.main.bundleIdentifier else {
            print("Bundle identifier not found")
            return ""
        }
        return id
    }()
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    func getFromConfig<T>(key: String) -> T {
        guard let val = APIConfig.infoDictionary[key] as? T else {
            fatalError(key + " not found")
        }
        return val
    }
}
