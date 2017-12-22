//
//  RepoTableViewCell.swift
//  GitHubDemo
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//


/* This UItableViewCell is used in RepoTableViewController to show the repo name and description*/

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var labelRepoName : UILabel! // For showing name of repo
    @IBOutlet weak var labelDescription : UILabel! // showing description about repo
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
