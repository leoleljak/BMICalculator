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
    let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
    var heightChanged:Float! = 1.5
    var weightChanged:Float! = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        impactFeedbackgenerator.prepare()
        
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
        let change = heightSlider.value-heightChanged
        if( change >= 0.01 || change <= -0.009   ){
            impactFeedbackgenerator.impactOccurred()
            heightChanged = heightSlider.value
            
        }
        
        
        
        heightLabel.text = "\(self.roundNumber(for: Double(heightSlider.value)))m"
        
    }
    
    @IBAction func weightLabelChanged(_ sender: Any) {
        
        let change = weightSlider.value-weightChanged
        if( change >= 1.0 || change <= -1.0  ){
                   impactFeedbackgenerator.impactOccurred()
                   weightChanged = weightSlider.value
                   
               }
        
        
        weightLabel.text = "\(Int(weightSlider.value))kg"
    }
    
    @IBAction func resetHW(_ sender: Any) {
        
        heightSlider.setValue(1.5, animated: true)
        weightSlider.setValue(100.0, animated: true)
        heightLabel.text = "1.50m"
        weightLabel.text = "100kg"
        
    }
    
   

}

extension ViewController{
    
    func roundNumber(for number:Double) -> Double{
           return round(number*100)/100
           
       }
    
}

