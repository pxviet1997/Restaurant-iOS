//
//  TableViewController.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 22/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    let table = ["Table 1", "Table 2", "Table 3", "Table 4",  "Table 5"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableToMenu" {
            let destination = segue.destination as! MenuViewController
        }
    }
    

}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "TableToMenu", sender: self)
        
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableNumber = table[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        cell.textLabel?.text = tableNumber
        
        return cell
    }
    
    
}
