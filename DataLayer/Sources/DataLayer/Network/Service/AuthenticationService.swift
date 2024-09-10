//
//  AuthService.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Combine
import DomainLayer

public protocol AuthenticationService {
    func login(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<BaseResponse<LoginResponseModel, String>, Error>
}
