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
        
//        stackView.bounds = stackView.frame.insetBy(dx: 0, dy: 0)
    
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        //set the values for top,left,bottom,right margins
//        let margins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
//        contentView.frame = contentView.frame.inset(by: margins)
//    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        let mealName = mealNameLabel.text!
        let mealDescription = mealDescriptionLabel.text!
        let mealPrice = Float(mealPriceLabel.text!)!
        
        let meal = Meal(mealName: mealName, mealDescription: mealDescription, mealPrice: mealPrice)
        
        
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        quantityLabel.text = String(Int(sender.value))
    }
    
}
