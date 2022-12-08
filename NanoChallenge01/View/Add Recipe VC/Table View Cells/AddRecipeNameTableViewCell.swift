//
//  AddRecipeNameTableViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 08/12/22.
//

import UIKit
import SnapKit

class AddRecipeNameTableViewCell: UITableViewCell {

    static let identifier = "AddRecipeNameTableViewCell"
    
    // MARK: - Properties
    internal lazy var recipeHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipe Name"
        label.font = UIFont.cellContent()
        label.textColor = .label
        return label
    }()
    
    internal lazy var recipeNameTF: UITextField = {
        
        let tf = UITextField()
        
        tf.backgroundColor = UIColor.tfBG
        
        tf.layer.borderColor = UIColor.tfBorder?.cgColor
        tf.layer.borderWidth = 1.5
        
        tf.layer.cornerRadius = 12
        
        tf.font = UIFont.bodyText()
        
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        tf.leftViewMode = .always
        
        tf.tintColor = .primaryColor
        
        return tf
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeHeaderLabel)
        recipeHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(recipeNameTF)
        recipeNameTF.snp.makeConstraints { make in
            make.top.equalTo(recipeHeaderLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(45)
        }
    }
}
