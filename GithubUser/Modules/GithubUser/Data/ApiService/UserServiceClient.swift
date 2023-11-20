//
//  UserServiceClient.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import Combine

// MARK: User Service Client
/*
 User Service implemenation of User service protocols
 */

class UserServiceClient: UrlSessionProvider<UserEndpoint>,UserServiceProtocol {
    init() {super.init()}
    
    func getUsers() -> AnyPublisher<GithubUsers, Error> {
        return  super.fetch(.getUsers)
    }
}
