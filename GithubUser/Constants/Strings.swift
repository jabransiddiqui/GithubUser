//
//  Strings.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

struct Strings {
    // MARK: String of App Error Messages
    struct AppErrorMessage {
        static let unknownErrorMessage = "Unknow Error"
        static let dataIsNilMessage = "Data is nil"
        static let invalidURLMessage = "Provided url is invalid"
        static let  networkError = "Network error"
        static let  decodingError = "Json decoding error"
        static let dbIsNotInit = "Database is not initialized"
    }
    struct AppMessage {
        static let homeScreenTitleText = "Github Users"
        static let homeFilterAllText = "All"
        static let homeFilterFavoriteText = "Favorite"
        static let noResult = "No data found"
    }
}

