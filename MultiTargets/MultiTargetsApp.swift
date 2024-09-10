//
//  MultiTargetsApp.swift
//  MultiTargets
//
//  Created by iCommunity app on 07/09/2024.
//

import SwiftUI
import PresentationLayer
import DILayer
import UtilLayer

@main
struct MultiTargetsApp: App {
    
    init() {
        /// Injecting all dependencies
        DIContainer.shared.injectModules()
        DIContainerResolver.shared = DIContainer.shared
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
        }
    }
}

