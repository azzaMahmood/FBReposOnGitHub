//
//  RepositoryViewModel.swift
//  FBReposOnGitHub
//
//  Created by Azza on 29/01/2021.
//

import Foundation

struct RepositoryCollectionViewModel {
    let repositories: [Repositoriy]
    
    func numberOfCells() -> Int {
        return repositories.count
    }
    
    func repositoryAtIndex(_ index: Int) -> RepositoryViewModel {
        let repository = repositories[index]
        return RepositoryViewModel(repository)
    }
}

struct RepositoryViewModel {
    private let repository: Repositoriy
    
    init(_ repositories: Repositoriy) {
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
}
