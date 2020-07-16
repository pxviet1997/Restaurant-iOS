//
//  Order.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 9/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import Foundation

struct Order {
    var meals: [Meal]
    let tableNumber: String
    var status: String
    var totalCost: Float
}

