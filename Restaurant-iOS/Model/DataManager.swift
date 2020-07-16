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
    
    func fetchingJSON() {
        guard let path = Bundle.main.path(forResource: "Meal", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let menu = try decoder.decode([Meal].self, from: data)
            self.delegate?.didFetchData(menu)
            
        } catch {
            print("\(error)")
        }
    }

}

protocol DataManagerDelegate {
    func didFetchData(_ meal: [Meal])
}
