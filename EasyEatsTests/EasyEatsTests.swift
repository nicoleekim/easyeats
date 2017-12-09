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
    var SUT2: FilteredSearch_ViewController!
    
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
        SUT2 = UIStoryboard(name: "Main", bundle: Bundle(for: FilteredSearch_ViewController.self)).instantiateViewController(withIdentifier:String(describing: FilteredSearch_ViewController.self)) as! FilteredSearch_ViewController
        let _ = SUT.view
        let _ = SUT2.view
 
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
        SUT = nil
        SUT2 = nil
    }
    
    /*
     ###################
     Unit tests
     ###################
     */
    
    // Tests the vegan attribute in simpleFilter
    func testVeganFilter() {
        // Test when vegan flag is true
        helperFilterCreation(vegan: true)
        var vegan_data = [Recipe]()
        for recipe in recipeHolder {
            if filter!.simpleFilter(price: recipe.price, time: recipe.prepTime, vegan: recipe.vegan, vegetarian: recipe.vegetarian) {
                vegan_data.append(recipe)
            }
        }
        XCTAssertTrue(vegan_data.count == 1, "Only one recipe is vegan")
    }
    
    // Tests the vegetarian attribute in simpleFilter
    func testVegetarianFilter() {
        // Test when vegetarian flag is true
        helperFilterCreation(vegetarian: true)
        var vegetarian_data = [Recipe]()
        for recipe in recipeHolder {
            if filter!.simpleFilter(price: recipe.price, time: recipe.prepTime, vegan: recipe.vegan, vegetarian: recipe.vegetarian) {
                vegetarian_data.append(recipe)
            }
        }
        XCTAssertTrue(vegetarian_data.count == 1, "Only one recipe is vegetarian")
    }
    
    // Test segue for ViewController
    func testSegueExistsForViewController() {
        let identifiers = segues(ofViewController: SUT)
        XCTAssertEqual(identifiers.count, 2, "Segue count should equal two.")
        XCTAssertTrue(identifiers.contains("segue"), "Segue identifier \'segue\' should exist.")
        XCTAssertTrue(identifiers.contains("viewAll"), "Segue identifier \'viewall\' should exist.")
    }
    
    // Test segue for FilteredSearch_ViewController
    func testSegueExistsForFilteredSearch_ViewController() {
        let identifiers = segues(ofViewController: SUT2)
        XCTAssertEqual(identifiers.count, 1, "Segue count should equal one.")
        XCTAssertTrue(identifiers.contains("goToRecipeSegue"), "Segue identifier \'goToRecipeSegue\' should exist.")
    }
    
    /*
     ###################
     Helper Methods
     ###################
     */
    
    // Helper method that initiates FilteredSearch_ViewController's attributes
    func helperFilterCreation(vegan: Bool = false, vegetarian: Bool = false, max_price: Int = 99999, max_time: Int = 99999) {
        filter = FilteredSearch_ViewController()
        filter.isVegan = vegan
        filter?.isVegetarian = vegetarian
        filter?.maxPrice = max_price
        filter?.maxTime = max_time
    }
    
    // Helper method returning identifiers for segue
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
