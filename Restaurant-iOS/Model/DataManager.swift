//
//  DataManager.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 16/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import Foundation

struct DataManager {
    
    var delegate: DataManagerDelegate?
    
    func fetchingJSON(category: String = "Pizzas") {
        var menuByCategory = [MealByCategory]()
        
        guard let path = Bundle.main.path(forResource: "Meal", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let menu = try decoder.decode([MealByCategory].self, from: data)
            for meal in menu {
                if meal.mealCategory.lowercased() == category.lowercased() {
                    menuByCategory.append(meal)
                }
            }
            self.delegate?.didFetchData(menuByCategory)
            
        } catch {
            print("\(error)")
        }
    }

}

protocol DataManagerDelegate {
    func didFetchData(_ meal: [MealByCategory])
}
