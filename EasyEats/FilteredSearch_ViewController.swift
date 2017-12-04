//
//  FilteredSearch_ViewController.swift
//  EasyEats
//
//  Created by Bumsu Jung on 11/16/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class FilteredSearch_ViewController: UIViewController, MyCellProtocol {
    
    //testing to use in other methods
    var recipeHolder = [Recipe]()
    
    // Values passed from search
    var maxPrice = Int()
    var maxTime = Int()
    var isVegan = Bool()
    var isVegetarian = Bool()
    
    // Visualizations(labels) of the values passed from search
    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var maxTimeLabel: UILabel!
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    
    // Shows the users how many recipes were found
    @IBOutlet weak var recipeFoundNum: UILabel!
    
    @IBOutlet weak var searchResultsTable: UISearchResultsTable!
    

    // Filters based on price & time & vegan/vegetarian
    // If vegan/vegetarian is turned off, do not care
    func simpleFilter(price: Float, time: Int, vegan: Bool, vegetarian: Bool) -> Bool {
        return (price <= Float(maxPrice) &&
            time <= maxTime &&
            (!isVegan || (isVegan == vegan)) &&
            (!isVegetarian || (isVegetarian == vegetarian)))
    }
    
    // Reads JSON file
    func uploadRecipeData(file_name: String) -> [Recipe] {
        var recipes: [Recipe] = []
        let path = Bundle.main.path(forResource: file_name, ofType: "json")
        let url = URL(fileURLWithPath: path!)

        do {
            let data = try Data(contentsOf: url)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options:
                JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            
            let jsonArray = jsonResult.value(forKey: "recipes") as! NSArray
            for json in jsonArray {
                let tmp = (json as? [String: Any])!
                
                let name = tmp["recipe-name"] as? String
                let vegan = tmp["vegan"] as? Bool
                let vegetarian = tmp["vegetarian"] as? Bool
                let prep_time = tmp["prepTime"] as? Int
                let servings = tmp["servings"] as? Int
                let price = tmp["price"] as? Float
                let ingredients = tmp["ingredients"] as? [String]
                let instructions = tmp["instructions"] as? [String]
                let photoURL = tmp["photoURL"] as? String
                
                if simpleFilter(price: price!, time: prep_time!, vegan: vegan!, vegetarian: vegetarian!) {
                    let recipe = Recipe(name: name!,
                                        vegetarian: vegetarian!,
                                        vegan: vegan!,
                                        prepTime: prep_time!,
                                        servings: servings!,
                                        price: price!,
                                        ingredients: ingredients!,
                                        instructions: instructions!,
                                        photoURL: photoURL!)
                    
                    recipes.append(recipe!)
                }
            }
        } catch {
            print("Oh darn")
        }
        return recipes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTable.dataSource = searchResultsTable
        searchResultsTable.delegate = searchResultsTable
        //searchResultsTable.reloadData()
        //print(searchResultsTable.numberOfRows(inSection: 0))
        
        // Show passed values to user
        maxPriceLabel.text = "$\(maxPrice)"
        maxTimeLabel.text = "\(maxTime) min"
        veganLabel.textColor = isVegan ? UIColor.black : UIColor.lightGray
        veganLabel.text = isVegan ? "Vegan On" : "Vegan Off"
        vegetarianLabel.textColor = isVegetarian ? UIColor.black : UIColor.lightGray
        vegetarianLabel.text = isVegetarian ? "Vegetarian On" : "Vegetarian Off"
        
        // Read JSON file
        let file_name = "recipe-data"
        let recipes = uploadRecipeData(file_name: file_name)
        
        // set variable in searchResultsTable
        searchResultsTable.recipes = recipes
        
        //set variable as global
        recipeHolder = recipes
        // print(recipes)
        
        //set celldelgate in every cell in table
        setCellDelegate ()
        
        recipeFoundNum.text = "\(recipes.count)"
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCellDelegate () {
        let cells = searchResultsTable.visibleCells as! Array<UISearchResultTableCell>
        
        for cell in cells {
            cell.cellDelegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cellHolder = sender as? UISearchResultTableCell
        let recipe = recipeHolder[(cellHolder?.pathHolder)!]
        
        let destinationVC = segue.destination as! RecipePage
        destinationVC.passedRecipes = recipe
    }
    
    func didTapCell (tappedCell: UISearchResultTableCell) {
        self.performSegue(withIdentifier: "goToRecipeSegue", sender: tappedCell);
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
