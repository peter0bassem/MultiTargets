//
//  ResourceProviderProtocol.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public protocol ResourceProviderProtocol {
    func getString(forKey key: String) -> String?
}
