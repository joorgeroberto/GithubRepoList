//
//  RootCoordinator.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 24/07/23.
//

import UIKit

public class RootCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    public var childCoordinator = [Coordinator]()
    public var navigationController = UINavigationController()
    public var rootViewController: UIViewController { navigationController }
    private weak var window: UIWindow?

    public init(window: UIWindow?) {
        self.window = window
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        super.init()
    }

    public func start() {
        let coordinator = RepoListCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
