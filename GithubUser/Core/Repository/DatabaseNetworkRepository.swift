//
//  DatabaseNetworkRepository.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Network & Databse Client Repository
/*
    Databse Client Repository for Modules repo for databse
 
    Parameter(Database) : DatabaseClientService
    Parameter(Network)  : NetworkClientService
 
 */

class DatabaseNetworkRepository<Database: DatabaseClientService , Network: NetworkClientService> {
    var database: Database
    var client: Network
    required init(database: Database, client: Network ) {
        self.database = database
        self.client = client
    }
}
