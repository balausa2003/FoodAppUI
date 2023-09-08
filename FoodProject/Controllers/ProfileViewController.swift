//
//  ProfileViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 29.11.2022.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    lazy private var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableHeaderView = HeaderViewOfProfileViewController(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 210))
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .none
        
        return tableView
        
    }()
    lazy private var saveButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Save", for: .normal)
        bt.backgroundColor = .red
        return bt
    }()
   

    override func viewDidLoad() {
        profileTableView.dataSource = self
        profileTableView.delegate = self
        setUpViews()
        setUpConstraints()
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        
 
        // Do any additional setup after loading the view.
    }
   
  
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileTableViewCell()
        return cell
        
    }
    
    
}




extension ProfileViewController {
    func setUpViews() {
        view.addSubview(saveButton)
        view.addSubview(profileTableView)
     
        
    }
    func setUpConstraints() {
        profileTableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            
        }
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(profileTableView.snp.bottom).inset(20)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
      }
    }

