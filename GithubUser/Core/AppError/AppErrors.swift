//
//  AppErrors.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: App Errors
/*
    General Errors for apps error handling
 */

enum AppErrors : Error  {
    case noInternet
    case invalidUrl
    case serverError(Int)
    case decodingError
    case urlError(URLError)
    case other(Error)
    case dbIsNotInit
    case unknown
}
