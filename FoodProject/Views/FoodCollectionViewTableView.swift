//
//  FoodCollectionViewTableView.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 19.11.2022.
//

import UIKit

class FoodCollectionViewTableView: UITableViewCell {
    let info = Models.setImage()

    lazy private var foodCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 253)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.infinite, collectionViewLayout: layout)
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.FoodCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        foodCollectionView.dataSource = self
      
//        contentView.layer.masksToBounds = true
//        contentView.layer.cornerRadius = 20
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FoodCollectionViewTableView: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if HeaderViewOfHomeViewController.searching {
            return HeaderViewOfHomeViewController.filteredData.count
        } else {
            return info.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.FoodCollectionViewCell, for: indexPath) as! FoodCollectionViewCell
        if HeaderViewOfHomeViewController.searching {
            cell.settingInfo(setImg: HeaderViewOfHomeViewController.filteredData[indexPath.row])
        } else {
            cell.settingInfo(setImg: info[indexPath.row])
        }
        
        
        return cell
    }
}


extension FoodCollectionViewTableView {
    func setUpViews() {
        contentView.addSubview(foodCollectionView)
    }
    func setUpConstraints() {
        foodCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.trailing.bottom.equalToSuperview()
          
        }
    }
}
