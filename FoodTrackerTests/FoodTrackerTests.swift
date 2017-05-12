//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Raffael Lorenz on 09.05.17.
//  Copyright © 2017 LoRa. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
   //MARK: Meal Class TEsts
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters
    func testMealInitializationSucceeds() {
        // Zero Rating
        let zeroRatingMeal = Meal.init(name: "Zero", rating: 0, photo:nil)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", rating: 5, photo:nil)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        let noneNameMeal = Meal.init(name: "", rating:0, photo:nil)
        XCTAssertNil(noneNameMeal)
        
        let negativeRatingMeal = Meal.init(name: "negative", rating: -1, photo:nil)
        XCTAssertNil(negativeRatingMeal)
        
        let bothUnvalidValuesMeal = Meal.init(name: "", rating: -1, photo: nil)
        XCTAssertNil(bothUnvalidValuesMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", rating: 6, photo: nil)
        XCTAssertNil(largeRatingMeal)
    }

    
}
