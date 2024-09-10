//
//  APIClient.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import Alamofire
import UtilLayer
import Combine

class APIClient {
    @Inject private static var preferenceHelper: PreferenceHelperProtocol
    @Inject private static var interceptor: Interceptor
    @Inject private static var multipartInterspector: MultipartInterceptor
    @Inject private static var unAuthorizedAccessTokenPublisher: PassthroughSubject<Void, Never>
    
    static func performRequest<T: Codable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            AF.request(route, interceptor: interceptor)
                .responseDecodable(of: T.self, queue: .main, decoder: JSONDecoder(), completionHandler: { response in
                    debugPrint("㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒")
                    debugPrint("Request URL endpoint is: \(route.path)")
                    debugPrint("response.statusCode is: \(String(describing: response.response?.statusCode))")
                    debugPrint("response.result: \(response.result)")
                    debugPrint("response.response: \(String(describing: response.response))")
                    debugPrint("㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒㏒")
                    if let status = HttpsStatus(rawValue: response.response?.statusCode ?? 0),
                       status == .UNAUTHORIZED {
                        
                        DispatchQueue.main.async {
                            preferenceHelper.clearSavedData()
                            unAuthorizedAccessTokenPublisher.send()
                        }
                    } else {
                        switch response.result {
                        case .success(let deocdable):
                            promise(.success(deocdable))
                        case .failure(let error):
                            promise(.failure(error))
                        }
                    }
                })
        }
        .eraseToAnyPublisher()
    }
    
    static func performMultipartRequest<T: Codable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder(), image imageData: Data, imageName: String) -> AnyPublisher<T, Error> {
        return Future<Data, Error> { promise in
            AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData, withName: "image", fileName: imageName, mimeType: "image/*")
                },
                with: route,
                usingThreshold: UInt64.init(),
                interceptor: multipartInterspector
            )
            .validate(statusCode: 200...300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    promise(.success(data))
                case .failure(let error):
                    if let status = HttpsStatus(rawValue: error.responseCode ?? 0),
                       status == .UNAUTHORIZED {
                        DispatchQueue.main.async {
                            preferenceHelper.clearSavedData()
                            unAuthorizedAccessTokenPublisher.send()
                        }
                    } else {
                        promise(.failure(error))
                    }
                }
            }
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
