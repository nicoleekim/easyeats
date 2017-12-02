//
//  ViewController.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/9/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Price
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var priceOutlet: UILabel!
    
    // Time
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeOutlet: UILabel!
    
    // Switches
    @IBOutlet weak var veganSwitch: UISwitch!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    
    // Trigger segue
    @IBAction func viewAllButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "viewAll", sender: sender)
    }
    
    // Shows a text price value of slider to user
    @IBAction func priceChange(_ sender: Any) {
        priceOutlet.text = "Max Price: " + "$\(Int(priceSlider.value))"
    }
    
    // Shows a text time value of slider to user
    @IBAction func timeChange(_ sender: Any) {
        timeOutlet.text = "Max Time: " + "\(Int(timeSlider.value)) min"
    }
    
    // Sends data to Filtered Search
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filterSearchController = segue.destination as! FilteredSearch_ViewController
        
        // If viewAll button is clicked, pass max values and turn off vegan/vegetarian
        (filterSearchController.maxPrice, filterSearchController.maxTime, filterSearchController.isVegan, filterSearchController.isVegetarian) =
            segue.identifier == "viewAll" ?
            (Int(priceSlider.maximumValue), Int(timeSlider.maximumValue), false, false) :
            (Int(priceSlider.value), Int(timeSlider.value), veganSwitch.isOn, vegetarianSwitch.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

