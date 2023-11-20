//
//  UserEndPoint.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
// MARK: - User Routes
enum UserEndpoint {
    case getUsers
    case getAvatar(url : String)
}

// MARK: - User Endpoint
extension UserEndpoint : NetworkClientEndpoint {
    
    var server: NetworkClientServerInfo {
        switch self {
        case .getUsers: return ServerConfig()
        case .getAvatar(url: let url):
            return ExternalServerConfig(baseURL: url)
        }
        
    }
    
    var httpMethod: String {
        switch self {
        case .getUsers: return .httpGet
        case .getAvatar: return .httpGet
        }
    }
    
    var path: String {
        switch self {
        case .getUsers: return "/users"
        case .getAvatar: return ""
        }
    }
    
    var parameters: Params? {
        return nil
    }
    
    var queryParameters: Params? {
        return nil
    }
}
