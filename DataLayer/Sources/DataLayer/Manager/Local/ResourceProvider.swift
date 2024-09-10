//
//  ResourceProvider.swift
//  
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import UtilLayer

public class ResourceProvider: ResourceProviderProtocol {
    @Inject private var preferenceHelper: PreferenceHelperProtocol
    
    public init() { }
    
    public func getString(forKey key: String) -> String? {
        guard let path = Bundle.main.url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: preferenceHelper.getSelectedLanguage().rawValue) else {
            return nil
        }
        guard let dict = NSDictionary(contentsOf: path) else {
            return nil
        }
        guard let value = dict.value(forKey: key) as? String else {
            return nil
        }
        return value
    }
}
