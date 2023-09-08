//
//  Content-ViewModel.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 02.12.2022.
//

import Foundation
import UIKit

extension FoodCollectionViewCell {
    final class ViewModel: ObservableObject {
        @Published var setImages = [SetImages]()
        @Published var showingFavs = false
        @Published var savedImages: Set<Int> = []
        
        var filteredImages:[SetImages] {
            if showingFavs == true {
                return setImages.filter {
                    savedImages.contains($0.id)
                }
            } else {
                return setImages
            }
        }
        private var db = Database()
        
        init() {
            self.savedImages = db.load()
            self.setImages = Models.setImage()
        }
        func sortFavs() {
        
            showingFavs.toggle()
        }
        func contains(_ images: SetImages) -> Bool {
            savedImages.contains(images.id)
        }
        func toggleFav(images: SetImages) {
            if contains(images) {
                savedImages.remove(images.id)
            } else {
                savedImages.insert(images.id)
            }
            db.save(setImages: savedImages)
            
        }
    }
}
