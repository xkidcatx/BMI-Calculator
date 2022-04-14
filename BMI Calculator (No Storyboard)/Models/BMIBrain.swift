//
//  BMIBrain.swift
//  BMI Calculator (No Storyboard)
//
//  Created by Eugene Kotovich on 14.04.2022.
//

import UIKit

struct BMIBrain {
    let blueColor = UIColor(named: "blueColor")
    let greenColor = UIColor(named: "greenColor")
    let redColor = UIColor(named: "redColor")
    
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
      let value = weight / (height * height)
      if value < 18.5 {
          bmi = BMI(value: value, advice: "Eat more pies!", color: blueColor!)
      } else if value < 24.9 {
          bmi = BMI(value: value, advice: "Fit as a fiddle!", color: greenColor!)
      } else {
          bmi = BMI(value: value, advice: "Eat less pies!", color: redColor!)
      }
    }
    func getBMI() -> BMI? {
      bmi
    }
  }
