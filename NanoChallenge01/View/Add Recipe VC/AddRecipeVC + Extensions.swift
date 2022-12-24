//
//  AddRecipeVC + Extensions.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 08/12/22.
//

import UIKit

extension AddRecipeVC: AddRecipeVCDelegate {
    
    func showCameraPicker() {
        
        let alert = UIAlertController(title: "Select Image", message: "Where do you want to choose your recipe photo?", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { action in
            self.showImagePicker(selectedSource: .camera)
        }
        
        let galleryButton = UIAlertAction(title: "Photo Gallery", style: .default) { action in
            self.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.view.tintColor = UIColor.primaryColor
        alert.addAction(cameraButton)
        alert.addAction(galleryButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddRecipeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else { return }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = true
        imagePickerController.view.tintColor = UIColor.primaryColor
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
//        recipeImageView.image = image
//        recipeModel.image = recipeImageView.image
//        validateRecipeModel()

        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
