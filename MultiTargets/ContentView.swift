//
//  ContentView.swift
//  MultiTargets
//
//  Created by iCommunity app on 07/09/2024.
//

import SwiftUI
import UtilLayer

struct ContentView: View {
    let appName = Bundle.main.infoDictionary?["CFBundleName "] as? String ?? "Unknown"
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(appName)
                .bold()
            Text("\(AppConfiguration.baseURL)")
            Text("AppID: \(AppConfiguration.AppID)")
//            Text("AppName: \(AppConfiguration.appName)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
