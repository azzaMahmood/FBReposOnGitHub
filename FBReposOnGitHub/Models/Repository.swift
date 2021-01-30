//
//  Repositories.swift
//  FBReposOnGitHub
//
//  Created by Azza on 29/01/2021.
//


import Foundation

// MARK: - Repositoriy
struct Repository: Decodable {
    let name: String
    let description: String
    let forks: Int
    let fork: Bool
    let owner: Owner
}

struct Owner: Decodable {
    let avatar_url: String
}
