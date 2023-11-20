//
//  UserDbServiceProtocol.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 18/11/2023.
//

import Foundation

// MARK: Databse Service Protocol
/*
 Databse Service Protocol methods definations
 */
protocol UserDbServiceProtocol: DatabaseClientService {
    func saveUser(user: GithubUser) throws
    func getUsers(predicate: NSPredicate?) -> GithubUsers?
    func deleteUser(predicate: NSPredicate?) throws
}
