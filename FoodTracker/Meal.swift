//
//  Meal.swift
//  FoodTracker
//
//  Created by Raffael Lorenz on 12.05.17.
//  Copyright © 2017 LoRa. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var rating: Int
    var photo: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, rating: Int, photo: UIImage?) {
        
        // name not empty
        guard !name.isEmpty else {
            return nil;
        }
        
        // rating must be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
      
        self.name = name
        self.rating = rating
        self.photo = photo
    }
}
