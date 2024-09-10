//
//  AuthenticationUseCase.swift
//
//
//  Created by iCommunity app on 08/09/2024.
//

import Foundation
import Combine

public protocol AuthenticationUseCase {
    func login(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<Resource<Login>, Never>
}
