//
//  ConfigurationManager.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
    
    
}

public enum AppConfiguration {
    private static var serverDomain: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public static var baseURL: URL {
        guard let url = URL(string: serverDomain) else {
            fatalError("Invalid URL: \(serverDomain)")
        }
        return url
    }

    
    public static var AppID: String {
        do {
            return try BuildConfiguration.value(for: "APP_ID")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public static var appName: String {
        do {
            return try BuildConfiguration.value(for: "APP_NAME")
        } catch  {
            fatalError(error.localizedDescription)
        }
    }
}

public enum ConfigurationManager {
    public enum Environment {
        case dev, production
    }
    
    public static var environment: Environment {
#if Dev
        return .dev
#elseif Production
        return .production
#else
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return .dev // or .production based on your preference for previews
        } else {
            fatalError("No valid environment configuration")
        }
#endif
    }
}
