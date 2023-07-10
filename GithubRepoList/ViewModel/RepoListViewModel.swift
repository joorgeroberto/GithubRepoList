//
//  RepoListViewModel.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 26/06/23.
//

import Foundation

protocol RepoListViewModelDelegate {
    func onSuccess()
    func onError(title: String, errorMessage: String)
}

class RepoListViewModel {
    var repositories: [Repository] = []
    var delegate: RepoListViewModelDelegate?
    private let baseUrl = "https://api.github.com"
    
    func fecthRepositories() {
        let url = URL(string: baseUrl + "/repositories")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.onError(title: "Something went wrong", errorMessage: error.localizedDescription)
            } else if let data = data {
                let repositoriesList = try? JSONDecoder().decode([Repository].self, from: data)
                
                guard let repositoriesList = repositoriesList else {
                    self.delegate?.onError(title: "Something went wrong", errorMessage: "Error getting repositories.")
                    return
                }
                
                self.repositories = repositoriesList
                self.delegate?.onSuccess()
            }
        }.resume()
    }
}
