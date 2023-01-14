//
//  EditRecipeImageTableViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 08/12/22.
//

import UIKit
import SnapKit

class EditRecipeImageTableViewCell: UITableViewCell {

    static let identifier = "EditRecipeImageTableViewCell"
    
    var delegate: AddRecipeVCDelegate?
    
    // MARK: - Properties
    internal lazy var recipeHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipe Image"
        label.font = UIFont.cellContent()
        label.textColor = .label
        return label
    }()
    
    internal lazy var recipeImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = UIColor.tfBG
        
        image.layer.cornerRadius = 12
        
        image.layer.borderColor = UIColor.tfBorder?.cgColor
        image.layer.borderWidth = 1.5
        
        image.image = UIImage(named: "emptyState")
        
        return image
    }()
    
    internal lazy var button: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = UIColor.primaryColor
        button.setTitle("Add a Photo", for: .normal)
        
        button.layer.cornerRadius = 12
        
        button.layer.borderColor = UIColor.tfBorder?.cgColor
        button.layer.borderWidth = 1.5
        
        button.titleLabel?.font = UIFont.navigationItemButton()
        
        button.addTarget(self, action: #selector(handlePickImage), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Selectors
    @objc func handlePickImage() {
        
        delegate?.showCameraPicker()
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeHeaderLabel)
        recipeHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(recipeImageView)
        recipeImageView.snp.makeConstraints { make in
            make.top.equalTo(recipeHeaderLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.size.width - 32)
        }
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(recipeImageView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
    }
}
