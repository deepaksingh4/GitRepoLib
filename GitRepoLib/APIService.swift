//
//  APIService.swift
//  GitRepoLib
//
//  Created by Deepak on 09/10/22.
//

import Foundation

protocol APIServiceProtocol{
    
    func get<T:Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, GitApiErrors>) -> Void)
}


struct APIService: APIServiceProtocol {

    func get<T:Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, GitApiErrors>) -> Void){

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else{
                completion(.failure(GitApiErrors.HTTPError(code: nil, description: error.debugDescription)))
                return
            }
            guard let response = response as? HTTPURLResponse else{
                completion(.failure(GitApiErrors.HTTPError(code: nil, description: "Invalid response")))
                return
            }

            switch response.statusCode{
                case 200...299: //Success
                    guard let data = data else {
                        completion(.failure(GitApiErrors.HTTPError(code: response.statusCode, description: "No data found")))
                        return
                    }
                    guard let model = try? JSONDecoder().decode(T.self, from: data) else{
                        return
                    }
                    completion(.success(model))

                case 400...:
                    completion(.failure(GitApiErrors.HTTPError(code: response.statusCode, description: response.description)))

                default:
                    completion(.failure(GitApiErrors.HTTPError(code: response.statusCode, description: response.description)))
            }



        }
    }
}
