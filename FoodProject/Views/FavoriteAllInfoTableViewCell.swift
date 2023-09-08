//
//  FavoriteAllInfoTableViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 10.12.2022.
//

import UIKit

class FavoriteAllInfoTableViewCell: UITableViewCell {
    lazy private var foodName: UILabel = {
        let label = UILabel()
        label.text = "Grilled skewers"
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        return label
        
    }()
    lazy private var foodDescription: UILabel = {
        let label = UILabel()
        label.text = "spicy medium"
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textColor = .systemGray2
        return label
        
    }()
    
    lazy private var timerButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "timer")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for:.normal)
        return bt
    }()
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.text = "10-15min"
        return label
    }()
    lazy private var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 11)
        label.numberOfLines = 3
        label.text = """
              kdsgdlglsdpslbpsfgnldfokbodfdsgigjeirorjgafdvfdvadfbavkokp
              kbolfbpdflbpdfbsdfbsdb.dfbsdkbokotigsodfgsh
             """
        label.textColor = .systemGray3
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FavoriteAllInfoTableViewCell {
    func setUpViews() {
        contentView.addSubview(foodName)
        contentView.addSubview(foodDescription)
        contentView.addSubview(timerButton)
        contentView.addSubview(timeLabel)
        contentView.addSubview(descLabel)
    }
    func setUpConstraints() {
        foodName.snp.makeConstraints  { make in
            make.top.equalToSuperview().inset(200)
            make.leading.equalToSuperview().inset(20)
            
        }
        foodDescription.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom)
            make.leading.equalToSuperview().inset(20)
        }
        timerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.equalTo(foodName.snp.trailing).inset(-100)
            
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.equalTo(timerButton.snp.trailing).inset(-5)
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(foodDescription).inset(20)
            make.leading.equalToSuperview().inset(20)
            
        }
    }
}
