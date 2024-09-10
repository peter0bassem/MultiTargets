//
//  AuthenticationUseCaseImpl.swift
//
//
//  Created by iCommunity app on 08/09/2024.
//

import Foundation
import UtilLayer
import Combine

public class AuthenticationUseCaseImpl: AuthenticationUseCase {
    
    @Inject private var repository: AuthenticationRepository
    @Inject private var preferenceHelper: PreferenceHelperProtocol
    @Inject private var networkManager: NetworkManagerProtocol
    
    public init() { }
    
    private var cancellables = Set<AnyCancellable>()
    
    fileprivate func emit<T: Codable>(errorMessage: String) -> AnyPublisher<Resource<T>, Never> {
        return Future<Resource<T>, Never> { promise in
            promise(.success(Resource<T>.Error(message: errorMessage)))
        }
        .eraseToAnyPublisher()
    }
    
    /* *
     * validate login information (email, password)
     * check for network availability. if no network return, else continue
     * if email is valid and correct email format
     * if password is valid
     * call repository to preform use login request
     * */
    public func login(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<Resource<Login>, Never> {
//        let email = authenticationRequestModel.email
//        let password = authenticationRequestModel.password
//        if !self.networkManager.isNetworkConnected() {
//            return emit(errorMessage: "no_internet_connection")
//        }
//        if (email ?? "").isBlank {
//            return emit(errorMessage: "register_email_required")
//        }
//        if !(email ?? "").isValidEmail {
//            return emit(errorMessage: "register_email_format")
//        }
//        if (password ?? "").isBlank {
//            return emit(errorMessage: "register_password_required")
//        }
        return loginRequest(authenticationRequestModel: authenticationRequestModel)
    }

    /* *
     * call repository with user information (email) to perform use forgot password request;
     * */
    private func loginRequest(authenticationRequestModel: AuthenticationRequestModel) -> AnyPublisher<Resource<Login>, Never> {
        let subject = CurrentValueSubject<Resource<Login>, Never>(Resource<Login>.EMPTY())
        repository.login(authenticationRequestModel: authenticationRequestModel)
            .sink { [weak self] in
                switch $0.status {
                case .EMPTY, .LOADING, .ERROR:
                    subject.send($0)
                case .SUCCESS:
                    self?.saveInfo($0.data)
                    $0.message = "login_success"
                    subject.send($0)
                case .FAILED:
                    if $0.message == ApiMessage.EMAIL_REQUIRED.rawValue {
                        $0.message = "login_email_required"
                    } else if $0.message == ApiMessage.PASSWORD_REQUIRED.rawValue {
                        $0.message = "login_password_required"
                    } else if $0.message == ApiMessage.INCORRECT_USERNAME_PASSWORD.rawValue {
                        $0.message = "incorrect_email_password"
                    } else if $0.message == ApiMessage.NOT_AUTHENTICATED.rawValue {
                        $0.message = "login_not_authenticated"
                    } else if $0.message == ApiMessage.NOT_ACTIVE.rawValue {
                        $0.message = "login_user_suspended_message"
                    }
                    subject.send($0)
                }
            }
            .store(in: &cancellables)
        return subject.eraseToAnyPublisher()
    }

    private func saveInfo(_ response:Login?) {
        preferenceHelper.setLoggedIn(isLoggedIn: true)
        #warning("Save Login response here...!!!!!!!")
//        if let user = response?.user {
//            preferenceHelper.setUser(user: user)
//        }
//        if let appInfo = response?.appInfo {
//            preferenceHelper.setAppInfo(appInfo: appInfo)
//        }
    }
}
