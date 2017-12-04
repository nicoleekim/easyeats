//
//  RecipeInfoCell.swift
//  EasyEats
//
//  Created by Nicole Kim on 12/1/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class RecipeInfoCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipePriceandTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
