//
//  RepoListCoordinator.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 24/07/23.
//

import UIKit

public class RepoListCoordinator: NSObject, Coordinator {
    public var childCoordinator = [Coordinator]()
    public var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewModel = RepoListViewModel()
        let viewController = RepoListViewController(viewModel: viewModel)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

    func goToDetailsPage(repository: Repository) {
            let coordinator = RepoDetailCoordinator(navigationController: navigationController, repository: repository)
        coordinator.start()
    }
}
