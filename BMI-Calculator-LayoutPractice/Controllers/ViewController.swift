//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    let bmiCalculator = BMICalc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let hwData = HWData(height: Double(heightSlider.value), weight:  Int(weightSlider.value))
        let bmi = bmiCalculator.calculateBMI(for: hwData)
        let category = bmiCalculator.getCategory(for: bmi)
        
        if(segue.identifier == "showBMI"){
            if let showBMIvc = segue.destination as? ShowBMIResultViewController{
                showBMIvc.calculatedBMI = bmi
                showBMIvc.category = category
            }
        }
    }
    
    @IBAction func heightLabelChanged(_ sender: Any) {
        
        heightLabel.text = "\(self.roundNumber(for: Double(heightSlider.value)))m"
        
    }
    
    @IBAction func weightLabelChanged(_ sender: Any) {
        weightLabel.text = "\(Int(weightSlider.value))kg"
    }
    
    func roundNumber(for number:Double) -> Double{
        return round(number*100)/100
        
    }

}

