//
//  APIError.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public struct APIError: Codable {
    public let firstName, lastName, email, phone: String?
    public let gender, birthdate: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, phone, gender, birthdate
    }
    
    public init(firstName: String? = nil, lastName: String?, email: String?, phone: String?, gender: String?, birthdate: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.gender = gender
        self.birthdate = birthdate
    }
}
