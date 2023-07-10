//
//  UIViewController+Extensions.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 26/06/23.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )

        alert.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil)
        )

        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func showLoading() {
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: UIAlertController.Style.alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    func dismissLoading() {
        dismiss(animated: false, completion: nil)
    }
}
