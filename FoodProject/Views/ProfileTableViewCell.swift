//
//  ProfileTableViewCell.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 29.11.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    lazy private var profTitle: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        return label
        
    }()
    
    lazy private var textField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Your Name"
        
        return textF
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
extension ProfileTableViewCell {
    func setUpViews() {
        contentView.addSubview(profTitle)
        contentView.addSubview(textField)
       
    }
    func setUpConstraints() {
        profTitle.snp.makeConstraints { make in
            make.bottom.equalTo(textField.snp.top)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            
        }
        textField.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            
        }
        
       
        
        
    }
}
