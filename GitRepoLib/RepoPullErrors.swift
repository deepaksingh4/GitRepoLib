//
//  RepoPullErrors.swift
//  GitRepoLib
//
//  Created by Deepak on 05/10/22.
//

import Foundation

public enum GitApiErrors: Error {
    case timeout
    case InvalidURL
    case HTTPError(code: Int?, description: String)
    case Unknown
}
