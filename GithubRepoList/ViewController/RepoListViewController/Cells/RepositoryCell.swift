//
//  RepositoryCell.swift
//  GithubRepoList
//
//  Created by Jorge de Carvalho on 03/07/23.
//

import UIKit

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownersNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(repository: Repository) {
        self.repoNameLabel.text = repository.fullName
        self.descriptionLabel.text = repository.description
        self.ownersNameLabel.text = repository.owner.login
    }
    
}
