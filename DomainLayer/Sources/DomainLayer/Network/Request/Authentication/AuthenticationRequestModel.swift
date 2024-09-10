//
//  AuthenticationRequestModel.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public struct AuthenticationRequestModel: Codable {
    public var username: String?
    public var password: String?
    public var appId: String?
    public var clientId: String?
    public var clientSecret: String?
    public var grantType: String?
    public var platform: String?
    public var deviceToken: String?
    public var appVersion: String?
    public var osVersion: String?
    public var deviceModel: String?
    public var installationId: String?
    
    
    enum CodingKeys: String, CodingKey {
        case username, password, platform
        case appId = "app_id"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case grantType = "grant_type"
        case deviceToken = "device_token"
        case appVersion = "app_version"
        case osVersion = "os_version"
        case deviceModel = "device_model"
        case installationId = "installation_id"
    }
    
    public init(username: String? = nil, password: String? = nil, appId: String? = nil, clientId: String? = nil, clientSecret: String? = nil, grantType: String? = nil, platform: String? = nil, deviceToken: String? = nil, appVersion: String? = nil, osVersion: String? = nil, deviceModel: String? = nil, installationId: String? = nil) {
        self.username = username
        self.password = password
        self.appId = appId
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.grantType = grantType
        self.platform = platform
        self.deviceToken = deviceToken
        self.appVersion = appVersion
        self.osVersion = osVersion
        self.deviceModel = deviceModel
        self.installationId = installationId
    }
    
    
//    public var firstName: String?
//    public var lastName: String?
//    public var email: String?
//    public var confirmEmail: String?
//    public var phone: String?
//    public var gender: String?
//    public var birthdate: String?
//    public var password: String?
//    public var confirmPassword: String?
//    public var deviceToken: String?
//    public var platform: String?
//    public var appVersion: String?
//    public var language: String?
//    public var auth_code: String?
//
//    enum CodingKeys: String, CodingKey {
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case email
//        case confirmEmail = "confirm_email"
//        case phone
//        case gender
//        case birthdate
//        case password
//        case confirmPassword = "confirm_password"
//        case deviceToken = "device_token"
//        case platform
//        case appVersion = "app_version"
//        case language
//        case auth_code
//    }
//    
//    public init(firstName: String? = nil, lastName: String? = nil, email: String? = nil, confirmEmail: String? = nil, phone: String? = nil, gender: String? = nil, birthdate: String? = nil, password: String? = nil, confirmPassword: String? = nil, deviceToken: String? = nil, platform: String? = nil, appVersion: String? = nil, language: String? = nil, auth_code: String? = nil) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//        self.confirmEmail = confirmEmail
//        self.phone = phone
//        self.gender = gender
//        self.birthdate = birthdate
//        self.password = password
//        self.confirmPassword = confirmPassword
//        self.deviceToken = deviceToken
//        self.platform = platform
//        self.appVersion = appVersion
//        self.language = language
//        self.auth_code = auth_code
//    }
}
