//
//  RepoDetailsViewModel.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 10/07/23.
//

import Foundation

class RepoDetailsViewModel {
    let repository: Repository
    let avatarURL: URL?

    init(repository: Repository) {
        self.repository = repository
        self.avatarURL = URL(string: repository.owner.avatarUrl)
    }
}
