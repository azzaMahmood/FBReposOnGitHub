//
//  RepositoryViewModel.swift
//  FBReposOnGitHub
//
//  Created by Azza on 29/01/2021.
//

import Foundation

struct RepositoryCollectionViewModel {
    let repositories: [Repository]
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems() -> Int {
        return repositories.count
    }
    
    func repositoryAtIndex(_ index: Int) -> RepositoryViewModel {
        let repository = repositories[index]
        return RepositoryViewModel(repository)
    }
}

struct RepositoryViewModel {
    private let repository: Repository
    
    init(_ repositories: Repository) {
        self.repository = repositories
    }
    
    var name: String {
        return repository.name
    }

    var description: String {
        return repository.description
    }

    var forksCount: String {
        return "\(repository.forks)"
    }
    
    var isForked: Bool {
        return repository.fork
    }
    
    var avatarUrl: String {
        return repository.owner.avatar_url
    }
}
