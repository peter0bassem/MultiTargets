//
//  AuthRepositoryImpl.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import DomainLayer
import UtilLayer
import Combine

public class AuthenticationRepositoryImpl: AuthenticationRepository {
    
    public init() { }
    
    @Inject private var service: AuthenticationService
    @Inject private var authenticationDTOMapper: AuthenticationDTOMapper
    @Inject private var commonDTOMapper: CommonDTOMapper
    @Inject private var handleErrorResponse: HandleErrorResponse
    
    private var cancellabels = Set<AnyCancellable>()
    
    public func login(authenticationRequestModel: DomainLayer.AuthenticationRequestModel) -> AnyPublisher<DomainLayer.Resource<DomainLayer.Login>, Never> {
        let subject = CurrentValueSubject<Resource<Login>, Never>(Resource<Login>.EMPTY())
        
        subject.send(Resource<Login>.Loading())
        
        service.login(authenticationRequestModel: authenticationRequestModel)
            .sink { completion in
                switch completion {
                case .finished:
                    debugPrint("API Call Finished")
                case .failure(_):
                    subject.send(Resource<Login>.Error(message: "generic_error"))
                }
            } receiveValue: { response in
                if !(200...300).contains(response.status ?? 0) {
                    let errorResponse = self.handleErrorResponse.handleResponse(apiError: response)
                    subject.send(Resource<Login>.Failed(message: errorResponse.1, data: nil))
                } else {
                    let domainModel = self.authenticationDTOMapper.mapToLoginDomainModel(response: response.data)
                    subject.send(Resource<Login>.Success(data: domainModel))
                }
            }
            .store(in: &cancellabels)

        
        
        return subject.eraseToAnyPublisher()
    }
}
