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
        self.name = name
        self.photo = photo!
        self.rating = rating
        
        if rating < 0 || name.isEmpty {
            return nil
        }
    }
}
