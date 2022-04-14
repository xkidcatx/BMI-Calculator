//
//  BMIBrain.swift
//  BMI Calculator (No Storyboard)
//
//  Created by Eugene Kotovich on 14.04.2022.
//

import UIKit

struct BMI {
    var value: Float
    var advice: String
    var color: UIColor
    var title: String {
        String(format: "%.1f", value)
    }
}
