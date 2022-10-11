//
//  RepositoryModel.swift
//  GitRepoLib
//
//  Created by Deepak on 04/10/22.
//

import Foundation

    // MARK: - RepositoryModel
public struct RepositoryModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decode(Int.self, forKey: .totalCount)
        self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        self.items = try container.decode([Item].self, forKey: .items)
    }
}

    // MARK: - Item
struct Item: Codable {
    let id: Int
    let name, fullName: String
    let itemPrivate: Bool
    let itemDescription: String
    let language: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case itemDescription = "description"
        case language
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.fullName = try container.decode(String.self, forKey: .fullName)
        self.itemPrivate = try container.decode(Bool.self, forKey: .itemPrivate)
        self.itemDescription = try container.decode(String.self, forKey: .itemDescription)
        self.language = try container.decode(String.self, forKey: .language)
    }
}

