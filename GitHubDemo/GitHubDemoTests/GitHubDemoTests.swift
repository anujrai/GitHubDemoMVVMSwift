//
//  GitHubDemoTests.swift
//  GitHubDemoTests
//
//  Created by Anuj Rai on 12/22/17.
//  Copyright © 2017 Anuj Rai. All rights reserved.
//

import XCTest
@testable import GitHubDemo

class GitHubDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWebservice(){
        let objRepoViewModal = RepoViewControllerViewModal()
        objRepoViewModal.callRepoListApi(onSuccess: {
            XCTAssertGreaterThan(objRepoViewModal.repoList.count, 0, "Test fail due to empty API response")
        }) { (error) in
            XCTFail("Test Fail due to API error response")
        }
    }
    
    func testModel(){
        let dic = ["name":"Test","description": "xyz...."]
        let model = RepoModal(jsonData: dic)
        XCTAssertNotNil(model.repoName)
    }
    
    func testViewControllerVC() {
        let storyBoard = UIStoryboard(name:"Main", bundle: Bundle.main)
        guard let _:RepoTableViewController = storyBoard.instantiateViewController(withIdentifier: "RepoController") as? RepoTableViewController else{
            XCTFail("Could not instantiate vc from Main storyboard")
            return
        }
    }
    
}
