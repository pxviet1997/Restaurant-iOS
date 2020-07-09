//
//  MenuTableViewCell.swift
//  Restaurant-iOS
//
//  Created by Viet Pham on 8/7/20.
//  Copyright © 2020 Viet Pham. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var malDescriptionLabel: UILabel!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("haha")
    }
    
    
}
