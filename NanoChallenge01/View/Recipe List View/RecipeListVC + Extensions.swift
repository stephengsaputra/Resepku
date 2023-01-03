//
//  RecipeListVC + Extensions.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 04/01/23.
//

import UIKit

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: recipeViewCell.identifier, for: indexPath) as! recipeViewCell
        
        cell.configureUI()
        cell.recipeImageView.image = UIImage(data: recipes?[indexPath.row].image ?? Data())
        cell.recipeNameLabel.text = recipes?[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedRow = indexPath.row
        
        let vc = RecipeDetailsViewController()
        vc.recipeID = recipes?[selectedRow].id ?? 0
        vc.recipeTitle = recipes?[selectedRow].title ?? ""
        vc.recipeImage = UIImage(data: recipes?[selectedRow].image ?? Data())
        vc.recipeIngredients = recipes?[selectedRow].ingredients ?? ""
        vc.recipeDirections = recipes?[selectedRow].directions ?? ""
        vc.delegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let contextMenu = UIContextMenuConfiguration(identifier: indexPath as NSIndexPath) {

            let selectedRow = indexPath.row
            
            let vc = RecipeDetailsViewController()
            vc.recipeID = self.recipes?[selectedRow].id ?? 0
            vc.recipeTitle = self.recipes?[selectedRow].title ?? ""
            vc.recipeImage = UIImage(data: self.recipes?[selectedRow].image ?? Data())
            vc.recipeIngredients = self.recipes?[selectedRow].ingredients ?? ""
            vc.recipeDirections = self.recipes?[selectedRow].directions ?? ""
            vc.delegate = self
            
            return vc
            
        } actionProvider: { element in
            
            let deleteAction = UIAction(title: "Delete recipe", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                
                let alertController = UIAlertController(title: "Delete recipe", message: "Are you sure that you want to delete this recipe?", preferredStyle: .alert)
                
                let firstAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                    print("DELETE")
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(firstAction)
                alertController.addAction(cancelAction)
                
                alertController.view.tintColor = .primaryColor
                
                self.present(alertController, animated: true)
            }
            
            let menu = UIMenu(title: "", children: [deleteAction])
            
            return menu
        }

        return contextMenu
    }
    
    func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        
        guard let vc = animator.previewViewController else { return }
        
        animator.addCompletion {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension RecipeListViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    
}

extension RecipeListViewController: ReloadCoreDataDelegate {
    
    func reloadData() {
        fetchData()
        self.recipeCollectionView.reloadData()
    }
}

extension RecipeListViewController: ReloadCoreDataAfterUpdateDelegate {
    
    func reloadTable() {
        fetchData()
        self.recipeCollectionView.reloadData()
    }
}
