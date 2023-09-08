//
//  CategoryCollectionViewTableView.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 18.11.2022.
//

import UIKit

class CategoryCollectionViewTableView: UITableViewCell {
    let categoryArray = ["Fast food" , "Pasta" , "Breakfast" , "Sea Foods"]
    lazy private var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 40)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.infinite, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.CategoryCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        categoryCollectionView.dataSource = self
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    extension CategoryCollectionViewTableView: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.CategoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        cell.setCategoryText(text:categoryArray[indexPath.row])
        
        
        return cell
    }
}


extension CategoryCollectionViewTableView {
    func setUpViews() {
        contentView.addSubview(categoryCollectionView)
    }
    func setUpConstraints() {
        categoryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
          
        }
    }
}
