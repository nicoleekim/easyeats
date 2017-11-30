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
        
        cell.recipeLabel.text = recipe.name
        let url = URL(string: recipe.photoURL)
        let data = try? Data(contentsOf: url!)
        cell.recipeImage.image = UIImage(data: data!)
        
        return cell
    }
    
    //End datasource methods
    
    //Delegate methods

    
    //End delegate methods
    
    
    //CATHY: don't think we need this function anymore?
//    func loadSampleRecipes() {
//
//        let photo1 = "https://www.budgetbytes.com/wp-content/uploads/2016/04/Thai-Cucumber-Salad-front.jpg"
//
//        guard let recipe1 = Recipe(name: "Thai Cucumber Salad", vegetarian: true, vegan: false, prepTime: 10, servings: 2, price: 5.50, ingredients: ["sjkfhfkjhf"], instructions: ["slfjdjksfhd"], photoURL: photo1) else {
//            fatalError("Unable to instantiate recipe1")
//        }
//
//
//       recipes += [recipe1]
//
//    }


}
