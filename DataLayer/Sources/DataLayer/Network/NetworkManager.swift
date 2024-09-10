//
//  NetworkManager.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Alamofire
import UtilLayer

public class NetworkManager: NetworkManagerProtocol {
    
    public init() { }
    
    public func isNetworkConnected() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
