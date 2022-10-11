//
//  GitRepoLibTests.swift
//  GitRepoLibTests
//
//  Created by Deepak on 04/10/22.
//

import XCTest
@testable import GitRepoLib

final class GitRepoLibTests: XCTestCase {

    var sut: GitRepoProtocol =  GitRepo()

    override func setUpWithError() throws {
        
        sut = GitRepo()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchSuccess(){
//        sut.search(<#T##request: SearchRequest##SearchRequest#>, completion: <#T##(Result<RepositoryModel, GitApiErrors>) -> Void#>)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
