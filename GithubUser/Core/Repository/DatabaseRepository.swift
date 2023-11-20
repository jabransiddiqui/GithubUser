//
//  DatabaseRepository.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Databse Client Repository
/*
    Databse Client Repository for Modules repo for databse
 
    Parameter(Database) : DatabaseClientService
 */

class DatabaseClientRepository<Database: DatabaseClientService> {
    var database: Database
    required init(database: Database) {
        self.database = database
    }
}
