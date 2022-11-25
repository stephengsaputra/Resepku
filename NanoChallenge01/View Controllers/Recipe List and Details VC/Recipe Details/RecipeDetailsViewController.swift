//
//  RecipeDetailsViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit
import SnapKit

protocol ReloadCoreDataAfterUpdateDelegate: AnyObject {
    
    func reloadTable()
}

class RecipeDetailsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    @IBOutlet weak var recipeDirectionsTextView: UITextView!
    
    internal lazy var tableView: UITableView = {
        
        let table = UITableView(frame: .zero, style: .plain)
        
        table.register(RecipeImageTableViewCell.self, forCellReuseIdentifier: RecipeImageTableViewCell.identifier)
        table.register(RecipeIngredientsTableViewCell.self, forCellReuseIdentifier: RecipeIngredientsTableViewCell.identifier)
        table.register(RecipeDirectionsTableViewCell.self, forCellReuseIdentifier: RecipeDirectionsTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        
        return table
    }()
    
    var delegate: ReloadCoreDataAfterUpdateDelegate?
    
    var recipeID: Int64 = 0
    var recipeTitle: String = ""
    var recipeImage: UIImage!
    var recipeIngredients: String = ""
    var recipeDirections: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            self.delegate?.reloadTable()
        }
    }
    
    // MARK: - Selectors
    @IBAction func unwindToRecipeDetails(_ sender: UIStoryboardSegue) { }
    
    @objc func toEditRecipeView() {
        performSegue(withIdentifier: "toEditRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditRecipe" {
            if let vc = segue.destination as? EditRecipeViewController {
                vc.recipeID = self.recipeID
                vc.recipeTitle = self.recipeTitle
                vc.recipeImage = self.recipeImage
                vc.ingredients = self.recipeIngredients
                vc.directions = self.recipeDirections
                vc.delegate = self
            }
        }
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        navigationItem.largeTitleDisplayMode = .never
        
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toEditRecipeView))
        self.navigationItem.rightBarButtonItem  = editBarButtonItem
        
//        recipeTitleLabel.text = recipeTitle
//        recipeIngredientsTextView.text = recipeIngredients
//        recipeDirectionsTextView.text = recipeDirections
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
