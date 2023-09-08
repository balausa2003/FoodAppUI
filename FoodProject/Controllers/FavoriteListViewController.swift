//
//  FavoriteListViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 02.12.2022.
//

import UIKit

class FavoriteListViewController: UIViewController {
    lazy private var favoriteTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableHeaderView = HeaderVIewOfFavoriteListViewController(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 120))
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        favoriteTableView.dataSource = self
        setUpViews()
        setUpConstraints()

      
    }
    

   
}
extension FavoriteListViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 100
        default:
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = FavoriteAllInfoTableViewCell()
            return cell
        case 1:
            let cell = ToppingCollectionViewTableCell()
            return cell
        case 2:
            let cell = BottomSideOfFavoriteTableViewCell()
            return cell
            
        default:
            return UITableViewCell()
        }
  
    }
    
    
}





extension FavoriteListViewController {
    func setUpViews() {
        view.addSubview(favoriteTableView)
    }
    func setUpConstraints() {
        favoriteTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
