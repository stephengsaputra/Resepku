//
//  AddRecipeViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit

protocol ReloadCoreDataDelegate: AnyObject {
    
    func reloadData()
}

class AddRecipeViewController: UIViewController {
    
    var delegate: ReloadCoreDataDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem!.isEnabled = false
    }
    
    @IBAction func addRecipePressed(_ sender: Any) {
        showAlert()
        (children.first as? FormTableViewController)?.save()
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Recipe Added", message: "Your recipe is now added to your cook book!", preferredStyle: .alert)
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
            if let vc = segue.destination as? FormTableViewController {
                vc.delegate = self
            }
        }
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
