//
//  RepoModel.swift
//  GitHubDemo
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//
/* Modal class for repo list*/
import Foundation

struct RepoModal:Codable{
    var repoName:String?
    var description:String?
    init(jsonData:[String:Any]) {
        if let name = jsonData["name"] as? String{
            self.repoName = name
        }
        if let desc = jsonData["description"] as? String{
            self.description = desc
        }
    }
}

