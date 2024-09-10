//
//  File.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import SwiftUI
import UtilLayer

class LocalizationManager: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let userDefaultsAppLanguageKey = "AppleLanguages"
    
    static let shared = LocalizationManager()
    private init() { }
    
    func setLanguage(language: Language) {
        userDefaults.set([language.rawValue], forKey: userDefaultsAppLanguageKey)
        userDefaults.synchronize()
    }
    
    func getSelectedLanguage() -> Language {
        var strLangCode:String = Locale.preferredLanguages[0]
        strLangCode = strLangCode.replacingOccurrences(of: "-", with: "_")
        if let regionCode:String = Locale.current.regionCode {
            if strLangCode.contains("_" + regionCode) {
                strLangCode = strLangCode.replacingOccurrences(of: "_" + regionCode, with: "")
                return Language(rawValue: strLangCode) ?? .ENGLISH
            } else {
                return Language(rawValue: strLangCode) ?? .ENGLISH
            }
        }
        return .ENGLISH
    }
    
    func getOppositeLanguage() -> Language {
        getSelectedLanguage() == .ENGLISH ? .ARABIC : .ENGLISH
    }
    
    func getDefaultLanguage() -> Language {
        return Locale.current.languageCode == Language.ARABIC.rawValue ? Language.ARABIC : Language.ENGLISH
    }
    
    func changeApplicationLanguage() {
        let selectedLang = getSelectedLanguage()
        let newLang = selectedLang.rawValue == Language.ARABIC.rawValue ? Language.ENGLISH : Language.ARABIC
        setLanguage(language: newLang)
        switch newLang {
        case .ARABIC:
            debugPrint("Selected New Language To Arabic")
        case .ENGLISH:
            debugPrint("Selected New Language To English")
        }
    }
}
