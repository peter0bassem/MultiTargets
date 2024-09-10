//
//  CommonUseCaseImpl.swift
//
//
//  Created by iCommunity app on 08/09/2024.
//

import Foundation
import UtilLayer
import UIKit

public class CommonUseCaseImpl: CommonUseCase {
    
    public init() { }
    
    public func validateEmail(email: String, isConfirmEmail: Bool = false) async -> TextStateError {
        if email.isBlank {
            return (true, isConfirmEmail ? "register_confirm_email_required" : "register_email_required")
        } else {
            if email.lowercased().trimTrailingSpace.isValidEmail {
                return (false, nil)
            } else {
                return (true, isConfirmEmail ? "register_confirm_email_format" : "register_email_format")
            }
        }
    }
    
    public func validatePassword(password: String, isConfirmPassword: Bool = false) async -> TextStateError {
        if password.isBlank {
            return (true, isConfirmPassword ? "register_confirm_password_required" : "register_password_required")
        } else {
            if password.count < 10 {
                return (true, isConfirmPassword ? "register_confirm_password_length" : "register_password_length")
            } else {
                return (false, nil)
            }
        }
    }
    
    public func getVersionName() -> String? {
        Bundle.main.releaseVersionNumber
    }
    
    public func getVersionCode() -> String? {
        Bundle.main.buildVersionNumber
    }
    
    public func getiOSVersion() -> String {
        UIDevice.current.iOSVersion
    }
    
    public func getDeviceModelName() -> String {
        UIDevice.modelName
    }
    
    public func getIdentifierInstallationId() -> String? {
        UIDevice.current.identifierInstallationId
    }
}
