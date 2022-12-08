//
//  ViewController.swift
//  NanoChallenge01
//
//  Created by Stephen Giovanni Saputra on 26/04/22.
//

import UIKit
import SnapKit

class RecipeListViewController: UIViewController {
    
    // MARK: - Properties
    internal lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(
            width: self.view.frame.size.width * 0.4359,
            height: StaticVariables.notch > 20 ? self.view.frame.size.height / 3.516
            : 250)
        return layout
    }()
    
    internal lazy var search: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search for your recipe"
        search.searchBar.tintColor = UIColor.primaryColor
        return search
    }()
    
    internal lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    internal lazy var recipeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(recipeViewCell.self, forCellWithReuseIdentifier: recipeViewCell.identifier)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.refreshControl = refreshControl
        
        return collectionView
    }()
    
    var rowSelected: Int?
    
    // Data Model
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var recipes: [Recipes]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchData()
        configureNavigation()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleTap() {
        
        let vc = AddRecipeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func refresh(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.fetchData()
            self.recipeCollectionView.refreshControl?.endRefreshing()
        }
    }
    
    @IBAction func unwindToRecipeListView(_ sender: UIStoryboardSegue) { }
    
    func fetchData() {
        
        do {
            self.recipes = try context.fetch(Recipes.fetchRequest())
            DispatchQueue.main.async {
                self.recipeCollectionView.reloadData()
            }
        } catch {
            print(error)
        }
        
        self.recipes?.sort { $0.title ?? "" < $1.title ?? "" }
    }
    
    // MARK: - Helpers
    func configureNavigation() {
        
        self.title = "My Recipes"
        
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
        
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let rightBarButtonItem = UIBarButtonItem(
            title: "Add a Recipe",
            style: .plain,
            target: self,
            action: #selector(handleTap)
        )
        let navItemAttribute = [
            NSAttributedString.Key.font: UIFont.navigationItemButton()
        ]
        rightBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .normal)
        rightBarButtonItem.setTitleTextAttributes(navItemAttribute, for: .highlighted)
        rightBarButtonItem.tintColor = UIColor.primaryColor
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func configureUI() {
        
        view.addSubview(recipeCollectionView)
        recipeCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: recipeViewCell.identifier, for: indexPath) as! recipeViewCell
        
        cell.configureUI()
        cell.recipeImageView.image = UIImage(data: recipes?[indexPath.row].image ?? Data())
        cell.recipeNameLabel.text = recipes?[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        rowSelected = indexPath.row
        performSegue(withIdentifier: "toRecipeDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let selectedRow = rowSelected {
            if let destination = segue.destination as? RecipeDetailsViewController {
                destination.recipeID = recipes?[selectedRow].id ?? 0
                destination.recipeTitle = recipes?[selectedRow].title ?? ""
                destination.recipeImage = UIImage(data: recipes?[selectedRow].image ?? Data())
                destination.recipeIngredients = recipes?[selectedRow].ingredients ?? ""
                destination.recipeDirections = recipes?[selectedRow].directions ?? ""
            }
        }
        
        if segue.identifier == "toFormSegue" {
            if let vc = segue.destination as? AddRecipeViewController {
                vc.delegate = self
            }
        } else if segue.identifier == "toRecipeDetails" {
            if let vc = segue.destination as? RecipeDetailsViewController {
                vc.delegate = self
            }
        }
    }
}

extension RecipeListViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    
}

extension RecipeListViewController: ReloadCoreDataDelegate {
    
    func reloadData() {
        fetchData()
        self.recipeCollectionView.reloadData()
    }
}

extension RecipeListViewController: ReloadCoreDataAfterUpdateDelegate {
    
    func reloadTable() {
        fetchData()
        self.recipeCollectionView.reloadData()
    }
}
