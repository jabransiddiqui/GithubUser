//
//  UserDbService.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 18/11/2023.
//

import Foundation

// MARK: Database Service Client
/*
 Database Service implemenation of User service protocols
 */

class UserDbService: DatabaseClient,UserDbServiceProtocol {

    func saveUser(user: GithubUser) throws {
        do{
            try self.database.save(object: user)
        }catch let err {
            throw AppErrors.other(err)
        }
    }
    
    func getUsers(predicate: NSPredicate?) -> GithubUsers? {
        var user: GithubUsers?
        self.database.fetch(GithubUser.self, predicate: predicate, sorted: nil) { usersList in
            user = usersList.detached()
        }
        return user
    }
    
    func deleteUser(predicate: NSPredicate?) throws  {
        do{
            try self.database.delete(GithubUser.self, predicate: predicate)
        }catch let err {
            throw AppErrors.other(err)
        }
    }
}
