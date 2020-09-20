//
//  Network.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import UIKit

enum NetworkingError: Error {
    case invalidURL
    case emptyResponse
    case userAlreadyTaken
    case badCredentials
    
    func getMessage() -> String {
        switch self {
        case .userAlreadyTaken:
            return "This user already exists."
        case .badCredentials:
            return "Authentication failed."
        default:
            return ""
        }
    }
}

enum Result<T,U> {
    case onSuccess(T),
         onFailure(U)
}

struct RequestData {
    let path: String
    let method: Alamofire.HTTPMethod
    let headers: [String: String]?
    let parameters: [String: Any?]
    
    init(
        path: String,
        method: Alamofire.HTTPMethod = .get,
        headers: [String: String]? = nil,
        parameters: [String: Any?] = [:]
        ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
    
    func normalizedParameters() -> [String : Any] {
        var normalizedParams = [String: Any]()
        
        for entry in parameters {
            if let value = entry.value {
                normalizedParams[entry.key] = value
            }
        }
        
        return normalizedParams
    }
}

protocol NetworkCaseType {
    associatedtype ResponseType: Codable
    var request: RequestData { get }
}

extension NetworkCaseType {
    func dispatch(onResult: @escaping (Result<ResponseType, Error>) -> Void) {
        let request = self.request
        Alamofire
            .request(
                request.path,
                method: request.method,
                parameters: request.normalizedParameters(),
                encoding: request.method == .get ? URLEncoding.default : JSONEncoding.default,
                headers: request.headers
            )
            .responseJSON { (response: DataResponse<Any>) in
                
                guard let data = response.data else {
                    onResult(.onFailure(NetworkingError.emptyResponse))
                    return
                }
                
                do {
                   
                    let responseValue = try JSONDecoder().decode(ResponseType.self, from: data)
                    
                    
                    if response.response?.statusCode == 409 {
                        onResult(.onFailure(NetworkingError.userAlreadyTaken))
                        return
                    }
                    if response.response?.statusCode == 401 {
                        onResult(.onFailure(NetworkingError.badCredentials))
                        return
                    }
                    if response.response?.statusCode == 422 {
                        onResult(.onFailure(NetworkingError.userAlreadyTaken))
                        return
                    }
                    
                    onResult(.onSuccess(responseValue))
                
                } catch let error {
                    onResult(.onFailure(error))
                }
        }
    }
}

extension NetworkCaseType {
    func rx_dispatch() -> Observable<ResponseType> {
        return Observable<ResponseType>.create({ (observer) -> Disposable in
            self.dispatch(onResult: { (result) in
                switch result {
                case .onSuccess(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .onFailure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
}

