//
//  ShowBMIResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Leo Leljak on 22/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit



class ShowBMIResultViewController: UIViewController {

    //Properties
    var calculatedBMI:Double?
    var category:String?
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bmi = calculatedBMI, let category = category {
            bmiLabel.text = "\(bmi)"
            categoryLabel.text = "\(category)"
        }
        
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
