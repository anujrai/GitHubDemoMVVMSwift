//
//  NetworkWrapper.swift
//  GitHubDemo
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//

import Foundation


/// This class is going to be the interface for the RestClient and will give the customizable data

let url = URL(string: "https://api.github.com/users/anujrai/repos")

private let _sharedInstance = NetworkWrapper()

class NetworkWrapper{

      fileprivate init(){}
        static var sharedInstance: NetworkWrapper {
            return _sharedInstance
        }
    func fetchRepoListOfUser(onSuccess success: @escaping (_ JSON: [[String:Any]]) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void) {
        var repoRecord = [[String:Any]]()
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("returning error")
                failure(error)
                return
            }
            guard let content = data else {
                failure(error)
                print("not returning data")
                return
            }
            guard let json : [[String:Any]] = (try? JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [[String:Any]])  else {
                print("Not containing JSON")
                return
            }
            repoRecord = json
            success(repoRecord)
        }
        task.resume()
    }
}

