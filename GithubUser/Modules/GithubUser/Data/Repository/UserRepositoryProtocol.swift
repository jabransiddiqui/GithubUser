//
//  UserRepositoryProtocol.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 18/11/2023.
//

import Combine

// MARK: User Repository Protocol
/*
 User Repository Protocol methods definations
 */
protocol UserRepositoryProtocol {
    func getUsers() -> AnyPublisher<GithubUsers, Error>
    func getDBUsers() throws -> GithubUsers?
    func saveUser(user : GithubUser) throws
    func deleteUser(user : GithubUser) throws
}
