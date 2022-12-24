//
//  AddRecipeVC.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 08/12/22.
//

import UIKit
import SnapKit

protocol AddRecipeVCDelegate: AnyObject {
    
    func showCameraPicker()
}

class AddRecipeVC: UIViewController {

    // MARK: - Properties
    internal lazy var formTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .plain)
        
        table.register(AddRecipeNameTableViewCell.self, forCellReuseIdentifier: AddRecipeNameTableViewCell.identifier)
        table.register(AddRecipeImageTableViewCell.self, forCellReuseIdentifier: AddRecipeImageTableViewCell.identifier)
        table.register(AddRecipeIngredientsTableViewCell.self, forCellReuseIdentifier: AddRecipeIngredientsTableViewCell.identifier)
        table.register(AddRecipeDirectionsTableViewCell.self, forCellReuseIdentifier: AddRecipeDirectionsTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        
        return table
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleLeftBarButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleRightBarButton() {
        
        print("DEBUG: Right")
    }
    
    // MARK: - Helpers
    func configureNavigation() {
        
        self.title = "Add New Recipe"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [
            .font: UIFont.largeTitle()
        ]
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.navigationItemButton()
        ]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
        if #available(iOS 14.0, *) {
            navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        }
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let navItemAttribute = [
            NSAttributedString.Key.font: UIFont.navigationItemButton()
        ]
        
        let leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(handleLeftBarButton)
        )
        leftBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .normal)
        leftBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .highlighted)
        leftBarButtonItem.tintColor = UIColor.destructive
        
        let rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(handleRightBarButton)
        )
        rightBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .normal)
        rightBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .highlighted)
        rightBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .disabled)
        rightBarButtonItem.tintColor = UIColor.primaryColor
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func configureUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(formTable)
        formTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
