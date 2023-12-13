//
//  Coordinator.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 24/07/23.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
