//
//  CommonUseCase.swift
//
//
//  Created by iCommunity app on 08/09/2024.
//

import Foundation
import UtilLayer

public protocol CommonUseCase {
    func validateEmail(email: String, isConfirmEmail: Bool) async -> TextStateError
    func validatePassword(password: String, isConfirmPassword: Bool) async -> TextStateError
    func getVersionName() -> String?
    func getVersionCode() -> String?
    func getiOSVersion() -> String
    func getDeviceModelName() -> String
    func getIdentifierInstallationId() -> String?
}
