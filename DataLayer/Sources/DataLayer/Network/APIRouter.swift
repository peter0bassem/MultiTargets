//
//  APIRouter.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Alamofire
import DomainLayer
import UtilLayer

public enum APIRouter: APIConfiguration/*, EnvironmentProtocol*/ {
    
    // MARK: Authentication
    case register(authenticationRequestModel: AuthenticationRequestModel)
    case useAuthenticationCode(authenticationRequestModel: AuthenticationRequestModel)
    case forgotPassword(authenticationRequestModel: AuthenticationRequestModel)
    case login(authenticationRequestModel: AuthenticationRequestModel)
    case logout
    
//    // MARK: Settings
//    case getAllSettings
//    case getAppInfo
//    case generateKey
//    case updateSettings(id: String, settingRequestModel: SettingRequestModel)
//    
//    // MARK: User
//    case updateUserProfilePicture(id: String)
//    case updateUser(id: String, userRequestModel: UserRequestModel)
//    case changePassword(id: String, userRequestModel: UserRequestModel)
//    case changeLanguage(id: String, userRequestModel: UserRequestModel)
    
    var method: HTTPMethod {
        switch self {
        case .register: return .post
        case .useAuthenticationCode: return .post
        case .forgotPassword: return .post
        case .login: return .post
        case .logout: return .post
            
//        case .getAllSettings: return .get
//        case .getAppInfo: return .get
//        case .generateKey: return .get
//        case .updateSettings: return .patch
//            
//        case .updateUserProfilePicture: return .post
//        case .updateUser: return .patch
//        case .changePassword: return .patch
//        case .changeLanguage: return .patch
        }
    }
    
    var path: String {
        switch self {
        case .register: return "v1/auth/register"
        case .useAuthenticationCode: return "v1/auth/authenticate"
        case .forgotPassword: return "v1/auth/forgot-password"
        case .login: return "v1/auth/login"
        case .logout: return "v1/auth/logout"
            
//        case .getAllSettings: return "v1/settings/getAll"
//        case .getAppInfo: return "v1/settings/appInfo"
//        case .generateKey: return "v1/settings/generateKey"
//        case .updateSettings(let id, _): return "v1/settings/update/\(id)"
//            
//        case .updateUserProfilePicture(let id): return "v1/member/uploadProfileImage/\(id)"
//        case .updateUser(let id, _): return "v1/member/update/\(id)"
//        case .changePassword(let id, _): return "v1/member/changePassword/\(id)"
//        case .changeLanguage(let id, _): return "v1/member/changeLanguage/\(id)"
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .register: return nil
        case .useAuthenticationCode: return nil
        case .forgotPassword: return nil
        case .login: return nil
        case .logout: return nil
            
//        case .getAllSettings: return nil
//        case .getAppInfo: return nil
//        case .generateKey: return nil
//        case .updateSettings: return nil
//            
//        case .updateUserProfilePicture: return nil
//        case .updateUser: return nil
//        case .changePassword: return nil
//        case .changeLanguage: return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .register(let authenticationRequestModel): return try? authenticationRequestModel.asDictionary()
        case .useAuthenticationCode(let authenticationRequestModel): return try? authenticationRequestModel.asDictionary()
        case .forgotPassword(let authenticationRequestModel): return try? authenticationRequestModel.asDictionary()
        case .login(let authenticationRequestModel): return try? authenticationRequestModel.asDictionary()
        case .logout: return nil
            
//        case .getAllSettings: return nil
//        case .getAppInfo: return nil
//        case .generateKey: return nil
//        case .updateSettings(_, let settingRequestModel): return try? settingRequestModel.asDictionary()
//            
//        case .updateUserProfilePicture: return nil
//        case .updateUser(_, let userRequestModel): return try? userRequestModel.asDictionary()
//        case .changePassword(_, let userRequestModel): return try? userRequestModel.asDictionary()
//        case .changeLanguage(_, let userRequestModel): return try? userRequestModel.asDictionary()
        }
    }
    
    // MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
        var url = AppConfiguration.baseURL
        
        if let query = query {
            var urlComponents = URLComponents(string: url.absoluteString)
            urlComponents?.queryItems = query
            url = try (urlComponents?.asURL())!
        }
                
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        debugPrint("🎖️----->urlRequest: \(urlRequest)")
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
