//
//  RepositoriesViewController.swift
//  FBReposOnGitHub
//
//  Created by Azza on 29/01/2021.
//

import Foundation
import UIKit

class RepositoriesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var repositoryCollectionVM: RepositoryCollectionViewModel!
    var visibleIndexPath: IndexPath? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        guard let url = URL(string: AppUrlConstants.reposUrl) else { return }
        DispatchQueue.global().sync {
            
            
            WebService().getRepositories(url: url) { [weak self] (repositories) in
                guard let repositories = repositories else { return }
                self?.repositoryCollectionVM = RepositoryCollectionViewModel(repositories: repositories)
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 willDisplay cell: UICollectionViewCell,
                                 forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.8) {
            cell.alpha = 1
        }
    }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            
            return CGSize(width: collectionView.frame.width - 30, height: 300)
        }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.repositoryCollectionVM == nil ? 0 : repositoryCollectionVM.numberOfSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.repositoryCollectionVM.numberOfItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepositoryCollectionViewCell", for: indexPath) as? RepositoryCollectionViewCell
        else {
            fatalError("No cell is found")
        }
        let repositoryVM = self.repositoryCollectionVM.repositoryAtIndex(indexPath.item)
        
        cell.nameLabel.text = repositoryVM.name
        cell.nameLabel.layer.cornerRadius = 8
        cell.nameLabel.layer.masksToBounds = true
        cell.nameLabel.backgroundColor = repositoryVM.isForked ? UIColor.green : UIColor.white
        cell.descriptionLabel.text = repositoryVM.description
        cell.noOfForksLabel.text = repositoryVM.forksCount
        cell.avatarUrlButton.tag = indexPath.row
        cell.avatarUrlButton.addTarget(self, action: #selector(avatarButtonTapped(sender:)), for: .touchUpInside)
       
        return cell
    }
    
    @objc func avatarButtonTapped(sender:UIButton!) {
        let repositoryVM = self.repositoryCollectionVM.repositoryAtIndex(sender.tag)

        UIApplication.shared.open(URL(string: repositoryVM.avatarUrl)!)    }
}
