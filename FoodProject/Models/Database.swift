//
//  Database.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 02.12.2022.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(setImages: Set<Int>) {
        let array = Array(setImages)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}
