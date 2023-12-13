//
//  RepoDetailCoordinator.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 24/07/23.
//


import UIKit

public class RepoDetailCoordinator: NSObject, Coordinator {
    public var childCoordinator = [Coordinator]()
    public var navigationController: UINavigationController
    private var repository: Repository
    
    init(navigationController: UINavigationController, repository: Repository) {
        self.navigationController = navigationController
        self.repository = repository
    }
    
    public func start() {
        let viewModel = RepoDetailsViewModel(repository: repository)
        let viewController = RepoDetailsViewController(viewModel: viewModel)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }
}
