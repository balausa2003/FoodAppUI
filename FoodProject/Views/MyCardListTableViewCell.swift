//
//  MyCardListTableViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 02.12.2022.
//

import UIKit

class MyCardListTableViewCell: UITableViewCell {
    lazy private var count = 0
    lazy private var foodImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named:"img7")
        img.layer.cornerRadius = 40
        img.layer.masksToBounds = true
        return img
    }()
    lazy private var foodName: UILabel = {
        let label = UILabel()
        label.text = "Grilled skewers"
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        return label
        
    }()
    lazy private var foodPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.text = "36.00$"
        return label
    }()
    lazy private var counter: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.textColor = .systemGray
        return label
    }()
    lazy private var totalPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        return label
    }()
    lazy private var stepper: UIStepper = {
        let st = UIStepper()
        st.transform = CGAffineTransformMakeScale(0.7, 0.7)
        st.minimumValue = 0.0
        st.maximumValue = 100.0
        st.stepValue = 1.0
        return st
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stepper.addTarget(self, action: #selector(changeCount), for: .touchUpInside)
//        updatePrice()
        setUpViews()
        setUpConstraints()
        
        
        }
    @objc func changeCount() {
        counter.text = "x\(Int(stepper.value))"
    }
//    func updatePrice() {
//        totalPrice.text = "TOTAL: \(stepper.value * Double(foodPrice.text!)!)"
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension MyCardListTableViewCell {
    func setUpViews() {
        contentView.addSubview(foodImage)
        contentView.addSubview(foodName)
        contentView.addSubview(foodPrice)
        contentView.addSubview(counter)
        contentView.addSubview(stepper)
        contentView.addSubview(totalPrice)
    }
    
    func setUpConstraints() {
        foodImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            
            make.height.equalTo(100)
            make.width.equalTo(80)
            
        }
        foodName.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(foodImage.snp.trailing).offset(20)
        }
        foodPrice.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom)
            make.leading.equalTo(foodImage.snp.trailing).offset(20)
            make.bottom.equalToSuperview()
        }
        counter.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom).offset(30)
            make.leading.equalTo(foodPrice.snp.trailing).offset(10)
            
        }
        stepper.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(foodName.snp.trailing)
            make.bottom.equalToSuperview()
           
        }
        totalPrice.snp.makeConstraints { make in
            make.top.equalTo(foodPrice.snp.bottom).inset(40)
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}
