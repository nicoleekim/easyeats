//
//  UISearchResultsTable.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/28/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class UISearchResultsTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var recipes = [Recipe]()
    
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
        
        cell.recipeLabel.text = recipe.name
        cell.recipeImage.image! = recipe.photoURL
        
        return cell
    }

//    
//    
//    override func numberOfRows(inSection section: Int) -> Int {
//        return recipes.count
//    }
//    
//    
    
//    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
//
//        // Table view cells are reused and should be dequeued using a cell identifier.
//        let cellIdentifier = "ResultsTableViewCell"
//
//        guard let cell = dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UISearchResultTableCell  else {
//            fatalError("The dequeued cell is not an instance of UISearchResulTableCell.")
//        }
//
//        // Fetches the appropriate meal for the data source layout.
//        let recipe = recipes[indexPath.row]
//
//        cell.recipeLabel.text = recipe.name
//        cell.recipeImage.image! = recipe.photoURL
//
//        return cell
//    }
    
    
    func loadSampleRecipes() {
        let photo1 = UIImage(named: "Thai-Cucumber-Salad-front")
        
        guard let recipe1 = Recipe(name: "Thai Cucumber Salad", vegetarian: true, vegan: false, prepTime: 10, servings: 2, price: 5.50, ingredients: ["sjkfhfkjhf"], instructions: ["slfjdjksfhd"], photoURL: photo1) else {
            fatalError("Unable to instantiate recipe1")
        }
        
        recipes += [recipe1]
    }


}
