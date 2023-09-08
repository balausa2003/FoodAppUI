//
//  HeaderVIewOfFavoriteListViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 10.12.2022.
//

import UIKit

class HeaderVIewOfFavoriteListViewController: UITableViewHeaderFooterView {
    lazy private var foodLikeButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for:.normal)
        return bt
        
    }()
    lazy private var foodImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named:"img11")
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 30
        return img
    }()
    lazy private var valueOfStepper: UIStepper = {
        let st = UIStepper()
        st.transform = CGAffineTransformMakeScale(0.7, 0.7)
        st.minimumValue = 0.0
        st.maximumValue = 100.0
        st.stepValue = 1.0
        return st
    }()
    lazy private var value: UILabel = {
        let label = UILabel()
        label.text = "x0"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
       
         
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        valueOfStepper.addTarget(self, action: #selector(changeCount), for: .touchUpInside)
        setUpViews()
        setUpConstraints()
    }
    @objc func changeCount() {
        value.text = "x\(Int(valueOfStepper.value))"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HeaderVIewOfFavoriteListViewController {
    func setUpViews() {
        contentView.addSubview(foodLikeButton)
        contentView.addSubview(foodImage)
        contentView.addSubview(value)
        contentView.addSubview(valueOfStepper)
    }
    func setUpConstraints() {
        foodLikeButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().inset(20)
            
        }
        foodImage.snp.makeConstraints { make in
            make.top.equalTo(foodLikeButton.snp.bottom).inset(-30)
            make.trailing.leading.equalToSuperview().inset(60)
            make.height.equalTo(200)
            
        }
        value.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).inset(-18)
            make.leading.equalToSuperview().inset(210)
            make.width.equalTo(60)
          
            
        }
        valueOfStepper.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(270)
            make.trailing.equalToSuperview()
        }
    }
}
