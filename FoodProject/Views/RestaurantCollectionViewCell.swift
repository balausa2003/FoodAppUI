//
//  RestaurantCollectionViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 25.11.2022.
//

import UIKit
import Cosmos


class RestaurantCollectionViewCell: UICollectionViewCell {
    var stars: CosmosView = {
        let view = CosmosView()
        return view
        
    }()
    lazy private var resImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named:"img5")
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 40
        return img
        
    }()
    lazy private var resName: UILabel = {
        let label = UILabel()
        label.text = "Marmelad Restaurant"
        label.font = UIFont(name: "Helvetica", size: 12)
        return label
    }()
    lazy private var resAddress: UILabel = {
        let label = UILabel()
        label.text = "New York, United States"
        label.font = UIFont(name: "Helvetica-Bold", size: 10)
        label.textColor = .systemGray2
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        return label
    }()
    
    
 
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemGray6
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension RestaurantCollectionViewCell {
    func setUpViews() {
        contentView.addSubview(resImage)
        contentView.addSubview(resName)
        contentView.addSubview(stars)
        contentView.addSubview(resAddress)
    }
    func setUpConstraints() {
        resImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        resName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(resImage.snp.trailing).offset(20)
            
        }
        stars.snp.makeConstraints { make in
            make.top.equalTo(resName.snp.bottom).offset(10)
            make.leading.equalTo(resImage.snp.trailing).offset(20)
        }
        resAddress.snp.makeConstraints { make in
            make.top.equalTo(stars.snp.bottom).offset(10)
            make.leading.equalTo(resImage.snp.trailing).offset(20)
        }
    }
}
