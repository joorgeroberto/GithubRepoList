//
//  AppDelegate.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 16/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow(frame: UIScreen.main.bounds)
        rootCoordinator = RootCoordinator(window: self.window)
        rootCoordinator?.start()

        return true
    }
}

