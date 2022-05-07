//
//  EditRecipeViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 29/04/22.
//

import UIKit

protocol ReloadRecipeDetailDelegate: AnyObject {
    
    func reloadData()
}

class EditRecipeViewController: UIViewController {
    
    var delegate: ReloadRecipeDetailDelegate?
    
    var recipeID: Int64 = 0
    var recipeTitle = ""
    var recipeImage = UIImage()
    var ingredients = ""
    var directions = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem!.isEnabled = true
        print(recipeID)
    }
    
    @IBAction func doneEditingRecipePressed(_ sender: Any) {
        showAlert()
        (children.first as? EditRecipeFormTableVC)?.update()
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Recipe Updated", message: "Your changes has been saved!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { action in
            self.delegate?.reloadData()
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.view.tintColor = UIColor(named: "main")
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "formSegue" {
            if let vc = segue.destination as? EditRecipeFormTableVC {
                vc.recipeModel = Recipe(
                    id: self.recipeID,
                    title: self.recipeTitle,
                    image: self.recipeImage,
                    ingredients: self.ingredients,
                    directions: self.directions
                )
                vc.delegate = self
            }
        }
    }
}

extension EditRecipeViewController: EditFormDelegate {
    
    func disableAddButtton() {
        self.navigationItem.rightBarButtonItem!.isEnabled = false
    }
    
    func enableAddButton() {
        self.navigationItem.rightBarButtonItem!.isEnabled = true
    }
}
