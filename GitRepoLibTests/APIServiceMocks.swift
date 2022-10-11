    //
    //  APIServiceMocks.swift
    //  GitRepoLibTests
    //
    //  Created by Deepak on 10/10/22.
    //

import Foundation

@testable import GitRepoLib

struct APIServiceMock: APIServiceProtocol{

    func get<T>(urlRequest: URLRequest, completion: @escaping (Result<T, GitRepoLib.GitApiErrors>) -> Void) where T : Decodable {
        let data = loadStub(name: "repoStubSuccess", extension: ".json")
        let decoder = JSONDecoder()
        do{
            let model = try decoder.decode(RepositoryModel.self, from: data)
            completion(.success(model as! T))
        }catch{
            return
        }
    }

    func loadStub(name: String, extension: String) -> Data {

        let bundle = Bundle.main
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try! Data(contentsOf: url!)

    }


}
