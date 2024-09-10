//
//  PreferenceUtils.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation

public protocol PreferenceUtilsProtocol {
    func saveData<T: Codable>(key: String, value: T?)
    func getData<T: Codable>(key: String) -> T?
    func saveInt(key: String, value: Int)
    func getSavedInt(key: String) -> Int
    func saveString(key: String, value: String)
    func getString(key: String) -> String
    func saveBool(key: String, value: Bool)
    func getBool(key: String) -> Bool
    func clearUserData()
    func clearUserData(value: String)
    func setNotificationCounter(notificationCounter: String, counter: Int)
}

public class PreferenceUtils: PreferenceUtilsProtocol {
    private let sharedPreferences: UserDefaults
    
    public init(sharedPreferences: UserDefaults) {
        self.sharedPreferences = sharedPreferences
    }
    
    public func saveData<T: Codable>(key: String, value: T?) {
        let data = try? JSONEncoder().encode(value)
        sharedPreferences.set(data, forKey: key)
    }
    
    public func getData<T: Codable>(key: String) -> T? {
        let savedData = sharedPreferences.data(forKey: key)
        return try? JSONDecoder().decode(T.self, from: savedData ?? Data())
    }
    
    public func saveInt(key: String, value: Int) {
        sharedPreferences.set(value, forKey: key)
    }

    public func getSavedInt(key: String) -> Int {
        return sharedPreferences.integer(forKey: key)
    }
    
    public func saveString(key: String, value: String) {
        sharedPreferences.set(value, forKey: key)
    }
    
    public func getString(key: String) -> String {
        return sharedPreferences.string(forKey: key) ?? ""
    }
    
    public func saveBool(key: String, value: Bool) {
        sharedPreferences.set(value, forKey: key)
    }
    
    public func getBool(key: String) -> Bool {
        return sharedPreferences.bool(forKey: key)
    }

    public func clearUserData() {
        sharedPreferences.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        sharedPreferences.synchronize()
    }

    public func clearUserData(value: String) {
        sharedPreferences.removeObject(forKey: value)
        sharedPreferences.synchronize()
    }

    public func setNotificationCounter(notificationCounter: String, counter: Int) {
        sharedPreferences.set(counter, forKey: notificationCounter)
    }
}
