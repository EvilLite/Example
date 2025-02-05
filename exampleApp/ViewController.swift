//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    private let helper = Helper() //1
    private let userRepository = UserRepository()
    private let textLabel = UILabel()
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show FullName", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        view.alpha = 0.1
        
        
        updatePerson()
        printPerson()
        setupLabel()
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(textLabel)
        view.addSubview(button1)
        
        
        
    }
    
   private func updatePerson() {
        let allPerson = userRepository.returnMass()
        helper.addAllPerson(allPerson)

    }
    
    private func printPerson() {
        helper.printPerson()
    }

    private func setupLabel() {
        if let userInfo = userRepository.returnMass().randomElement() {
            textLabel.text = "\(userInfo.fullName)"
        } else {
            textLabel.text = "nil"
        }
        textLabel.font = .systemFont(ofSize: 25, weight: .bold)
        textLabel.textColor = .blue
        textLabel.frame = CGRect(x: 35, y: 35, width: 100, height: 50)
    }
    
    @objc private func buttonTapped() {
            view.alpha = 1
            textLabel.frame = CGRect(x: 35, y: 35, width: 1000, height: 50)
           
    }
}
    
   
    

