//
//  DatabaseClient.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Database Client Protocol
/*
    Database protocol
 */
protocol DatabaseClientService: AnyObject { }

extension DatabaseClientService { }

// MARK: Database Client
/*
    Client
 */
class DatabaseClient {
    public var database: DatabaseContext
    required public init(database: DatabaseContext) {
        self.database = database
    }
}
