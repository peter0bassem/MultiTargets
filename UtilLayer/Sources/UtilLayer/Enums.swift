//
//  Enums.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import SwiftUI

public enum Language: String, Codable {
  case ARABIC = "ar"
  case ENGLISH = "en"
  var isRTL: Bool {
    switch self {
    case .ENGLISH:
      return false
    case .ARABIC:
      return true
    }
  }
  var layoutDirection: LayoutDirection {
    switch self {
    case .ARABIC:
      return .rightToLeft
    case .ENGLISH:
      return .leftToRight
    }
  }
  var locale: Locale {
      return .init(identifier: self.rawValue)
  }
}

public enum Theme: String {
    case LIGHT
    case DARK
}

public enum APIStatus {
    case EMPTY
    case LOADING
    case SUCCESS
    case FAILED
    case ERROR
}

public enum GenderType: String, Codable {
    case MALE = "male"
    case FEMALE = "female"
}

public enum UserType: Int, Codable {
    case ADMIN = 1
    case MODERATOR = 2
    case MEMBER = 3
}

public enum VersionStatus {
    case NORMAL_UPDATE, FORCE_UPDATE, UP_TO_DATE, DEFAULT
}

public enum HttpsStatus: Int {
    // success
    case OK = 200
    case CREATED = 201
    
    // client errors
    case BAD_REQUEST = 400
    case UNAUTHORIZED = 401
    case FORBIDDEN = 403
    case NOT_FOUND = 404
    case CONFLICT = 409
    
    // server errors
    case INTERNAL_SERVER_ERROR = 500
    case SERVICE_UNAVAILABLE = 503
}

public enum HttpStatus: String {
    case OK = "Success"
    case CREATED = "Created Successfully"
    case BAD_REQUEST = "Bad Request"
    case UNAUTHORIZED = "Unauthorized"
    case FORBIDDEN = "Forbidden"
    case NOT_FOUND = "Not Found"
    case CONFLICT = "Conflict"
    case INTERNAL_SERVER_ERROR = "Internal Server Error"
    case SERVICE_UNAVAILABLE = "Service Unavailable"
}

public enum ApiMessage: String {
    case EMAIL_OR_PHONE_EXISTS = "Email or phone already exists."
    case INVALID_AUTHENTICATION_CODE = "Invalid authentication code."
    case AUTHENTICATION_CODE_REQUIRED = "Authentication code is required."
    case ALREADY_AUTHENTICATED = "Already authenticated."
    case USER_NOT_FOUNT = "User not found."
    case EMAIL_REQUIRED = "Email is required."
    case PASSWORD_REQUIRED = "Password is required."
    case INCORRECT_USERNAME_PASSWORD = "Incorrect username or password."
    case WRONG_PASSWORD = "Wrong Password."
    case NOT_AUTHENTICATED = "Not authenticated."
    case NOT_ACTIVE = "Not active."
    case VALIDATION_ERROR = "Validation Error."
    case INTERNAL_SERVER_ERROR = "Internal Server Error"
    case DATE_ALREADY_EXISTS = "Date already exists."
}

public enum SettingsType: String, Codable {
    case ANDROID_VERSION_MIN = "android_version_min"
    case ANDROID_VERSION_MAX = "android_version_max"
    case IOS_VERSION_MIN = "ios_version_min"
    case IOS_VERSION_MAX = "ios_version_max"
    case CONTACT_US_EMAIL = "contact_us_email"
    case CONTACT_US_PHONE = "contact_us_phone"
    case TERMS_AND_CONDITIONS = "terms_and_conditions"
    case PRIVACY_POLICY = "privacy_policy"
    case VERSES = "verses"
    case ANNOUNCEMENTS = "announcements"
    case HYMNS = "hymns"
    case REHEARSALS = "rehearsals"
    case MEMBERS = "members"
    case EVENTS = "events"
    case PUBLIC_PROFILES = "public_profiles"
    case REWARD_POINTS = "reward_points"
    case NOTIFICATIONS = "notifications"
    case MEMBER_IDENTITY = "member_identity"
    case KEY = "key"
}

public enum SettingItemType {
    case NUMBER
    case FLAG
    case EMAIL
    case PHONE
    case URL
    case LONG_TEXT
    case SHORT_TEXT
    case KEY
}

public enum SideMenuItemType: CaseIterable {
    case IDENTITY_BADGE
    case REWARD_POINTS
    case HYMNS
    case REHEARSALS
    case MEMBERS
    case EVENTS
    case SETTINGS
    
    var icon: Image {
        switch self {
        case .IDENTITY_BADGE: return Image("identity")
        case .REWARD_POINTS: return Image("reward_points")
        case .HYMNS: return Image("hymns")
        case .REHEARSALS: return Image("rehearsals")
        case .MEMBERS: return Image("members")
        case .EVENTS: return Image("events")
        case .SETTINGS: return Image("settings")
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .IDENTITY_BADGE: return "identity_badge"
        case .REWARD_POINTS: return "reward_points"
        case .HYMNS: return "hymns"
        case .REHEARSALS: return "rehearsals"
        case .MEMBERS: return "members"
        case .EVENTS: return "events"
        case .SETTINGS: return "settings"
        }
    }
}
