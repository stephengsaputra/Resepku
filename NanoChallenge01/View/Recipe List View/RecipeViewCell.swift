//
//  recipeViewCell.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit
import SnapKit

class recipeViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    var disabledHighlightedAnimation = false
    
    // MARK: - Cell animation when touched
    func freezeAnimations() {
        disabledHighlightedAnimation = true
        layer.removeAllAnimations()
    }
    
    func unfreezeAnimations() {
        disabledHighlightedAnimation = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }
    
    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
        
        if disabledHighlightedAnimation {
            return
        }
        
        if isHighlighted {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: [.allowUserInteraction], animations: {
                self.transform = .init(scaleX: 0.98, y: 0.98)
            }, completion: completion)
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: [.allowUserInteraction], animations: {
                self.transform = .identity
            }, completion: completion)
        }
    }
    
    // MARK: - Properties
    internal lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodPic")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        return imageView
    }()
    
    internal lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.cellContent()
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.addSubview(recipeImageView)
        recipeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(contentView.snp.width)
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview().inset(0)
        }
        
        contentView.addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        
        contentView.backgroundColor = UIColor.cellBG
        
        contentView.clipsToBounds = true
        
        contentView.layer.cornerRadius = 12
        
        contentView.layer.borderColor = UIColor.cellBorder?.cgColor
        contentView.layer.borderWidth = 1.5
        
        contentView.layer.shadowColor = UIColor.dropShadow?.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
        contentView.layer.shadowRadius = 16
    }
    
    private func updateColors() {
        self.contentView.layer.borderColor = UIColor.cellBorder?.cgColor
        self.contentView.layer.shadowColor = UIColor.dropShadow?.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
