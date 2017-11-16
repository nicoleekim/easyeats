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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passingData.text = "MaxPrice: " + "$\(maxPrice)" + " " + "MaxTime: " + "\(maxTime) min"

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
