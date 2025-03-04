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
    private var myView = UIView()
    private var stackView = UIStackView()
    private var shadowView = ShadowView(imageName:ShadowViewType.bag.rawValue)
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
        addAction()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
        
    }
}





// MARK: - Nested types

extension ViewController {
    
    enum ShadowViewType: String {
        case bag = "Screenshot 2025-01-22 at 18.53.40"
        case car = "CleanShot 2025-02-26 at 11.30.19"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
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
    
    
   
    
     func setupStackView() {
        stackView.axis = .vertical
         stackView.distribution = .equalSpacing
         stackView.alignment = .fill
        stackView.spacing = 20
         stackView.addArrangedSubView(textLabel,myView,shadowView,customButton1,customButton2)
    }
}

// MARK: - Setup layout
private extension ViewController {
     func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
         myView.translatesAutoresizingMaskIntoConstraints = false
         customButton1.translatesAutoresizingMaskIntoConstraints = false
         customButton2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor),
    
            customButton1.heightAnchor.constraint(equalToConstant: 50),
            
            customButton2.heightAnchor.constraint(equalToConstant: 50)
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
    
    @objc private func buttonTapped() {
        //view.backgroundColor = .white
        textLabel.alpha = 1
        let userInfo = userRepository.returnMass()
        textLabel.text = userInfo.randomElement()?.fullName
       let randomImage = [
        ShadowViewType.bag,
        ShadowViewType.car
       ].randomElement() ?? ShadowViewType.bag
        shadowView.updateImage(randomImage.rawValue)
    }
    
    @objc private func buttonTapped1() {
        textLabel.alpha = 0
    }
}
