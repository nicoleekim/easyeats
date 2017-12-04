//
//  UISearchResultsTable.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/28/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class UISearchResultsTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var cellDelegate: MyCellProtocol?
    var recipes = [Recipe]()
    
    //UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ResultsTableViewCell"
        
        guard let cell = dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UISearchResultTableCell  else {
            fatalError("The dequeued cell is not an instance of UISearchResulTableCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let recipe = recipes[indexPath.row]
        cell.pathHolder = indexPath.row
        //it doesn't even show up here what the heck
        cell.recipeLabel.text = recipe.name + "\n" + String(recipe.price)
        cell.recipeImage.image = UIImage(named: recipe.name)
        //even this line doesn't work when you just add a static value!
        //cell.recipePrice.text = "3.8"
        cell.recipePrice.text = String(recipe.price)
        
        return cell
    }
    
    //End datasource methods
    
    //Delegate methods

    
    //End delegate methods
    

}
