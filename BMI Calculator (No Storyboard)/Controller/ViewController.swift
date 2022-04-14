//
//  ViewController.swift
//  BMI Calculator (No Storyboard)
//
//  Created by Eugene Kotovich on 13.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var brain = BMIBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
   @objc func heightSliderChanged(_ sender: UISlider) {
        heightNumbersLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @objc func weightSliderChanged(_ sender: UISlider) {
        weightNumbersLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        brain.calculateBMI(height: height, weight: weight)
        let controller = ResultViewController()
        controller.bmi = brain.getBMI()
        self.present(controller, animated: true, completion: nil)
    }
    
    

//MARK: - Setup UI
    
    let textLabel: UILabel = {
        $0.text = "CALCULATE YOUR BMI"
        $0.font = UIFont.boldSystemFont(ofSize: 40)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .darkGray
        return $0
    }(UILabel())
    
    let heightLabel: UILabel = {
        $0.text = "Height"
        $0.textColor = .darkGray
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let heightNumbersLabel: UILabel = {
        $0.text = "1.5m"
        $0.textColor = .darkGray
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    let heightSlider: UISlider = {
        $0.minimumValue = 0
        $0.maximumValue = 3
        $0.value = 1.5
        $0.minimumTrackTintColor = UIColor(named: "lightViolet")
        $0.thumbTintColor = UIColor(named: "lightViolet")
        $0.contentMode = .scaleToFill
        $0.addTarget(nil, action: #selector(heightSliderChanged), for: .valueChanged)
        return $0
    }(UISlider())
    
    let weightLabel: UILabel = {
        $0.text = "Weight"
        $0.textColor = .darkGray
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let weightNumbersLabel: UILabel = {
        $0.text = "100Kg"
        $0.textColor = .darkGray
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let weightSlider: UISlider = {
        $0.maximumValue = 0
        $0.maximumValue = 200
        $0.value = 100
        $0.minimumTrackTintColor = UIColor(named: "lightViolet")
        $0.thumbTintColor = UIColor(named: "lightViolet")
        $0.contentMode = .scaleToFill
        $0.addTarget(nil, action: #selector(weightSliderChanged), for: .valueChanged)
        return $0
    }(UISlider())
    
    let calculateButton: UIButton = {
        $0.setTitle("CALCULATE", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.backgroundColor = UIColor(named: "buttonColor")
        $0.titleLabel?.textAlignment = .center
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.addTarget(nil, action: #selector(calculatePressed), for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    var backgroundImage: UIImageView = {
        $0.image = UIImage(named: "calculate_background")
        $0.contentMode = .scaleToFill
        return $0
    } (UIImageView())
    
//MARK: - Initialize UI

    func initialization() {
        view.addSubview(backgroundImage)
        view.addSubview(textLabel)
        view.addSubview(heightLabel)
        view.addSubview(heightNumbersLabel)
        view.addSubview(heightSlider)
        view.addSubview(weightLabel)
        view.addSubview(weightNumbersLabel)
        view.addSubview(weightSlider)
        view.addSubview(calculateButton)

        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        let heightStack = UIStackView(arrangedSubviews: [heightLabel, heightNumbersLabel])
        heightStack.snp.makeConstraints { make in
            make.height.equalTo(21)
        }
        
        heightSlider.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        let weightStack = UIStackView(arrangedSubviews: [weightLabel, weightNumbersLabel])
        weightStack.snp.makeConstraints { make in
            make.height.equalTo(21)
        }
        
        weightSlider.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        calculateButton.snp.makeConstraints { make in
            make.height.equalTo(51)
        }
        
        let stack = UIStackView(arrangedSubviews: [textLabel, heightStack, heightSlider, weightStack, weightSlider, calculateButton])
        
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leadingMargin.equalTo(view.snp.leadingMargin)
            make.trailingMargin.equalTo(view.snp.trailingMargin)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

    }
}
