//
//  PreferenceHelperProtocol.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public protocol PreferenceHelperProtocol {
    func setLoggedIn(isLoggedIn: Bool)
    func getLoggedIn() -> Bool
    func setLanguage(language: Language)
    func getSelectedLanguage() -> Language
    func getOppositeLanguage() -> Language
    func getDefaultLanguage() -> Language
    func changeApplicationLanguage()
    func setTheme(theme: Theme)
    func isDarkTheme() -> Bool
    func setNotificationCounter(counter: Int)
    func getNotificationCounter() -> Int
    func setFirebaseInstanceID(id: String)
    func getFirebaseInstanceId() -> String?
//    func setUser(user: User)
//    func getUser() -> User?
//    func clearUser()
//    func setAppInfo(appInfo: AppInfo)
//    func getAppInfo() -> AppInfo?
    func clearSavedData()
    func clearSavedData(value: String)
}
