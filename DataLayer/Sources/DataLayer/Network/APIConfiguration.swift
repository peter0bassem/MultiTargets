//
//  APIConfiguration.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
    var parameters: Parameters? { get }
}
