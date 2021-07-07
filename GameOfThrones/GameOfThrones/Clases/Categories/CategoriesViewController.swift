//
//  CategoriesViewController.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit
import PKHUD

class CategoriesViewController:UIViewController{
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterCategoriesProtocol?
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var splashImageView: UIImageView = { //TODO: reemplazar cuando sea posible por https://github.com/Juanpe/SkeletonView o https://github.com/BeauNouvelle/ShimmerSwift . Mucho más elegante que simular una splash
        
        let imageView = UIImageView(image: UIImage(named: "wallpaper1"))
        imageView.frame = self.view.frame
        return imageView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
}

extension CategoriesViewController: PresenterToViewCategoriesProtocol{
    
    func onFetchCategoriesSuccess() {
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchCategoriesFailure(error: String) {
        print("onFetchCategoriesFailure: \(error)")
        self.refreshControl.endRefreshing()
    }
    
    func showHUD() {
        //HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        //HUD.hide()
        splashImageView.isHidden = true
    }
    
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }
    
}

// MARK: - UITableView Delegate & Data Source
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter?.textLabelText(indexPath: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
    
    
}



// MARK: - UI Setup
extension CategoriesViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light

        self.view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        
        splashImageView.contentMode = .scaleAspectFill
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.addSubview(splashImageView)
        splashImageView.translatesAutoresizingMaskIntoConstraints = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        self.navigationItem.title = "Game Of Thrones"
        self.navigationItem.largeTitleDisplayMode = .always
    }
}
