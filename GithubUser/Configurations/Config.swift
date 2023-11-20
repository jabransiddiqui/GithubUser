//
//  Config.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

class ServerConfig: NetworkClientServerInfo {
    var apiKey: String {
        return ""
    }
    var baseURL: String {
        return "https://api.github.com"
    }
}

class ExternalServerConfig : NetworkClientServerInfo {
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    var baseURL: String = ""
}

