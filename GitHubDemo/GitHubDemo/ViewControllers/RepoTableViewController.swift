//
//  RepoTableViewController.swift
//  GitHubDemo
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
    let repoCellIdentifier = "RepoTableViewCell"
    var objRepoViewModal = RepoViewControllerViewModal()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 95
        objRepoViewModal.callRepoListApi(onSuccess: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, onFailure: { (error) in
            print("RepoList Api is failed")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    // MARK: - Table view DataSource & Delagtes
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:100))
        let labelForTitle = UILabel.init(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:100))
        labelForTitle.text = "Anuj Repos"
        labelForTitle.textColor = UIColor.black
        labelForTitle.textAlignment = .center
        headerView.addSubview(labelForTitle)
        headerView.backgroundColor = UIColor.gray
        return headerView
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objRepoViewModal.repoList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repoCell = tableView.dequeueReusableCell(withIdentifier: repoCellIdentifier, for: indexPath) as! RepoTableViewCell
        repoCell.labelRepoName.text = objRepoViewModal.repoList[indexPath.row].repoName
        repoCell.labelDescription.text = objRepoViewModal.repoList[indexPath.row].description
        return repoCell
    }
}

