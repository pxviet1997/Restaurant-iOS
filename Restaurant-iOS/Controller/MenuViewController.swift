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
    
    var menu = [MealByCategory]()
    
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
    
    @IBAction func pizzasCategoryPressed(_ sender: UIButton) {
        loadCategory(category: sender.titleLabel!.text!)
    }
    
    @IBAction func sidesCategoryPressed(_ sender: UIButton) {
        loadCategory(category: sender.titleLabel!.text!)
    }
    
    @IBAction func drinksCategoryPressed(_ sender: UIButton) {
        loadCategory(category: sender.titleLabel!.text!)
    }
    
    @IBAction func dessertsCategoryPressed(_ sender: UIButton) {
        loadCategory(category: sender.titleLabel!.text!)
    }
    
    func loadCategory(category: String) {
        dataManager.fetchingJSON(category: category)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[section].meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meal = menu[indexPath.section].meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.mealNameLabel?.text = meal.mealName
        cell.mealDescriptionLabel?.text = meal.mealDescription
        cell.mealPriceLabel?.text = "$" + String(meal.mealPrice)
        
        
//        cell.layer.cornerRadius = 17
//        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu[section].mealSubCategory
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UITableViewHeaderFooterView()
//        let label = UILabel()
//        label.text = menu[section].mealSubCategory
//
//        headerView.addSubview(label)
//
//        return headerView
//    }
 
    
}

extension MenuViewController: DataManagerDelegate {
    func didFetchData(_ meal: [MealByCategory]) {
        menu = meal
    }
    
    
}
