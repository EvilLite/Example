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
    private let imageView3 = UIImageView()
    private var myView = UIView()
    private var stackView = UIStackView()
    private var customButton1 = CustomButton("Show New User", .red)
    private var customButton2 = CustomButton("Hide User", .green, true)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white.withAlphaComponent(0.1)
        updatePerson()
        printPerson()
        setupLabel()
        setupView()
        setupUIView()
        setupImageView3()
        customButton1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        customButton2.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
        
    }
    
    private func updatePerson() {
        let allPerson = userRepository.returnMass()
        helper.addAllPerson(allPerson)
    }
    
 //   private func printPerson() {
       // helper.printPerson()
   // }
    
    func printPerson() {
        for user in helper.listPeople {
            print(user.fullName, user.login,user.password)
        }
    }
    
    private func setupLabel() {
        if let userInfo = userRepository.returnMass().randomElement() {
            textLabel.text = "\(userInfo.fullName)"
        } else {
            textLabel.text = "nil"
        }
        textLabel.font = .systemFont(ofSize: 25, weight: .bold)
        textLabel.textColor = .blue
        textLabel.alpha = 0
        textLabel.textAlignment = .center
    }
    
   
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame =  view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        //добавляем подслой к кнопке
        view.layer.insertSublayer(gradient, at: 0) //градиент на фоне кнопки
    }
    
    
    
    //создаю фрейм с тенью с размерами картинки
    private func setupUIView() {
        myView.layer.cornerRadius = 20
        myView.layer.shadowOffset = CGSize(width: 15, height: 15)
        myView.layer.shadowOpacity = 1
        myView.layer.shadowRadius = 10
    }
    
    //создаю картинку
    private func setupImageView3() {
        imageView3.image = UIImage(named: "Screenshot 2025-01-22 at 18.53.40")
        imageView3.frame = myView.bounds
        imageView3.layer.cornerRadius = 20
        imageView3.clipsToBounds = true
        myView.addSubview(imageView3)
    }
    
    
    @objc private func buttonTapped() {
        view.backgroundColor = .white
        textLabel.alpha = 1
    }
    
    @objc private func buttonTapped1() {
        view.backgroundColor = .white
        textLabel.alpha = 0
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(myView)
        stackView.addArrangedSubview(imageView3)
        //stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(customButton1)
        stackView.addArrangedSubview(customButton2)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        myView.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            
            imageView3.topAnchor.constraint(equalTo: myView.topAnchor),
            imageView3.bottomAnchor.constraint(equalTo: myView.bottomAnchor),
            imageView3.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
            imageView3.trailingAnchor.constraint(equalTo: myView.trailingAnchor)
        ])
    }
}




