//
//  DatabaseOperationProtocol.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Query options
/*
    Query options
 */
public struct Sorted {

    // sort by key
    var key: String

    // sort direction
    var ascending: Bool = true

}

// MARK: Readable Operation
/*
    Operations for readable storage
 */

protocol ReadableDatabaseOperation {
    // Return a list of objects that are conformed to the `Storable` protocol
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?, completion: (([T]) -> Void))
}

// MARK: Writeable Operation
/*
    Operations for writeable storage
 */

protocol WriteableDatabaseOperation {
    
    // MARK: Save - Single Storable Object
    /*
        Save an object that is conformed to the `Storable` protocol
     */
    func save(object: Storable) throws
    
    // MARK: Delete - Single Storable Object
    /*
        Delete an object that is conformed to the `Storable` protocol
     */
    func delete<T: Storable>(_ model: T.Type, predicate: NSPredicate?) throws
}
