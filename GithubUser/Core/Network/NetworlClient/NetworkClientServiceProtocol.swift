//
//  NetworkClientServiceProtocol.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import Combine

// MARK: Network Client Service Protocol
/*
    Network Client service protocol
 */
protocol NetworkClientServiceProtocol: AnyObject {
    associatedtype Target: NetworkClientEndpoint
    // Session configuration can be set for this API
    var config: URLSessionConfiguration? { get set }

    // actual method that handles the network call and relay the response back after parsing json
    func fetch<T: Decodable>(_ target: Target) -> AnyPublisher<T, Error>
}
