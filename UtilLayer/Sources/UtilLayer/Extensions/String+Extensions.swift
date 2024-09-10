//
//  File.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public extension String {
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
        return trimmed.isEmpty
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var trimTrailingSpace: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isPhoneNumberValid: Bool {
        let phoneRegex = "^01[0125][0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    var isValidURL: Bool {
        return URL(string: self) != nil
    }
    
    var isStringNumber: Bool {
        return Int(self) != nil || Double(self) != nil
    }
}
