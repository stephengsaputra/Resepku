//
//  AddRecipeViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem!.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "formSegue" {
            if let vc = segue.destination as? FormTableViewController {
                vc.delegate = self
            }
        }
    }
    
    @IBAction func addRecipePressed(_ sender: Any) {
        showAlert()
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Recipe Added", message: "Your recipe is now added to your cook book!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { action in
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension AddRecipeViewController: FormDelegate {
    
    func disableAddButtton() {
        self.navigationItem.rightBarButtonItem!.isEnabled = false
    }
    
    func enableAddButton() {
        self.navigationItem.rightBarButtonItem!.isEnabled = true
    }
}
