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
    var instructions: String
    var photo: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, vegetarian: Bool, vegan: Bool, prepTime: Int, servings: Int, price: Float, ingredients: [String], instructions: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.vegetarian = false
        self.vegan = false
        self.prepTime = 0
        self.servings = 0
        self.price = 0
        self.ingredients = []
        self.instructions = ""
        self.photo = photo
        
        
    }
}
