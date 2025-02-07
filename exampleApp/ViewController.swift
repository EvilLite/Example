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
    private let imageView = UIImageView()
    private let imageView1 = UIImageView()
    private let textLabel = UILabel()
    private let imageView3 = UIImageView()
    private var myView = UIView()
    ///
    
    
    
    ///
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
        
        view.backgroundColor = .white.withAlphaComponent(0.1)
        
        
        updatePerson()
        printPerson()
        setupLabel()
       // setupImageView()
        setupView()
       // setupImageView1()
        
        setupUIView()
        setupImageView3()
       
        
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        //
      
        
        
      
        
       
        
        
        
        //
        view.addSubview(textLabel)
        view.addSubview(button1)
        //view.addSubview(imageView)
        //view.addSubview(imageView1)
        
        //добавляю фрейм
        view.addSubview(myView)
        //импортирую во фрейм картинку
        myView.addSubview(imageView3)
        
        
        
        
        
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
        textLabel.alpha = 0
    }
 /*
    private func setupImageView() {
        imageView.image = UIImage(named: "Screenshot 2025-01-22 at 18.53.40")
        imageView.frame = CGRect(x: 100, y: 150, width: 150, height: 300)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
*/
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame =  view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        //добавляем подслой к кнопке
        view.layer.insertSublayer(gradient, at: 0) //градиент на фоне кнопки
    }
/*
    private func setupImageView1() {
        imageView1.image = UIImage(named: "Screenshot 2025-01-22 at 18.53.40")
        imageView1.frame = CGRect(x: 100, y: 450, width: 150, height: 300)
        imageView1.layer.cornerRadius = 20
        imageView1.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageView1.layer.shadowOpacity = 1
        imageView1.layer.shadowRadius = 10
        
    }
 */
    
 
    //создаю фрейм с тенью с размерами картинки
    private func setupUIView() {
       
        //myView = UIView(frame: imageView3.bounds)
        myView.frame = CGRect(x: 50, y: 200, width: 200, height: 300)
        myView.layer.cornerRadius = 20
        myView.layer.shadowOffset = CGSize(width: 15, height: 15)
        myView.layer.shadowOpacity = 1
        myView.layer.shadowRadius = 10
    }
    
    //создаю картинку
     private func setupImageView3() {
         imageView3.image = UIImage(named: "Screenshot 2025-01-22 at 18.53.40")
         
         imageView3.frame = myView.bounds
         //imageView3.frame = CGRect(x: 50, y: 200, width: 200, height: 300)
         imageView3.layer.cornerRadius = 20
         imageView3.clipsToBounds = true
     }
     
    
    
    @objc private func buttonTapped() {
        view.backgroundColor = .white
        textLabel.alpha = 1
        textLabel.frame = CGRect(x: 35, y: 35, width: 1000, height: 50)
        
    }
}




