//
//  ResolverProtocol.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

// In CoreLayer

public protocol ResolverProtocol {
    func resolve<T>(_ type: T.Type) -> T?
}
