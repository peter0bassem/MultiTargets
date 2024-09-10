//
//  AuthServiceImpl.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Combine
import DomainLayer

public class AuthenticationServiceImpl: AuthenticationService {
    public init() { }
    
    public func login(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<BaseResponse<LoginResponseModel, String>, Error> {
        APIClient.performRequest(route: APIRouter.login(authenticationRequestModel: authenticationRequestModel))
    }
}
