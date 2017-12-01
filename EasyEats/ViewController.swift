//
//  ViewController.swift
//  EasyEats
//
//  Created by Nicole Kim on 11/9/17.
//  Copyright © 2017 Easy Eats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceSlider: UISlider!
    
    @IBOutlet weak var priceOutlet: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var timeOutlet: UILabel!
    
    @IBAction func viewAllButton(_ sender: UIButton) {
//        priceSlider.value = priceSlider.maximumValue
//        timeSlider.value = timeSlider.maximumValue
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filterSearchController = segue.destination as! FilteredSearch_ViewController
        if segue.identifier == "viewAll" {
            filterSearchController.maxPrice = Int(priceSlider.maximumValue)
            filterSearchController.maxTime = Int(timeSlider.maximumValue)
        } else {
            filterSearchController.maxPrice = Int(priceSlider.value)
            filterSearchController.maxTime = Int(timeSlider.value)
        }
        
        
        
        
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

