//
//  FormTableViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    @IBOutlet weak var recipeFormTableView: UITableView!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    @IBOutlet weak var recipeIngredientsTextViewHC: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    func textViewDidChange(_ textView: UITextView) {

        let fixedWidth = recipeIngredientsTextView.frame.size.width
        recipeIngredientsTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = recipeIngredientsTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = recipeIngredientsTextView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        recipeIngredientsTextView.frame = newFrame;
        recipeIngredientsTextViewHC.constant = newFrame.size.height
        recipeFormTableView.beginUpdates()
        recipeFormTableView.endUpdates()
    }
    
    // MARK: - Source Image
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
        
        alert.addAction(cameraButton)
        alert.addAction(galleryButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension FormTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Error")
            return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            recipeImageView.image = selectedImage
        } else {
            print("Image not found")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
