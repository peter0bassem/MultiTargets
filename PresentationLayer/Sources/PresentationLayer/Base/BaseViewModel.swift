//
//  BaseViewModel.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import UtilLayer
import Combine

public class BaseViewModel: ObservableObject {
    @Inject var preferenceHelper: PreferenceHelperProtocol
    @Inject var resourceProvider: ResourceProviderProtocol
    var cancellables = Set<AnyCancellable>()
    
    @Published var status: APIStatus?
    
    @Published var showSuccessDialog: (status: Bool, message: String?) = (false, nil)
    @Published var showFailedDialog: (status: Bool, message: String?) = (false, nil)
    @Published var showErrorDialog: (status: Bool, message: String?) = (false, nil)
    @Published var showInfoDialog: (Bool) = false
    
    @Published var shouldDismiss = false
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    func getCurrentLanguage() -> Language {
        return preferenceHelper.getSelectedLanguage()
    }
}
