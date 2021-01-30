//
//  WebService.swift
//  FBReposOnGitHub
//
//  Created by Azza on 29/01/2021.
//

import Foundation

class WebService {
    
    func getRepositories(url: URL, completion: @escaping ([Repository]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let repositories = try? JSONDecoder().decode([Repository].self, from: data)
                if let repositories = repositories {
                    print("data: \(repositories.count)")
                    completion(repositories)
                }
            }
        }.resume()
    }
}
