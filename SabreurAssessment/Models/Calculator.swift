//
//  Calculator.swift
//  SabreurAssessment
//
//  Created by John Chow on 24/10/21.
//

import UIKit

struct Calculator {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmi = String(format: "%.2f", bmi?.value ?? 0.0)
        return bmi
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (pow(height,2))

        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You have the build, but perhaps not the brainpower.", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Being a tank is probably your best strategy.", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Fortunately, this sport depends more on smarts than stature.", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
}
