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
        addAction()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
        
    }
}


extension UIStackView {
    
    func addArrangedSubView(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}

extension UIView {
    func addSubView(_ views: UIView...) {
        for view in views {
            self.addSubView(view)
        }
    }
}

//MARK: - Setup View
private extension ViewController {
    func setupLabel() {
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
    
    private func addAction() {
        customButton1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        customButton2.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
    }
    
     func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame =  view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        //добавляем подслой к кнопке
        view.layer.insertSublayer(gradient, at: 0) //градиент на фоне кнопки
    }
    
    
    
    //создаю фрейм с тенью с размерами картинки
    func setupUIView() {
        myView.layer.cornerRadius = 20
        myView.layer.shadowOffset = CGSize(width: 15, height: 15)
        myView.layer.shadowOpacity = 1
        myView.layer.shadowRadius = 10
    }
    
    //создаю картинку
    func setupImageView3() {
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
    
     func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.addArrangedSubView(textLabel,myView,imageView3,customButton1,customButton2)
    }
}

// MARK: - Setup layout
private extension ViewController {
     func setupLayout() {
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

// MARK: - Update Info
private extension ViewController {
     func updatePerson() {
        let allPerson = userRepository.returnMass()
        helper.addAllPerson(allPerson)
    }
    
    func printPerson() {
        let userInfo = userRepository.returnMass()
        
        for user in userInfo {
            print(user.fullName)
        }
    }
}
