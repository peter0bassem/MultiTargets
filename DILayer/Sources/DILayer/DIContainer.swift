//
//  DIContainer.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Swinject
import UtilLayer
import DataLayer
import DomainLayer
import Combine

public class DIContainer {
    public static let shared = DIContainer()
    private init() { }
    
    /// The container that holds all the dependencies.
    private var container = Container()
    
    /// This method is responsible for injecting all dependencies in the app.
    ///
    /// > It should be called only once in the app's lifecycle.
    @MainActor public func injectModules() {
        
        AuthDIContainer.shared.injectModules(with: container)
        
        injectPreferenceUtils()
        injectNetworkInterspector()
        
        container.register(PassthroughSubject<Void, Never>.self) { _ in
            PassthroughSubject<Void, Never>()
        }
    }
    
    private func injectPreferenceUtils() {
        container.register(PreferenceUtilsProtocol.self) { _ in
            PreferenceUtils(sharedPreferences: .standard)
        }
        .inObjectScope(.container)
        
        container.register(PreferenceHelperProtocol.self) { resolver in
            PreferenceHelper(preferenceUtils: resolver.resolve(PreferenceUtilsProtocol.self)!)
        }
        .inObjectScope(.container)
        
        container.register(ResourceProviderProtocol.self) { _ in
            ResourceProvider()
        }
        .inObjectScope(.container)
        
        container.register(HandleErrorResponse.self) { _ in
            HandleErrorResponse()
        }
        
        container.register(CommonDTOMapper.self) { _ in
            CommonDTOMapper()
        }
        
        container.register(NetworkManagerProtocol.self) { _ in
            NetworkManager()
        }
        
        container.register(CommonUseCase.self) { _ in
            CommonUseCaseImpl()
        }
        .inObjectScope(.transient)
    }
    
    private func injectNetworkInterspector() {
        container.register(NetworkManager.self) { _ in
            NetworkManager()
        }
        .inObjectScope(.container)
        
        container.register(Interceptor.self) { _ in
            Interceptor()
        }
        .inObjectScope(.container)
        
        container.register(MultipartInterceptor.self) { _ in
            MultipartInterceptor()
        }
        .inObjectScope(.container)
    }
}

extension DIContainer: ResolverProtocol {
    /// This method is responsible for resolving a dependency.
    /// - Parameter type: The type of the dependency to be resolved.
    /// - Returns: The resolved dependency.
    public func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
