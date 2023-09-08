//
//  MyCardListViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 02.12.2022.
//

import UIKit

class MyCardListViewController: UIViewController {
    lazy private var myCardList: UILabel = {
        let label = UILabel()
        label.text = "My"
        label.font = UIFont(name: "Helvetica-Bold", size: 37)
        return label
        
    }()
    lazy private var listLabel: UILabel = {
        let label = UILabel()
        label.text = "Card List"
        label.font = UIFont(name: "Helvetica", size: 37)
        return label
    }()
    lazy private var buyProduct: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .none
        tableView.allowsSelection = false
    
        tableView.separatorStyle = .none
        
        return tableView
        
    }()
    lazy private var creditCard: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "creditcard")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        return imgView
    }()
    lazy private var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Do you have any discount card?"
        label.font = UIFont(name:"MarkerFelt-Wide", size: 12)
        return label
    }()
    lazy private var totalShowingView = TotalShowingVIew()
    


    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        buyProduct.dataSource = self
        buyProduct.delegate = self
        setUpViews()
        setUpConstraints()
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

}

extension MyCardListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyCardListTableViewCell()
       
        return cell
        
    }
    
    
}



extension MyCardListViewController {
    func setUpViews() {
        view.addSubview(myCardList)
        view.addSubview(listLabel)
        view.addSubview(buyProduct)
        view.addSubview(creditCard)
        view.addSubview(questionLabel)
        view.addSubview(totalShowingView)
    }
    func setUpConstraints() {
        myCardList.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
        }
        listLabel.snp.makeConstraints { make in
            make.top.equalTo(myCardList.snp.bottom)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            
        }
        creditCard.snp.makeConstraints { make in
            make.top.equalTo(listLabel.snp.bottom)
            make.leading.equalToSuperview().inset(90)
           
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(listLabel.snp.bottom)
            make.leading.equalTo(creditCard.snp.trailing)
            make.trailing.equalToSuperview()

        }
        buyProduct.snp.makeConstraints { make in
            make.top.equalTo(creditCard.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            
           
        }
        totalShowingView.snp.makeConstraints { make in
            make.top.equalTo(buyProduct.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}

