//
//  AuthenticationRepository.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Combine

public protocol AuthenticationRepository {
    func login(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<Resource<Login>, Never>
}
