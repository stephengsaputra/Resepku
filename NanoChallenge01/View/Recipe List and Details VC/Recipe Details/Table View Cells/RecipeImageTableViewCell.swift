//
//  RecipeImageTableViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 25/11/22.
//

import UIKit
import SnapKit

class RecipeImageTableViewCell: UITableViewCell {

    static let identifier = "RecipeImageTableViewCell"
    
    // MARK: - Properties
    internal lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    internal lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 100
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeImageView)
        recipeImageView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.size.width)
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
            make.top.equalTo(contentView.snp.top)
        }
        
        contentView.addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeImageView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
        }
    }
}
