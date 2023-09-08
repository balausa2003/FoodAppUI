//
//  Models.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 28.11.2022.
//

import Foundation
import UIKit

struct SetImages {
    let id: Int
    let photo: UIImage?
    let name: String
    let description: String
    let price: String
    var isFav: Bool
}

struct Models {
    static func setImage() -> [SetImages] {
        [
            .init(id: 1,photo: UIImage(named: "img1"), name: "Grilled skewers", description: "spicy medium", price: "$56",isFav: false),
            .init(id: 2,photo: UIImage(named: "img12"), name: "Burger", description: "spicy", price: "$30",isFav: false),
            .init(id: 3,photo: UIImage(named: "img9"), name: "Steak", description: "good", price: "$45",isFav: false),
            .init(id: 4,photo: UIImage(named: "img5"), name: "Sandwich", description: "too spicy", price: "$100",isFav: false),
            .init(id: 5,photo: UIImage(named: "img8"), name: "Chicken", description: "too tasty", price: "$678",isFav: false),
            .init(id: 6,photo: UIImage(named: "img10"), name: "Fish", description: "tasty", price: "$125",isFav: false),
        
        
        ]
    }
}
