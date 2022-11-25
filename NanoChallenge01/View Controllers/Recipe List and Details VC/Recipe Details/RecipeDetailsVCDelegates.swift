//
//  RecipeDetailsVCDelegates.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 25/11/22.
//

import Foundation
import UIKit
import SnapKit

extension RecipeDetailsViewController: ReloadRecipeDetailDelegate {
    
    func reloadData(title: String, ingredients: String, directions: String, image: UIImage) {
        
        self.recipeTitleLabel.text = title
        self.recipeImageView.image = image
        self.recipeIngredientsTextView.text = ingredients
        self.recipeDirectionsTextView.text = directions
    }
}

extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeImageTableViewCell.identifier) as! RecipeImageTableViewCell
            cell.recipeImageView.image = recipeImage
            cell.recipeNameLabel.text = recipeTitle
            cell.configureUI()
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeIngredientsTableViewCell.identifier) as! RecipeIngredientsTableViewCell
            cell.recipeIngredientsHeaderLabel.text = "Ingredients"
            cell.recipeIngredientsLabel.text = recipeIngredients
            cell.configureUI()
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDirectionsTableViewCell.identifier) as! RecipeDirectionsTableViewCell
        cell.recipeDirectionsHeaderLabel.text = "Directions"
        cell.recipeDirectionsLabel.text = recipeDirections
        cell.configureUI()
        cell.selectionStyle = .none
        
        return cell
    }
}
