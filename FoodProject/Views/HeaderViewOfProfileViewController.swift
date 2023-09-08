//
//  HeaderViewOfProfileViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 29.11.2022.
//

import UIKit

class HeaderViewOfProfileViewController: UITableViewHeaderFooterView {
    lazy private var profileTitle: UILabel = {
        let label = UILabel()
        label.text = "My Profile"
        label.textColor = .black
        label.font = UIFont(name:"MarkerFelt-Wide", size: 22)
        label.textAlignment = .center
        return label
        
    }()
    lazy private var profilePhoto: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "woman")
        imgView.layer.cornerRadius = 20
        return imgView
    }()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

}
extension HeaderViewOfProfileViewController {
    func setUpViews() {
        
        contentView.addSubview(profileTitle)
        contentView.addSubview(profilePhoto)
    }
    func setUpConstraints() {
        profileTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.trailing.equalToSuperview().inset(10)
            
        }
        profilePhoto.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(55)
            make.centerX.equalToSuperview()
            
            make.height.equalTo(120)
            make.width.equalTo(120)
                
            }
        }
    }
    

