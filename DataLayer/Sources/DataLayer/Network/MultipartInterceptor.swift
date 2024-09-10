//
//  MultipartInterceptor.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Alamofire
import UtilLayer

public class MultipartInterceptor: RequestInterceptor {
    
    @Inject private var preferenceHelper: PreferenceHelperProtocol

    public init() { }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
//        request.setValue("form-data", forHTTPHeaderField: "Content-Disposition")
//        request.setValue("gzip,defla,br", forHTTPHeaderField: "Accept-Encoding")
//        request.setValue("close", forHTTPHeaderField: "Connection")
        request.setValue(preferenceHelper.getSelectedLanguage().rawValue, forHTTPHeaderField: "language")
        request.setValue(preferenceHelper.getSelectedLanguage().rawValue, forHTTPHeaderField: "Accept-Language")
        
        #warning("Do not forget to add token when add `getUser()` in `PreferenceHelper`")
//        if let token = preferenceHelper.getUser()?.token {
//            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//            debugPrint("Token: Bearer \(token)")
//        }
        
        completion(.success(request))
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
