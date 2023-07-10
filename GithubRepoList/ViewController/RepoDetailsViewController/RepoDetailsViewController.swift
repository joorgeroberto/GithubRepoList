//
//  RepoDetailsViewController.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 03/07/23.
//

import UIKit
import Kingfisher

class RepoDetailsViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var ownersNameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    var viewModel: RepoDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupText()
        self.setupAvatar()
    }
    
    public func setupText() {
        title = viewModel?.repository.name

        self.repoNameLabel.text = self.viewModel?.repository.fullName
        self.descriptionLabel.text = self.viewModel?.repository.description
        self.ownersNameLabel.text = self.viewModel?.repository.owner.login
    }

    public func setupAvatar() {
        self.avatarImage.layer.borderColor = UIColor.black.cgColor
        self.avatarImage.layer.borderWidth = 1
        self.avatarImage.layer.cornerRadius = 50
        avatarImage.kf.setImage(with: viewModel?.avatarURL)
    }
}
