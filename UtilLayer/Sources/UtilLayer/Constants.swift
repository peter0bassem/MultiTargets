//
//  Constants.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

// preferences
public let CHANGE_LANGUAGE_KEY = "change_language_key"
public let SHARED_PREFERENCE = "preferences.\(Bundle.main.bundleIdentifier ?? "")"
public let IS_LOGGED_IN_KEY = "is_logged_in"
public let NOTIFICATION_COUNTER = "notification_counter"
public let FIREBASE_INSTANCE_ID = "firebase_instance_id"
public let LANGUAGE = "language"
public let THEME = "theme"

// Typealias
public typealias TextStateError = (isValid: Bool, error: String?)
