//
//  Recipe.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/29/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class Recipe {
    
    //MARK: Properties
    
    var name: String
    var vegetarian: Bool
    var vegan: Bool
    var prepTime: Int
    var servings: Int
    var price: Float
    var ingredients: [String]
    var instructions: [String]
    var photoURL: String
    
    
    //MARK: Initialization
    
    init?(name: String, vegetarian: Bool = false, vegan: Bool = false, prepTime: Int = 0, servings: Int = 0, price: Float = 0, ingredients: [String] = [], instructions: [String] = [], photoURL: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.vegetarian = vegetarian
        self.vegan = vegan
        self.prepTime = prepTime
        self.servings = servings
        self.price = price
        self.ingredients = ingredients
        self.instructions = instructions
        self.photoURL = photoURL
    }
}
