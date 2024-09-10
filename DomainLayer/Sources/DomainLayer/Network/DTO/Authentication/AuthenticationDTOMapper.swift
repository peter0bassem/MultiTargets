//
//  AuthenticationDTOMapper.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public class AuthenticationDTOMapper {
    public init() { }
    
    public func mapToLoginDomainModel(response: LoginResponseModel?) -> Login {
        return Login()
    }
}
