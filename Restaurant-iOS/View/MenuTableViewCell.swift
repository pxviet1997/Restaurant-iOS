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
    
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addButton.layer.cornerRadius = 7
        addButton.clipsToBounds = true
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("haha")
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        quantityLabel.text = String(Int(sender.value))
    }
    
}
