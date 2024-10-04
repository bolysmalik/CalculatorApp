//
//  ViewController.swift
//  CalcApp
//
//  Created by Bolys Malik on 04.10.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var displayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupDisplayLabel()
        setupPortraitButtons() // Use updated portrait buttons
    }

    private func setupDisplayLabel() {
        displayLabel = UILabel()
        displayLabel.text = "262,5"
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 80)
        displayLabel.textColor = .white
        displayLabel.backgroundColor = .black
        
        view.addSubview(displayLabel)
        
        displayLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }

    private func setupPortraitButtons() {
        let buttons = [
            ["AC", "±", "%", "÷"],
            ["7", "8", "9", "×"],
            ["4", "5", "6", "−"],
            ["1", "2", "3", "+"],
            ["0", ",", "="]
        ]
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.distribution = .fillEqually
        
        view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(displayLabel.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.width.equalTo(view).multipliedBy(0.8)
        }
        
        for row in buttons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                
                if title == "AC" || title == "±" || title == "%" {
                    button.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
                } else if title == "÷" || title == "×" || title == "−" || title == "+" || title == "=" {
                    button.backgroundColor = UIColor.orange
                } else {
                    button.backgroundColor = UIColor(white: 0.3, alpha: 1.0)
                }
                
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 30 // Rounded buttons
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 1
                
                rowStackView.addArrangedSubview(button)
            }
            
            mainStackView.addArrangedSubview(rowStackView)
        }
    }

    private func setupLandscapeButtons() {
        let scientificButtons = [
            ["(", ")", "mc", "m+", "m-", "mr"],
            ["2ⁿᵈ", "x²", "x³", "xʸ", "eˣ", "10ˣ"],
            ["√x", "³√x", "ʸ√x", "ln", "log₁₀", "e"],
            ["x!", "sin", "cos", "tan", "π", "EE"],
            ["Rad", "sinh", "cosh", "tanh", "Rand"]
        ]
        
        let portraitButtons = [
            ["AC", "±", "%", "÷"],
            ["7", "8", "9", "×"],
            ["4", "5", "6", "−"],
            ["1", "2", "3", "+"],
            ["0", ",", "="]
        ]
        
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.spacing = 10
        mainStackView.distribution = .fillEqually
        
        view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(displayLabel.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
        }

        let leftStackView = UIStackView()
        leftStackView.axis = .vertical
        leftStackView.spacing = 10
        leftStackView.distribution = .fillEqually
        
        for row in scientificButtons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                button.backgroundColor = UIColor.darkGray
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 30
                
                rowStackView.addArrangedSubview(button)
            }
            
            leftStackView.addArrangedSubview(rowStackView)
        }

        let rightStackView = UIStackView()
        rightStackView.axis = .vertical
        rightStackView.spacing = 10
        rightStackView.distribution = .fillEqually
        
        for row in portraitButtons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                
                if title == "AC" || title == "±" || title == "%" {
                    button.backgroundColor = UIColor.lightGray
                } else if title == "÷" || title == "×" || title == "−" || title == "+" || title == "=" {
                    button.backgroundColor = UIColor.orange
                } else {
                    button.backgroundColor = UIColor.darkGray
                }
                
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 10
                
                rowStackView.addArrangedSubview(button)
            }
            
            rightStackView.addArrangedSubview(rowStackView)
        }
        
        mainStackView.addArrangedSubview(leftStackView)
        mainStackView.addArrangedSubview(rightStackView)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        
        setupDisplayLabel()
        
        if UIDevice.current.orientation.isLandscape {
            setupLandscapeButtons()
        } else {
            setupPortraitButtons()
        }
    }
}
