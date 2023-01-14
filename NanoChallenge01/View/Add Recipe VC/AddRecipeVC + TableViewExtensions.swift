//
//  AddRecipeVC + TableViewExtensions.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 08/12/22.
//

import UIKit

extension AddRecipeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = formTable.dequeueReusableCell(withIdentifier: AddRecipeNameTableViewCell.identifier) as! AddRecipeNameTableViewCell
            cell.configureUI()
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = formTable.dequeueReusableCell(withIdentifier: AddRecipeImageTableViewCell.identifier) as! AddRecipeImageTableViewCell
            cell.configureUI()
            cell.delegate = self
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 2 {
            
            let cell = formTable.dequeueReusableCell(withIdentifier: AddRecipeIngredientsTableViewCell.identifier) as! AddRecipeIngredientsTableViewCell
            cell.configureUI()
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = formTable.dequeueReusableCell(withIdentifier: AddRecipeDirectionsTableViewCell.identifier) as! AddRecipeDirectionsTableViewCell
        cell.configureUI()
        
        cell.selectionStyle = .none
        
        return cell
    }
}
