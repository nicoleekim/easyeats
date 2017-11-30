//
//  FilteredSearch_ViewController.swift
//  EasyEats
//
//  Created by Bumsu Jung on 11/16/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class FilteredSearch_ViewController: UIViewController {
    
    var maxPrice = Int()
    
    var maxTime = Int()
    
    @IBOutlet weak var passingData: UILabel!
    @IBOutlet weak var searchResultsTable: UISearchResultsTable!
    
    func uploadRecipeData() -> [Recipe] {
        var recipes: [Recipe] = []
        let file = "recipe-data"

        let path = Bundle.main.path(forResource: file, ofType: "json")
        let url = URL(fileURLWithPath: path!)

        do {
//            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
//            let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
            
            let data = try Data(contentsOf: url)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options:
                JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            
            print("THIS IS WHERE IT'S FAILING")
            
            let jsonArray = jsonResult.value(forKey: "recipes") as! NSArray
            for json in jsonArray {
                let tmp = (json as? [String: Any])!
                
                let name = tmp["recipe-name"] as? String
                let vegan = tmp["vegan"] as? Bool
                let vegetarian = tmp["vegetarian"] as? Bool
                let prep_time = tmp["prep_time"] as? Int
                let servings = tmp["servings"] as? Int
                let price = tmp["price"] as? Float
                let ingredients = tmp["ingredients"] as? [String]
                let instructions = tmp["instructions"] as? [String]
                let photoURL = tmp["imageURL"] as? UIImage
                
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
        } catch {
            print("Fuck this")
        }
        return recipes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTable.loadSampleRecipes()
        
        passingData.text = "MaxPrice: " + "$\(maxPrice)" + " " + "MaxTime: " + "\(maxTime) min"
        
        let file = "recipe-data"
        
////         Trial 1
//        if let path = Bundle.main.path(forResource: file, ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                let parseJSON = try JSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary {
//
//                }
//                let jsonObj = try JSON(data: data)
//                print("jsonData:\(jsonObj)")
//            } catch let error {
//                print("parse error: \(error.localizedDescription)")
//            }
//        } else {
//            print("Invalid filename/path.")
//        }
        
//        URL(fileURLWithPath: path)
        
        
////         Trial 2
//        let path = Bundle.main.path(forResource: file, ofType: "json")
//        let url = URL(fileURLWithPath: path!)
//        do {
//            let data = try Data(contentsOf: url)
//            let recipes = try JSONDecoder().decode([String : Any].self, from: data)
//            print(recipes)
//        } catch {
//            print("ERROR")
//        }
        
////         Trial 3
//        let path = Bundle.main.path(forResource: file, ofType: "json")
//        let url = URL(fileURLWithPath: path!)
//        do {
//            let data = try Data(contentsOf: url)
//            if let json = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as? [String: [Recipe]] {
//                print(json)
//            }
//        } catch let err{
//            print(err.localizedDescription)
//        }
        
        
////         Trial 4
        let recipes = uploadRecipeData()
        print(recipes)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
