//
//  UserRepository.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import Combine

// MARK: User Repository
/*
 User repository implemenation of User repository protocols
 */
class UserRepository <Network : UserServiceProtocol, Database: UserDbServiceProtocol> : DatabaseNetworkRepository<Database,Network>,UserRepositoryProtocol{

    func getUsers() -> AnyPublisher<GithubUsers, Error> {
       return self.client.getUsers()
    }
    
    func getDBUsers() -> GithubUsers? {
        return self.database.getUsers(predicate: nil)
    }
    
    func saveUser(user: GithubUser) throws {
        do{
            try self.database.saveUser(user: user)
        }catch let err {
            throw AppErrors.other(err)
        }
    }
    
    func deleteUser(user: GithubUser) throws  {
        do{
            try self.database.deleteUser(predicate: NSPredicate.init(format: "id == %d", user.id ?? ""))
        }catch let err {
            throw AppErrors.other(err)
        }
    }
}
