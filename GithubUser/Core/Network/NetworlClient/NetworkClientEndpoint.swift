//
//  NetworkEndpoint.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Network Endpoint
/*
    Network Endpoint Protocols
 */
protocol NetworkClientEndpoint {

    // Base information about the server common for all endpoints
    var server: NetworkClientServerInfo { get }

    // The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    // The HTTP method used in the request.
    var httpMethod: String { get }

    // The HTTP method used in the request.
    var headers: Headers? { get }

    // The parameters for the call
    var parameters: Params? { get }
    
    // The parameters for the call
    var queryParameters: Params? { get }

}

// MARK: Default Implmentations Of Endpoint
/*
    Default Implmentations
 */
extension NetworkClientEndpoint {

    /// Utility computed property to make the complete URL
    public var endPoint: URL {
        return URL(string: server.baseURL + path)!
    }

    /// Default value for HTTP method is GET
    public var httpMethod: String { return .httpGet }

    /// Default value for HTTP headers is json
    public var headers: Headers? {
        return ["Content-type": "application/json"]
    }

    /// Default parameters are nil
//    public var parameters: Params? { return nil }

}
