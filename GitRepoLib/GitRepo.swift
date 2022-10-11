//
//  GitRepo.swift
//  GitRepoLib
//
//  Created by Deepak on 04/10/22.
//

import Foundation

protocol GitRepoProtocol {

    var apiService: APIServiceProtocol {get}
    func search(_ request: SearchRequest, completion: @escaping (Result<RepositoryModel, GitApiErrors>) -> Void) throws
}


struct GitRepo: GitRepoProtocol {

    var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

   public func search(_ request: SearchRequest, completion: @escaping (Result<RepositoryModel, GitApiErrors>) -> Void) throws {
        self.apiService.get(urlRequest: try request.getURLRequest(), completion: completion)
    }
}
