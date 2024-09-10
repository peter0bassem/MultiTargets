//
//  File.swift
//  
//
//  Created by iCommunity app on 08/09/2024.
//

import Foundation
import DomainLayer
import UtilLayer

final public class LoginViewModel: BaseViewModel {
    @Published private var loginResponse: Resource<Login>?
    
    @Published var email: String = "k@lyve.com"
    @Published var password: String = "123456"
    
    @Published var emailTextStateError: TextStateError = (false, nil)
    @Published var passwordTextStateError: TextStateError = (false, nil)

    @Inject private var commonUseCase: CommonUseCase
    @Inject private var authenticationUseCase: AuthenticationUseCase
    
    override init() {
        super.init()
        $loginResponse
            .sink { loginResponse in
                guard let loginResponse = loginResponse else { return }
                switch loginResponse.status {
                case .SUCCESS:
                    print("SUCCESS LOGING: \(loginResponse.message)")
                    //                showSuccessDialog = (true, loginResponse.message)
                    //                successLoginState = (true, loginResponse.data?.user)
                case .FAILED:
                    print("FAILED LOGING: \(loginResponse.message)")
                    //                showFailedDialog = (true, loginResponse.message)
                case .ERROR:
                    print("ERROR LOGING: \(loginResponse.message)")
                    //                showErrorDialog = (true, loginResponse.message)
                default: break
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor func validateEmail() async {
        self.emailTextStateError = await commonUseCase.validateEmail(email: email, isConfirmEmail: false)
    }
    
    @MainActor func validatePassword() async {
        self.passwordTextStateError = await commonUseCase.validatePassword(password: password, isConfirmPassword: false)
    }
    
    private func validateLogin() async -> Bool {
        await validateEmail()
        await validatePassword()
        return !(emailTextStateError.isValid || passwordTextStateError.isValid)
    }
    
    func invalidateTextFields() {
        email = ""
        password = ""
    }
    
    func invalidateStates() {
        emailTextStateError = (false, nil)
        passwordTextStateError = (false, nil)
    }
    
    func onLoginButtonClick() {
        Task {
            if await validateLogin() {
                // Validate Firebase Token...
                onTriggerEvent(authenticationRequestModel: getUserRequestModel())
            }
        }
    }
    
    private func getUserRequestModel() -> AuthenticationRequestModel {
        return .init(
            username: email,
            password: password,
            appId: AppConfiguration.AppID,
            clientId: APIStaticData.clientId,
            clientSecret: APIStaticData.client_secret,
            grantType: APIStaticData.grant_type,
            platform: APIStaticData.platform,
            deviceToken: APIStaticData.deviceToken,
            appVersion: commonUseCase.getVersionName(),
            osVersion: commonUseCase.getiOSVersion(),
            deviceModel: commonUseCase.getDeviceModelName(),
            installationId: commonUseCase.getIdentifierInstallationId()
        )
    }
    
    private func onTriggerEvent(authenticationRequestModel: AuthenticationRequestModel) {
        print("Trying to login...")
        authenticationUseCase.login(authenticationRequestModel: authenticationRequestModel)
            .sink { [weak self] resource in
                DispatchQueue.main.async {
                    self?.loginResponse = resource
                    self?.status = resource.status
                }
            }
            .store(in: &cancellables)
    }
}

