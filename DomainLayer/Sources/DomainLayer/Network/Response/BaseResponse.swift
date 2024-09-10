//
//  BaseResponse.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public struct BaseResponse<T, E>: Codable where T: Codable, E: Codable {
    public var status: Int?
    public var success: Bool?
    public var message: String?
    public var data: T?
    public var error: E?
    
    enum CodingKeys: String, CodingKey {
        case status
        case success
        case message
        case data
        case error
    }
}
