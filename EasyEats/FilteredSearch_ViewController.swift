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
        
        let file = "recipe-data_3"
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
        
        let path = Bundle.main.path(forResource: file, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let recipes = try JSONDecoder().decode([String : [Int]].self, from: data)
            print(recipes)
        } catch {
            print("ERROR")
        }
        
        
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
