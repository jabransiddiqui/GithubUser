//
//  DatabaseContext.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Databse Operations context
/*
    Database Operation context
 */

//Prototocol for Database conetext
protocol DatabaseContext: ReadableDatabaseOperation & WriteableDatabaseOperation { }

// Storable object for operations
public protocol Storable { }


