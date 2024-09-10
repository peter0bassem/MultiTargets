//
//  LoginView.swift
//  
//
//  Created by iCommunity app on 08/09/2024.
//

import SwiftUI
import UtilLayer

public struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    public init() { }

    public var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .padding()
                .border(Color.gray)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .border(Color.gray)
            
            Button("Login") {
                viewModel.onLoginButtonClick()
            }
            

//            if case let .error(message) = viewModel.state {
//                Text(message)
//                    .foregroundColor(.red)
//            }
        }
        .padding()
    }
}


#Preview {
    LoginView()
}



/*
 - Presentation
 -- Main (Contains Featurs)
 --- Login
 -- Lyve
 --- Colors, Assets
 --- Splash
 -- Emaar
 --- Colors
 --- Splash, Assets
 */
