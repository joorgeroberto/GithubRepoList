//
//  RepoListViewController.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 16/06/23.
//

import UIKit

// MVVM
/*Model
 View - Storyboard e a View Controller
 View Model
 */

class RepoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    var viewModel = RepoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel.delegate = self
        
        self.showLoading()
        self.tableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
        self.viewModel.fecthRepositories()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoDetailsViewController = UIStoryboard(name: "RepoDetailsViewController", bundle: nil).instantiateInitialViewController() as! RepoDetailsViewController
        
        let repository = self.viewModel.repositories[indexPath.row]
        repoDetailsViewController.viewModel = RepoDetailsViewModel(repository: repository)

        self.navigationController?.pushViewController(repoDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell") as! RepositoryCell
        let repository = self.viewModel.repositories[indexPath.row]
        cell.setup(repository: repository)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.repositories.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension RepoListViewController: RepoListViewModelDelegate {
    func onSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.dismissLoading()
        }
    }
    
    func onError(title: String, errorMessage: String) {
        DispatchQueue.main.async {
            self.showAlert(title: title, message: errorMessage)
            self.dismissLoading()
        }
    }
}
