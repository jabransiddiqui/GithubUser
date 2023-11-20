//
//  GithubUserModel.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation
import RealmSwift


// MARK: - Github User List type
typealias GithubUsers = [GithubUser]

// MARK: - Github User Model
class GithubUser: Object, Codable {
    @Persisted var login: String?
    @Persisted var id : Int?
    @Persisted var avatarURL: String?
    @Persisted var type: String?
    @Persisted var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case type
    }
    
    override init() { }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        avatarURL = try values.decodeIfPresent(String.self, forKey: .avatarURL)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        isFavorite = false
    }
    
    
    
}
