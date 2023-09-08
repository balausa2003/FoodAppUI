//
//  HeaderViewOfHomeViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 18.11.2022.
//

import UIKit

class HeaderViewOfHomeViewController: UITableViewHeaderFooterView {
    let data = Models.setImage()
    static var filteredData = [SetImages]()
    static var searching = false
    lazy private var name: UILabel = {
        let label = UILabel()
        label.text = "Search Food"
        label.textColor = .black
        label.font = UIFont(name:"MarkerFelt-Wide", size: 22)
        label.textAlignment = .center
        return label
        // Do any additional setup after loading the view.
    }()
    
    
    lazy private var profileButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "woman"), for: .normal)
        bt.layer.cornerRadius = 20
        return bt
    }()
    
    lazy private var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = .minimal
        bar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Healthy Food", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray3])
        return bar
    }()
   

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        searchBar.delegate = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HeaderViewOfHomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        HeaderViewOfHomeViewController.filteredData = []
        if searchText == "" {
            HeaderViewOfHomeViewController.filteredData = data
        }
        for i in data {
            if i.name.uppercased().contains(searchText.uppercased()) || i.description.uppercased().contains(searchText.uppercased()){
                HeaderViewOfHomeViewController.filteredData.append(i)
            }
        }
        HeaderViewOfHomeViewController.searching = true
        HomeViewController.foodTableView.reloadData()
        
        
    }
}
extension HeaderViewOfHomeViewController {
    func setUpViews() {
        
        contentView.addSubview(name)
        contentView.addSubview(profileButton)
//        view.addSubview(showButton)
        contentView.addSubview(searchBar)
       
        
    }
    func setUpConstraints() {
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        name.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.trailing.equalToSuperview().inset(10)
            
        }
        profileButton.snp.makeConstraints { make in
            
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).multipliedBy(0.18)
            make.height.equalTo(40)
            make.width.equalTo(40)
            
        }
//        showButton.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//
//        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
    }
}

