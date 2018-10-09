//
//  Meal.swift
//  FoodTracker
//
//  Created by itrump on 2018/10/6.
//  Copyright © 2018 fenxiaoyang. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {

    
    // Mark: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    // Mark: Archiving Paths
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentDirectory.appendingPathComponent("meals")
    
    // Mark: Types
    struct Property {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }

    
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
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Property.name)
        aCoder.encode(photo, forKey: Property.photo)
        aCoder.encode(rating, forKey: Property.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: Property.name) as? String else {
            os_log("Unable to decode the name for a  meal obj.", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: Property.photo) as? UIImage
        let rating = aDecoder.decodeObject(forKey: Property.rating)
        
        self.init(name: name, photo: photo, rating: rating as! Int)
    }

}
