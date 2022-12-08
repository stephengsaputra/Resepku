//
//  RecipeIngredientsTableViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 25/11/22.
//

import UIKit
import SnapKit

class RecipeIngredientsTableViewCell: UITableViewCell {

    static let identifier = "RecipeIngredientsTableViewCell"
    
    // MARK: - Properties
    internal lazy var recipeIngredientsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.heading2()
        label.textColor = .label
        return label
    }()
    
    internal lazy var recipeIngredientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bodyText()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeIngredientsHeaderLabel)
        recipeIngredientsHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(recipeIngredientsLabel)
        recipeIngredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeIngredientsHeaderLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
        }
    }
}
