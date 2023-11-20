//
//  ClientServerInfo.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Network Client Server Params
/*
    A dictionary of parameters to apply to a `URLRequest`.
 */
public typealias Params = [String: Any]

// MARK: Network Client Server Headers
/*
    A dictionary of headers to apply to a `URLRequest`.
 */

public typealias Headers = [String: String]


// MARK: Network Client Protocol
/*
    Client Server information protocol
 */
protocol NetworkClientServerInfo: AnyObject {

    // The target's base `URL` based on environment settings.
    var baseURL: String { get }

    // Application key for getting the OAuth access token
    var apiKey: String { get }
}

// MARK: Default Network Client Server Implementation
/*
    Default Implementation of Client Server Config for API Key
 */

extension NetworkClientServerInfo {
    public var apiKey: String {
        return ""
    }
}
