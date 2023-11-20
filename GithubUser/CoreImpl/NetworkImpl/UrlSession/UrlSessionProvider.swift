//
//  UrlSessionProvider.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import Combine

// MARK: URL Session Implementation of Core Network
/*
 This class provided an implmentation of NetworkClientServiceProtocol by using URL Session.
 */

class UrlSessionProvider<Target: NetworkClientEndpoint>: NetworkClientServiceProtocol {
    
    public var config: URLSessionConfiguration? {
        didSet {
            if let config = config {
                manager = URLSession(configuration: config)
            }
        }
    }
    
    private var manager: URLSession
    
    
    public init(_ config: URLSessionConfiguration? = nil) {
        let config = config ?? URLSessionConfiguration.default
        self.manager = URLSession(configuration: config)
    }
    
    
    func fetch<T : Decodable>(_ target: Target) -> AnyPublisher<T, Error> {
        
        let url =  target.endPoint
        
        var request = URLRequest(url: url)
        request.httpMethod = target.httpMethod
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                
                guard let code = (response as? HTTPURLResponse)?.statusCode else {
                    throw AppErrors.noInternet
                }
                
                guard (200..<300).contains(code) else {
                    throw AppErrors.serverError(code)
                }
                return data
            }
            .mapError({ error in
                switch error {
                case is Swift .DecodingError:
                    return AppErrors.decodingError
                case let urlError as URLError:
                    return AppErrors.urlError(urlError)
                default:
                    return AppErrors.other(error)
                }
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
