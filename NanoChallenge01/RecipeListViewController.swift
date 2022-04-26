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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
    }
}

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = recipeCollectionView.dequeueReusableCell(
            withReuseIdentifier: "recipeViewCell",
            for: indexPath) as! recipeViewCell
        cell.recipeImage.image = UIImage(named: "9")
        cell.recipeTitle.text = "Test"
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor(
            red: 0.11,
            green: 0.11,
            blue: 0.11,
            alpha: 0.15).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        rowSelected = indexPath.row
        performSegue(withIdentifier: "toRecipeDetails", sender: self)
    }
}
