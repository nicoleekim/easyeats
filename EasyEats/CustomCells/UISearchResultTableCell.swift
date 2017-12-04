//
//  UISearchResultTableCell.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/28/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class UISearchResultTableCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipePrice: UILabel!
    
    var cellDelegate: MyCellProtocol?
    var pathHolder: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellDelegate?.didTapCell(tappedCell: self)
    }

}
