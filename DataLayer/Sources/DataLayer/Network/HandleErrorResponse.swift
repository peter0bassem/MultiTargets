//
//  HandleErrorResponse.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import UtilLayer
import DomainLayer
import Combine

public class HandleErrorResponse {
    @Inject private var preferenceHelper: PreferenceHelperProtocol
    @Inject private var resourceProvider: ResourceProviderProtocol
    @Inject private var unAuthorizedAccessTokenPublisher: PassthroughSubject<Void, Never>
    
    public init() { }
        
    func handleResponse<T: Codable, E: Codable>(apiError: BaseResponse<T, E>) -> (Bool, String?, Any?) {
        let status = HttpsStatus(rawValue: apiError.status ?? 0)
        switch status {
        case .BAD_REQUEST:
            let responseError = apiError.error
            var returnedError: Any? = nil
            if (responseError as? [APIError]) != nil {
                returnedError = (responseError as? [APIError])?.map { apiError -> [String: String] in
                    var responseErrorDictionary: [String: String] = [:]
                    guard let errorDict = try? apiError.asDictionary() as? [String: String] else { return [:] }
                    responseErrorDictionary[errorDict.keys.first ?? ""] = errorDict.values.first ?? ""
                    return responseErrorDictionary
                } ?? []
                } else if (responseError as? String) != nil {
                    returnedError = responseError as? String
                }
            if (apiError.message?.count ?? 0) > 1 {
                return (false, apiError.message, returnedError)
            } else {
                return (false, "generic_error", returnedError)
            }
        case .UNAUTHORIZED:
            preferenceHelper.clearSavedData()
            unAuthorizedAccessTokenPublisher.send()
            return (false, "not_authorized", apiError.message)
        case .FORBIDDEN:
                if (apiError.message?.count ?? 0) > 1 {
                    return (false, apiError.message, apiError.message)
                } else {
                    return (false, "api_error_not_allowed", apiError.message)
                }
        case .NOT_FOUND:
            let message = apiError.message == nil ? "generic_error" : apiError.message
            return (false, message, apiError.message)
        case .CONFLICT:
            let message = apiError.message == nil ? "generic_error" : apiError.message
            return (false, message, apiError.message)
        case .INTERNAL_SERVER_ERROR:
            let message = apiError.message == nil ? "generic_error" : apiError.message
            return (false, message, apiError.message)
        case .SERVICE_UNAVAILABLE:
            let message = apiError.message == nil ? "generic_error" : apiError.message
            return (false, message, apiError.message)
        case .none:
            return (false, nil, nil)
        default: return (false, nil, nil)
        }
    }
}
