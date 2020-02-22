//
//  BMICalc.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Leo Leljak on 22/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class BMICalc{
    
    func calculateBMI(for HWData: HWData) -> Double{
        
        let bmi:Double = Double(HWData.weight)/(pow(HWData.height, 2))
        return Double(round(bmi*10)/10)
        
    }
    func getCategory(for bmi:Double) -> String {
        
        switch bmi {
        case ...18.5:
            return "Underweight"
        case 18.5...24.9:
            return "Normal"
        case 25.0...29.9:
            return "Overweight"
        case 30.0...:
            return "Obese"
        default:
            return "No data, try again"
        }
        
    }
    
    
    
}
