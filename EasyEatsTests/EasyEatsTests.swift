//
//  EasyEatsTests.swift
//  EasyEatsTests
//
//  Created by Nicole Kim on 11/9/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import XCTest
@testable import EasyEats

class EasyEatsTests: XCTestCase {
    
    var SUT: ViewController!
    
    var recipeHolder = [Recipe]() //need a container to run filters on

    var veganDish:Recipe! //clear labels for purpose of each dish
    var vegetDish:Recipe!
    var cheapDish:Recipe!
    var richDish:Recipe!
    var shortDish:Recipe!
    var longDish:Recipe!
    var filter:FilteredSearch_ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //only vegan dish is veganDish
        //only vegetarian dishes are veganDish and vegetDish
        //Rank of prices: cheapDish (0.50), veganDish + longDish (2.00), vegetDish + shortDish (5.00), richDish (10.00)
        //Rank of prepTime: shortDish (15), veganDish + vegetDish + richDish (20), cheapDish (30), longDish (45)
        
        veganDish = Recipe(name: "Vegan Dish", vegetarian: false, vegan: true, prepTime: 20, servings: 1, price: 2.00, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")
        
        vegetDish = Recipe(name: "Veget Dish", vegetarian: true, vegan: false, prepTime: 20, servings: 1, price: 5.00, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")
        
        cheapDish = Recipe(name: "Cheap Dish", vegetarian: false, vegan: false, prepTime: 30, servings: 1, price: 0.50, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")
        
        richDish = Recipe(name: "Rich Dish", vegetarian: false, vegan: false, prepTime: 20, servings: 1, price: 10.00, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")
        
        shortDish = Recipe(name: "Short Dish", vegetarian: false, vegan: false, prepTime: 15, servings: 1, price: 5.00, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")

        longDish = Recipe(name: "Long Dish", vegetarian: false, vegan: false, prepTime: 45, servings: 1, price: 2.00, ingredients: ["a"], instructions: ["a"], photoURL: "www.somesite.png")
        
        recipeHolder = [veganDish, vegetDish, cheapDish, richDish, shortDish, longDish]
        
        SUT = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self)).instantiateViewController(withIdentifier:String(describing: ViewController.self)) as! ViewController
        let _ = SUT.view
 
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        veganDish = nil
        vegetDish = nil
        cheapDish = nil
        richDish = nil
        shortDish = nil
        longDish = nil
        recipeHolder = []
        filter = nil
    }
    
    func testHelloWorld() {
        let hello = "Hello World"
        XCTAssertEqual(hello, "Hello World")
    }
    
    func testVeganFilter() {
        // Initiate
        filter = FilteredSearch_ViewController()
        filter.isVegan = true //looking for vegan recipes
        filter.isVegetarian = true
        filter.maxPrice = 50
        filter.maxTime = 60

        var data = [Recipe]()
        for recipe in recipeHolder {
            if filter!.simpleFilter(price: recipe.price, time: recipe.prepTime, vegan: recipe.vegan, vegetarian: recipe.vegetarian) {
                data.append(recipe)
            }
        }
        XCTAssertTrue(data.count == 1) //only one recipe was vegan
        
    }
    
    func testVegetarianFilter() {
        // Initiate
        filter = FilteredSearch_ViewController()
        filter?.isVegetarian = true
        filter?.maxPrice = 50
        filter?.maxTime = 60
        var data = [Recipe]()
        for recipe in recipeHolder {
            if filter!.simpleFilter(price: recipe.price, time: recipe.prepTime, vegan: recipe.vegan, vegetarian: recipe.vegetarian) {
                data.append(recipe)
            }
        }
        XCTAssertTrue(data.count == 1) //only one recipe was vegetarian
    }
    
    func testSegues() {
        let identifiers = segues(ofViewController: SUT)
        XCTAssertEqual(identifiers.count, 2, "Segue count should equal two.")
        XCTAssertTrue(identifiers.contains("segue"), "Segue segue should exist.")
        XCTAssertTrue(identifiers.contains("ViewAll"), "Segue viewall should exist.")
    }
    
    func segues(ofViewController viewController: UIViewController) -> [String] {
        let identifiers = (viewController.value(forKey: "storyboardSegueTemplates") as? [AnyObject])?.flatMap({ $0.value(forKey: "identifier") as? String }) ?? []
        return identifiers
    }
 
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
