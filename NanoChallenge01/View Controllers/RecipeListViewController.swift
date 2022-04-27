//
//  ViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var rowSelected: Int?
    
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        recipes = DataSeeder().generateRecipes()
        
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
    }
    
    @IBAction func unwindToRecipeListView(_ sender: UIStoryboardSegue) { }
}

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = recipeCollectionView.dequeueReusableCell(
            withReuseIdentifier: "recipeViewCell",
            for: indexPath) as! recipeViewCell
        cell.recipeImage.image = recipes[indexPath.row].image
        cell.recipeTitle.text = recipes[indexPath.row].recipeTitle
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor(
            red: 0.11,
            green: 0.11,
            blue: 0.11,
            alpha: 0.15).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        rowSelected = indexPath.row
        performSegue(withIdentifier: "toRecipeDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let selectedRow  = rowSelected {
            if let destination = segue.destination as? RecipeDetailsViewController {
                destination.recipeTitle = recipes[selectedRow].recipeTitle ?? ""
                destination.recipeImage = recipes[selectedRow].image ?? UIImage()
                destination.recipeIngredients = recipes[selectedRow].ingredients ?? ""
            }
        }
    }
}
