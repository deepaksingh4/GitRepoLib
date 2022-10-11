//
//  SearchRequest.swift
//  GitRepoLib
//
//  Created by Deepak on 09/10/22.
//

import Foundation

enum Platforms: String {
    case iOS = "iOS"
    case Android = "android"
}

enum URLSchemes: String {
    case HTTPS = "https"
    case HTTP = "http"
}

enum RepoHosts: String {
    case GitSearch = "https://api.github.com/search/repositories"
}

public struct SearchRequest{
    let platfrom: Platforms
    let organization: String

   internal func getURLRequest() throws -> URLRequest  {
        guard let url = prepareURL() else
        {
            throw GitApiErrors.InvalidURL
        }

        return URLRequest(url: url)

    }

   private func prepareURL() -> URL?{
        return  GitRequestURLBuilder()
            .set(scheme:.HTTPS)
            .set(host: RepoHosts.GitSearch)
            .addQueryItem(name: "q", value: "\(platfrom.rawValue) org: \(organization)")
            .build()
    }
}
