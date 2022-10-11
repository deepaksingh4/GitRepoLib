//
//  GitRequestURLBuilder.swift
//  GitRepoLib
//
//  Created by Deepak on 08/10/22.
//

import Foundation

class GitRequestURLBuilder {

    private var components: URLComponents

    init() {
        self.components = URLComponents()
    }

    func set(scheme: URLSchemes) -> GitRequestURLBuilder {
        self.components.scheme = scheme.rawValue
        return self
    }

    func set(host: RepoHosts) -> GitRequestURLBuilder {
        self.components.host = host.rawValue
        return self
    }

    func set(port: Int) -> GitRequestURLBuilder {
        self.components.port = port
        return self
    }

    func set(path: String) -> GitRequestURLBuilder {
        var path = path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        self.components.path = path
        return self
    }

    func addQueryItem(name: String, value: String) -> GitRequestURLBuilder  {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: name, value: value))
        return self
    }

    func build() -> URL? {
        return self.components.url
    }
}
