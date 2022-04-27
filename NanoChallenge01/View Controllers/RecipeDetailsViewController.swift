//
//  RecipeDetailsViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    
    var recipeTitle: String = ""
    var recipeImage: UIImage!
    var recipeIngredients: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        recipeTitleLabel.text = recipeTitle
        recipeImageView.image = recipeImage
        recipeIngredientsTextView.text = recipeIngredients
    }
}
