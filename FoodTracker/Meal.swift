//
//  Meal.swift
//  FoodTracker
//
//  Created by itrump on 2018/10/6.
//  Copyright © 2018 fenxiaoyang. All rights reserved.
//

import UIKit

class Meal {
    // Mark: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    // Mark: Initializations
    init?(name: String, photo: UIImage?, rating: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard !(rating < 0 || rating > 5) else {
            return nil
        }
        
        self.name = name
        self.photo = UIImage()
        if let pt = photo {
            self.photo = pt
        }
        self.rating = rating
    }
}
