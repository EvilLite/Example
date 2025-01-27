//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    let person = Person(firstName: "alex", lastName: "grigol")
    private let helper = Helper() //1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        print("view did load")
        print(person.fullName)
        
        }
       
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10)) //2
        
        for number in helper.getNumbers() { //3
            print(number)
        }
    
    }
}

