//
//  SeconViewController.swift
//  BMI Calculator (No Storyboard)
//
//  Created by Eugene Kotovich on 14.04.2022.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @objc func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
//MARK: - Setup UI
    
    let label: UILabel = {
        $0.text = "YOUR RESULT"
        $0.font = UIFont.boldSystemFont(ofSize: 35)
        $0.textAlignment = .center
        $0.textColor = .white
        return $0
    }(UILabel())
    
    let bmiLabel: UILabel = {
        $0.text = "19.5"
        $0.font = UIFont.boldSystemFont(ofSize: 80)
        $0.textAlignment = .center
        $0.textColor = .white
        return $0
    }(UILabel())
    
    let recomendationLabel: UILabel = {
        $0.text = "EAT SOME MORE SNACKS"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .white
        return $0
    }(UILabel())
    
    let recalculateButton: UIButton = {
        $0.setTitle("RECALCULATE", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.setTitleColor(UIColor(named: "lightViolet"), for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .white
        $0.addTarget(nil, action: #selector(recalculatePressed), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let backgroundImage: UIImageView = {
        $0.image = UIImage(named: "result_background")
        return $0
    }(UIImageView())
    
//MARK: - Initialize UI
    
    func initialize() {
        view.backgroundColor = bmi?.color ?? UIColor(named: "turquoiseColor")
        view.addSubview(backgroundImage)
        view.addSubview(label)
        view.addSubview(bmiLabel)
        view.addSubview(recomendationLabel)
        view.addSubview(recalculateButton)
        
        backgroundImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
        
        bmiLabel.text = bmi?.title ?? "0.0"
        recomendationLabel.text = bmi?.advice ?? ""
        
        let stack = UIStackView(arrangedSubviews: [label, bmiLabel, recomendationLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        recalculateButton.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(51)
        }
        
        
        
    }
}
