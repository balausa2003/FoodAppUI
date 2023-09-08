//
//  RestaurantCollectionViewTableView.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 25.11.2022.
//

import UIKit

class RestaurantCollectionViewTableView: UITableViewCell {
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Favorite Restaurants"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        return label
        
    }()
    lazy private var seeAllBt: UIButton = {
        let bt = UIButton()
        bt.setTitleColor(.black, for: .normal)
        bt.setTitle("See all", for: .normal)
       
        return bt
        
    }()
    lazy private var resCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 150)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.infinite, collectionViewLayout: layout)
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.RestaurantCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()


   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        resCollectionView.dataSource = self
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RestaurantCollectionViewTableView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = resCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.RestaurantCollectionViewCell, for: indexPath)
        return cell
    }
    
    
}




extension RestaurantCollectionViewTableView {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(seeAllBt)
        contentView.addSubview(resCollectionView)
    }
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(21)
            make.bottom.equalTo(resCollectionView.snp.top)
        }
        seeAllBt.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(title.snp.trailing).multipliedBy(1.2)
            make.bottom.equalTo(resCollectionView.snp.top)
        }
        resCollectionView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
    }
}
