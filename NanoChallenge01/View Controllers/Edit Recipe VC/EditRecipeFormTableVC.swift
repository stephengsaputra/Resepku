//
//  EditRecipeFormTableVC.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 30/04/22.
//

import UIKit
import CoreData

protocol EditFormDelegate: AnyObject {
    
    func enableAddButton()
    func disableAddButtton()
}

class EditRecipeFormTableVC: UITableViewController {
    
    @IBOutlet weak var recipeFormTableView: UITableView!
    
    @IBOutlet weak var recipeNameTextField: UITextField!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    @IBOutlet weak var recipeIngredientsTextViewHC: NSLayoutConstraint!
    
    @IBOutlet weak var recipeDirectionsTextView: UITextView!
    
    var recipeID: Int64 = 0
    var recipeTitle = ""
    var image: UIImage?
    var ingredients = ""
    var directions = ""
    
    // Data Model
    var recipes: [Recipes]!
    var recipeModel: Recipe = Recipe()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate: EditFormDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(recipeTitle)
        
        recipeID = recipeModel.id ?? 0
        
        recipeNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        recipeNameTextField.delegate = self
        recipeNameTextField.text = recipeModel.title
        
        recipeImageView.layer.borderWidth = 1
        recipeImageView.layer.borderColor = UIColor(named: "TF")?.cgColor
        recipeImageView.layer.cornerRadius = 5
        recipeImageView.image = recipeModel.image
        
        recipeIngredientsTextView.layer.borderWidth = 1
        recipeIngredientsTextView.layer.borderColor = UIColor(named: "TF")?.cgColor
        recipeIngredientsTextView.layer.cornerRadius = 5
        self.recipeIngredientsTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone1(sender:)))
        recipeIngredientsTextView.text = recipeModel.ingredients
        
        recipeDirectionsTextView.layer.borderWidth = 1
        recipeDirectionsTextView.layer.borderColor = UIColor(named: "TF")?.cgColor
        recipeDirectionsTextView.layer.cornerRadius = 5
        self.recipeDirectionsTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone2(sender:)))
        recipeDirectionsTextView.text = recipeModel.directions
    }
    
    // Save to Core Data
    func update() {
        
        fetchData()
        
        let results = recipes.filter { $0.id == recipeID }
       
        if results.isEmpty == false {
            
            print(results.count)

            results[0].setValue(recipeModel.title, forKey: "title")
            results[0].setValue(recipeModel.image?.pngData(), forKey: "image")
            results[0].setValue(recipeModel.ingredients, forKey: "ingredients")
            results[0].setValue(recipeModel.directions, forKey: "directions")
        }
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    }
    
    func fetchData() {
        
        do {
            self.recipes = try context.fetch(Recipes.fetchRequest())
        } catch {
            print(error)
        }
        
        self.recipes?.sort { $0.title ?? "" < $1.title ?? "" }
    }
    
    @objc func tapDone1(sender: Any) {
        
        self.view.endEditing(true)
        recipeModel.ingredients = recipeIngredientsTextView.text
        if recipeIngredientsTextView.text == "" {
            recipeModel.ingredients = nil
        }
        validateRecipeModel()
    }
    
    @objc func tapDone2(sender: Any) {
        
        self.view.endEditing(true)
        recipeModel.directions = recipeDirectionsTextView.text
        if recipeDirectionsTextView.text == "" {
            recipeModel.directions = nil
        }
        validateRecipeModel()
    }
    
    func validateRecipeModel() {
        
        if recipeModel.title != nil && recipeModel.image != nil && recipeModel.ingredients != nil && recipeModel.directions != nil {
            delegate?.enableAddButton()
        } else {
            delegate?.disableAddButtton()
        }
    }
    
    @IBAction func changeImageTapped(_ sender: Any) {
        showAlert()
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Select Image", message: "Where do you want to choose your recipe photo?", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { action in
            self.showImagePicker(selectedSource: .camera)
        }
        
        let galleryButton = UIAlertAction(title: "Photo Gallery", style: .default) { action in
            self.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.view.tintColor = UIColor(named: "main")
        alert.addAction(cameraButton)
        alert.addAction(galleryButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension EditRecipeFormTableVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Error")
            return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = true
        imagePickerController.view.tintColor = UIColor(named: "main")
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            recipeImageView.image = selectedImage
            recipeModel.image = recipeImageView.image
            validateRecipeModel()
        } else {
            print("Image not found")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension EditRecipeFormTableVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        recipeNameTextField.resignFirstResponder()
        recipeModel.title = recipeNameTextField.text
        if recipeNameTextField.text == "" {
            recipeModel.title = nil
        }
        validateRecipeModel()
        
        return true
    }
}
