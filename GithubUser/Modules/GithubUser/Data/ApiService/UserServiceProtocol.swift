//
//  UserServiceProtocol.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Combine
import SwiftUI

// MARK: User Service Protocol
/*
 User Service Protocol methods definations
 */
protocol UserServiceProtocol : NetworkClientService {
    func getUsers() -> AnyPublisher<GithubUsers, Error>
}
