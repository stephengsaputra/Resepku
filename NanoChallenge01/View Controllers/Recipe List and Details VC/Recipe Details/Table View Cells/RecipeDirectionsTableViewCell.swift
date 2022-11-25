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
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    internal lazy var recipeDirectionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(recipeDirectionsLabel)
        recipeDirectionsLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeDirectionsHeaderLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
