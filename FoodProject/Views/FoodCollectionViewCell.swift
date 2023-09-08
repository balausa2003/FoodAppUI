//
//  FoodCollectionViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 19.11.2022.
//

import UIKit
import Cosmos

class FoodCollectionViewCell: UICollectionViewCell {
    let tabGesture = UIGestureRecognizer()
    private var array = [SetImages]()
    private var vm = ViewModel()
    private var allInfo = Models.setImage()
    
    lazy private var count = 0
    lazy private var foodImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named:"img2")
        return img
    }()
    lazy private var foodName: UILabel = {
        let label = UILabel()
        label.text = "Grilled skewers"
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        return label
        
    }()
    lazy private var foodDescription: UILabel = {
        let label = UILabel()
        label.text = "spicy medium"
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textColor = .systemGray2
        return label
        
    }()
    lazy private var foodPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.text = "36.00$"
        return label
    }()
    lazy private var foodLikeButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for:.normal)
        return bt
        
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemGray6
        
        foodLikeButton.addTarget(self, action: #selector(likeButtonChanged), for:.touchUpInside)
       
        setupViews()
        setupConstraints()
       
        
    }
    
   
    
    @objc func likeButtonChanged() {
        
        
        let imageIcon1 = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageIcon2 = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        if foodLikeButton.isTouchInside {
            count += 1
        }
        for var i in allInfo {
            if count % 2 == 0 {
                let imageIcon = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                i.isFav = false
                
                
                foodLikeButton.setImage(imageIcon, for:.normal)
                
            } else {
                let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
                foodLikeButton.setImage(imageIcon, for: .normal)
                i.isFav = true
               
                
            }
        }
        for i in allInfo {
            if i.isFav == true {
                array.append(i)
            }
        }
        print(array)
     
    }
        
        
//        for image in vm.filteredImages {
//            foodLikeButton.setImage(vm.contains(image) ? imageIcon2 : imageIcon1, for: .normal)
//            if foodLikeButton.isTouchInside {
//                vm.toggleFav(images: image)
//                array.append(image)
//
//            }
//            print(vm.savedImages)
//        }
    
    
//
//
//
//                    if foodLikeButton.isTouchInside {
//                        count += 1
//                    }
//                    if count % 2 == 0 {
//                        let imageIcon = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//
//                        foodLikeButton.setImage(imageIcon, for:.normal)
//
//                    } else {
//                        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
//                        foodLikeButton.setImage(imageIcon, for: .normal)
//                        image.isFav = true

//
//                        print(vm.savedImages.
//                    }
//
        
    
    func settingInfo(setImg:SetImages) {
        foodImage.image = setImg.photo
        foodName.text = setImg.name
        foodDescription.text = setImg.description
        foodPrice.text = setImg.price
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
private extension FoodCollectionViewCell {

    func setupViews() {
        contentView.addSubview(foodImage)
        contentView.addSubview(foodName)
        contentView.addSubview(foodDescription)
        contentView.addSubview(foodPrice)
        contentView.addSubview(foodLikeButton)

    }

    func setupConstraints() {
        foodImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.99)
        
        }
        foodName.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(foodDescription.snp.top)
        }
        foodDescription.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(foodPrice.snp.top)
        }
        foodPrice.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        foodLikeButton.snp.makeConstraints { make in
            make.top.equalTo(foodDescription.snp.bottom)
            make.leading.equalTo(foodPrice.snp.trailing).offset(60)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
}

