//
//  RepoViewControllerViewModal.swift
//  GitHubDemo
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//

/* ViewModal work as an Interactor for view and modal all Business logic of calling VC class should be here*/
import Foundation

class RepoViewControllerViewModal{
    var repoList = [RepoModal]()
    func callRepoListApi(onSuccess success: @escaping () -> Void, onFailure failure: @escaping (_ error: Error?) -> Void) {
        NetworkWrapper.sharedInstance.fetchRepoListOfUser(onSuccess: { (JSON) in
            for repoResult in JSON{
                let modal:RepoModal = RepoModal.init(jsonData: repoResult)
                self.repoList.append(modal)
            }
            print(self.repoList)
            success()
            
            }, onFailure: { (error) in})
    }
    
}
