//
//  ViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 15.11.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
     static var foodTableView: UITableView = {
        let tableView = UITableView()
         tableView.tableHeaderView = HeaderViewOfHomeViewController(frame: CGRect(x: 0, y: 0, width:100, height: 100))
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
        
    }()
//    private var tabBar:UITabBar {
//        let bar = UITabBar()
//        return bar
//    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        setUpViews()
        setUpConstraints()
        HomeViewController.foodTableView.dataSource = self
        HomeViewController.foodTableView.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension HomeViewController {
    func setUpViews() {
        view.addSubview(HomeViewController.foodTableView)

    }
    func setUpConstraints() {
        HomeViewController.foodTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 255
        case 2:
            return 253
        default:
             return 100
        }
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = CategoryCollectionViewTableView()
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = FoodCollectionViewTableView()
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = RestaurantCollectionViewTableView()
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
       
        
        
    }
    
}
