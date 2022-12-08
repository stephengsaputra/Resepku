//
//  RecipeDirectionsTableViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 25/11/22.
//

import UIKit
import SnapKit

class RecipeDirectionsTableViewCell: UITableViewCell {

    static let identifier = "RecipeDirectionsTableViewCell"
    
    // MARK: - Properties
    internal lazy var recipeDirectionsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.heading2()
        label.textColor = .label
        return label
    }()
    
    internal lazy var recipeDirectionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bodyText()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeDirectionsHeaderLabel)
        recipeDirectionsHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(recipeDirectionsLabel)
        recipeDirectionsLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeDirectionsHeaderLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
        }
    }
}
