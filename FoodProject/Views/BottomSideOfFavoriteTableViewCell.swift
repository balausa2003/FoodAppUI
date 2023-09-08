//
//  BottomSideOfFavoriteTableViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 10.12.2022.
//

import UIKit

class BottomSideOfFavoriteTableViewCell: UITableViewCell {
    lazy private var dollarButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "dollarsign")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for:.normal)
        return bt
        
    }()
    lazy private var foodPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.text = "36.00"
        return label
    }()
    lazy private var cardButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Go to Card", for: .normal)
        bt.backgroundColor = .black
        bt.layer.masksToBounds = true
        bt.layer.cornerRadius = 15
        return bt
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        cardButton.addTarget(self, action: #selector(), for: <#T##UIControl.Event#>)
        setUpViews()
        setUpConstraints()
        
    }
//    @objc func nextView() {
//        let story = UIStoryboard(name: "BottomSideOfFavoriteTableViewCell", bundle: nil)
//            let controller = story.instantiateViewController(identifier: "MyCardListViewController") as! MyCardListViewController
//        story.present(controller, animated: true, completion: .none)
//    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension BottomSideOfFavoriteTableViewCell {
    func setUpViews() {
        contentView.addSubview(dollarButton)
        contentView.addSubview(foodPrice)
        contentView.addSubview(cardButton)
    }
    func setUpConstraints() {
        dollarButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(foodPrice.snp.leading).offset(30)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        foodPrice.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
           
        }
        cardButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(foodPrice.snp.trailing).offset(120)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(120)
        }
    }
}
