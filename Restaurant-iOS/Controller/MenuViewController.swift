//
//  MenuViewController.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 8/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var menu = [Meal]()
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        dataManager.delegate = self
        
        dataManager.fetchingJSON()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meal = menu[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.mealNameLabel?.text = meal.mealName
        cell.mealDescriptionLabel?.text = meal.mealDescription
        cell.mealPriceLabel?.text = "$" + String(meal.mealPrice)
        
        cell.layer.cornerRadius = 17
        cell.clipsToBounds = true
        
        return cell
    }
    
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension MenuViewController: DataManagerDelegate {
    func didFetchData(_ meal: [Meal]) {
        menu = meal
    }
    
    
}
