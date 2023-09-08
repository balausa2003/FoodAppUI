//
//  ToppingCollectionViewTableCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 10.12.2022.
//

import UIKit

class ToppingCollectionViewTableCell: UITableViewCell {
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Topping for you"
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        return label
        
    }()
    lazy private var toppingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 100)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.infinite, collectionViewLayout: layout)
        collectionView.register(ToppingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.ToppingCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        toppingCollectionView.dataSource = self
        toppingCollectionView.delegate = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ToppingCollectionViewTableCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = toppingCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.ToppingCollectionViewCell, for: indexPath) as! ToppingCollectionViewCell
//        cell.settingInfo(setImg: info[indexPath.row])
        
        
        return cell
    }
}
extension ToppingCollectionViewTableCell {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(toppingCollectionView)
    }
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.leading.equalToSuperview().inset(20)
            
        }
        toppingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-250)
            make.leading.equalTo(20)
            make.trailing.bottom.equalToSuperview()
        }
    }
}
