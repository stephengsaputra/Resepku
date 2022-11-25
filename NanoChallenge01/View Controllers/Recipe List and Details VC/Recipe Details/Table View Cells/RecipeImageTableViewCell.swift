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
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(recipeImageView)
        recipeImageView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.size.width)
            make.edges.equalTo(contentView.snp.edges)
        }
    }
}
