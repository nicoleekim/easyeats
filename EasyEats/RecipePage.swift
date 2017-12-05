//
//  RecipePage.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/30/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class RecipePage: UITableViewController {

    let cellType = ""
    var passedRecipes = Recipe(name: "", photoURL: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // recipe name & picture, information(veg, etc), ingredients, instructions
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInfoCell", for: indexPath) as? RecipeInfoCell  else {
                fatalError("The dequeued cell is not an instance of RecipeInfoCell.")
            }
            
            let price = String(describing: passedRecipes!.price)
            let time = String(describing: passedRecipes!.prepTime)
            cell.recipeName.text = passedRecipes?.name
            cell.recipeImage.image = UIImage(named: passedRecipes!.name)
            cell.recipePriceandTime.text = "$\(price) recipe/\(time) minutes"
            return cell
        }
        else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextCell  else {
                fatalError("The dequeued cell is not an instance of TextCell.")
            }
            let isVegan = Bool(passedRecipes!.vegan)
            let isVegetarian = Bool(passedRecipes!.vegetarian)
            let servings = Int(passedRecipes!.servings)
            
            var fullBasicInfo = ""
            if (isVegan || isVegetarian) {
                fullBasicInfo = "Special: "
                fullBasicInfo += isVegan ? "Vegan " : ""
                fullBasicInfo += isVegetarian ? "Vegetarian\n" : "\n"
            }
            fullBasicInfo += "Servings: \(servings)"
            
            // Basic info (vegan, vegetarian, preptime, servings, price)
            cell.ingredientsLabel.text = fullBasicInfo
            
            //set cell data
            return cell
        }
        else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextCell  else {
                fatalError("The dequeued cell is not an instance of TextCell.")
            }
            
            let ingredients = [String](passedRecipes!.ingredients)
            var full_ingredients = "Ingredients:\n"
            
            for ingredient: String in ingredients {
                let bulletPoint: String = "\u{2022}"
                let formattedString: String = "\t\(bulletPoint) \(ingredient)\n"
                full_ingredients += formattedString
            }
            cell.ingredientsLabel.text = full_ingredients
            
            //set cell data
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextCell  else {
                fatalError("The dequeued cell is not an instance of TextCell.")
            }
            // Instructions
            let instructions = [String](passedRecipes!.instructions)
            var full_instuctions = "Instructions\n"
            
            for (index, instruction) in instructions.enumerated() {
                full_instuctions += "\(index + 1). \(instruction)\n"
            }
            
            cell.ingredientsLabel.text = full_instuctions
            
            //set cell data
            return cell
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
