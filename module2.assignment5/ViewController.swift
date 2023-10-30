//
//  ViewController.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 28.10.23.
//



import UIKit

class FavoriteBerserkPanelsViewController: UITableViewController, PopupViewControllerDelegate {
    
    
    func addPanel(_ controller: PopupViewController, didAddName name: String) {
    }
    
    
    func addPanel(image: UIImage, description: String) {
    }
    
    
    private let panelManager = PanelManager()
    private var searchManager: SearchManager?
    private let searchController = UISearchController(searchResultsController: nil)
    let popupViewController = PopupViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupViewController.delegate = self

        let allPanels = panelManager.getAllPanels()
        searchManager = SearchManager(panels: allPanels)

        configureViewController()
        configureSearchController()
        configureNavigationBar()
        configureTableView()
    }
    
    
    private func configureViewController() {
        view.backgroundColor = .customBlueGray
        title = "Best Panels from Berserk"
        
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Panels"
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.barTintColor = .customGray
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let textFieldInsideSearchBar = searchController.searchBar.searchTextField
        textFieldInsideSearchBar.textColor = .white
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.customGray,
            .font: UIFont(name: "Courier", size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        navigationItem.rightBarButtonItem = editButtonItem
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
            navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTapped() {
        let popupVC = PopupViewController()
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        self.present(popupVC, animated: true, completion: nil)
    }

    private func configureTableView() {
        tableView.register(PanelCell.self, forCellReuseIdentifier: "PanelCell")
    }
}


extension FavoriteBerserkPanelsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let searchManager = searchManager else { return 0 }
        return searchManager.isFiltering ? searchManager.filteredPanels.count : searchManager.allPanels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PanelCell", for: indexPath) as? PanelCell,
              let searchManager = searchManager else {
            return UITableViewCell()
        }
        
        let panel = searchManager.isFiltering ? searchManager.filteredPanels[indexPath.row] : searchManager.allPanels[indexPath.row]
        
        cell.panelImageView.image = panel.panelImage
        cell.descriptionLabel.text = panel.panelDescription
        
        // Set cell background color based on its index
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .customGray
        } else {
            cell.backgroundColor = .customLightGray
        }
        
        return cell
    }
}



extension FavoriteBerserkPanelsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            searchManager?.searchPanels(for: "")
            tableView.reloadData()
            return
        }
        searchManager?.searchPanels(for: searchText)
        tableView.reloadData()
    }
}

extension FavoriteBerserkPanelsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let searchManager = searchManager else { return }
        
        let panel = searchManager.isFiltering ? searchManager.filteredPanels[indexPath.row] : searchManager.allPanels[indexPath.row]
        
        let detailVC = PanelDetailViewController()
        detailVC.panelImage = panel.panelImage
        detailVC.panelDescription = panel.panelDescription
        
        navigationController?.pushViewController(detailVC, animated: true)
        

        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


