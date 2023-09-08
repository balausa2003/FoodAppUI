//
//  CategoryCollectionTableViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 18.11.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    lazy private var category: UIButton = {
        let bt = UIButton()
        bt.setTitle("Fast Food", for: .normal)
        bt.setTitleColor(.black, for:.normal)
        bt.backgroundColor = UIColor.systemGray5
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        category.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        category.addTarget(self, action: #selector(heldDown), for: .touchDown)
         category.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
       
        setupViews()
        setupConstraints()
        
    }
    @objc func holdRelease()
    {
    category.backgroundColor = .yellow
        
    }
    @objc func heldDown()
    {
    category.backgroundColor = UIColor.systemGray5
        
    }
    @objc func buttonHeldAndReleased(){
        category.backgroundColor = UIColor.systemGray5
        
    }
    func setCategoryText(text: String) {
        category.setTitle(text, for: .normal)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
}
private extension CategoryCollectionViewCell {

    func setupViews() {
        contentView.addSubview(category)

    }

    func setupConstraints() {
        category.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()


        }
    }
}
