//
//  EditRecipeVC + TableViewExtensions.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 14/01/23.
//

import UIKit

extension EditRecipeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = formTable.dequeueReusableCell(withIdentifier: EditRecipeNameTableViewCell.identifier) as! EditRecipeNameTableViewCell
            cell.configureUI()

            cell.selectionStyle = .none
            
            return cell
        case 1:
            let cell = formTable.dequeueReusableCell(withIdentifier: EditRecipeImageTableViewCell.identifier) as! EditRecipeImageTableViewCell
            cell.configureUI()

            cell.selectionStyle = .none
            
            return cell
        case 2:
            let cell = formTable.dequeueReusableCell(withIdentifier: EditRecipeIngredientsTableViewCell.identifier) as! EditRecipeIngredientsTableViewCell
            cell.configureUI()

            cell.selectionStyle = .none
            
            return cell
        default:
            let cell = formTable.dequeueReusableCell(withIdentifier: EditRecipeDirectionsTableViewCell.identifier) as! EditRecipeDirectionsTableViewCell
            cell.configureUI()

            cell.selectionStyle = .none
            
            return cell
        }
    }
}
