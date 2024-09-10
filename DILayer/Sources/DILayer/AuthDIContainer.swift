//
//  AuthDIContainer.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Swinject
import DataLayer
import DomainLayer

class AuthDIContainer {
    public static let shared = AuthDIContainer()
    private init() { }
    
    private var container: Container!
    
    @MainActor func injectModules(with container: Container) {
        self.container = container
        
        container.register(AuthenticationService.self) { _ in
            AuthenticationServiceImpl()
        }
        
        container.register(AuthenticationRepository.self) { resolver in
//            AuthenticationRepositoryImpl(authService: resolver.resolve(AuthService.self)!)
            AuthenticationRepositoryImpl()
        }

        container.register(AuthenticationUseCase.self) { resolver in
            AuthenticationUseCaseImpl()
        }
        
        container.register(AuthenticationDTOMapper.self) { _ in
            AuthenticationDTOMapper()
        }
    }
}
