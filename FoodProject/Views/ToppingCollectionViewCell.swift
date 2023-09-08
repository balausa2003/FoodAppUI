//
//  ToppingCollectionViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 10.12.2022.
//

import UIKit

class ToppingCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
