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
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeImageTableViewCell.identifier) as! RecipeImageTableViewCell
        cell.recipeImageView.image = recipeImage
        cell.configureUI()
        
        return cell
    }
}
