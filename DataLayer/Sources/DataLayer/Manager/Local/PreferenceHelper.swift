//
//  PreferenceHelper.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import UtilLayer

public class PreferenceHelper: PreferenceHelperProtocol {
    private let preferenceUtils: PreferenceUtilsProtocol
    private let localizationManager = LocalizationManager.shared
    
    public init(preferenceUtils: PreferenceUtilsProtocol) {
        self.preferenceUtils = preferenceUtils
    }
    
    public func setLoggedIn(isLoggedIn: Bool) {
        preferenceUtils.saveBool(key: IS_LOGGED_IN_KEY, value: isLoggedIn)
    }

    public func getLoggedIn() -> Bool {
        preferenceUtils.getBool(key: IS_LOGGED_IN_KEY)
    }

    public func setLanguage(language: Language) {
        localizationManager.setLanguage(language: language)
    }

    public func getSelectedLanguage() -> Language {
        localizationManager.getSelectedLanguage()
    }

    public func getOppositeLanguage() -> Language {
        localizationManager.getOppositeLanguage()
    }

    public func getDefaultLanguage() -> Language {
        localizationManager.getDefaultLanguage()
    }

    public func changeApplicationLanguage() {
        localizationManager.changeApplicationLanguage()
    }

    public func setTheme(theme: Theme) {
        preferenceUtils.saveString(key: THEME, value: theme.rawValue)
    }

    private func getTheme() -> Theme {
        let theme = Theme(rawValue: preferenceUtils.getString(key: THEME))
        return theme != nil ? (theme == Theme.LIGHT ? Theme.LIGHT : Theme.DARK) : Theme.LIGHT
    }

    public func isDarkTheme() -> Bool {
        return getTheme() == Theme.DARK
    }

    public func setNotificationCounter(counter: Int = 0) {
        preferenceUtils.setNotificationCounter(notificationCounter: NOTIFICATION_COUNTER, counter: counter)
    }

    public func getNotificationCounter() -> Int {
        return preferenceUtils.getSavedInt(key: NOTIFICATION_COUNTER)
    }

    public func setFirebaseInstanceID(id: String) {
        preferenceUtils.saveString(key: FIREBASE_INSTANCE_ID, value: id)
    }

    public func getFirebaseInstanceId() -> String? {
        return preferenceUtils.getString(key: FIREBASE_INSTANCE_ID)
    }

//    func setUser(user: User) {
//        preferenceUtils.saveData(key: USER, value: user)
//    }
//
//    func getUser() -> User? {
//        let user: User? = preferenceUtils.getData(key: USER)
//        return user
//    }
//
//    func clearUser() {
//        preferenceUtils.clearUserData(value: USER)
//    }
//
//    func setAppInfo(appInfo: AppInfo) {
//        preferenceUtils.saveData(key: APP_INFO, value: appInfo)
//    }
//
//    func getAppInfo() -> AppInfo? {
//        let appInfo: AppInfo? = preferenceUtils.getData(key: APP_INFO)
//        return appInfo
//    }

    public func clearSavedData() {
        preferenceUtils.clearUserData()
        setLoggedIn(isLoggedIn: false)
    }

    public func clearSavedData(value: String) {
        setLoggedIn(isLoggedIn: false)
        preferenceUtils.clearUserData(value: value)
    }
}
