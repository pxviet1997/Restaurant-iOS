//
//  Meal.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 15/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import Foundation

struct Meal: Codable {
    let mealName: String
    let mealDescription: String
    let mealPrice: Float
    let mealCategory: String
    let mealSubCategory: String
}
