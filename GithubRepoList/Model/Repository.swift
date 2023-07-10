//
//  Repository.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 26/06/23.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name, description, owner, id
        case fullName = "full_name"
    }
}

struct Owner: Codable {
    let id: Int
    let login: String
    let nodeId: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, login
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
    }
}
