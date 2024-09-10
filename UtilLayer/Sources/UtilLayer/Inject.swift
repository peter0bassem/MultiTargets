//
//  Inject.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    private var service: T?

    public init() {
        if let resolver = DIContainerResolver.shared {
//            print("Injecting: \(T.self)")
            self.service = resolver.resolve(T.self)
        } else {
            // Handle the case where DIContainerResolver.shared is nil
            self.service = nil // or set a default/mock value if applicable
        }
    }

    public var wrappedValue: T {
        guard let service = service else {
            fatalError("Dependency \(T.self) could not be resolved")
        }
        return service
    }
}


// This will hold the global resolver, which will be set by DIContainer.
public struct DIContainerResolver {
    public static var shared: ResolverProtocol?
}
