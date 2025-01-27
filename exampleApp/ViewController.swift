//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    let person = Person(firstName: "alex", lastName: "grigol")
    let anotherPerson = Person(firstName: "alice", lastName: "wonderland")
    let anotherPerson2 = Person(firstName: "bob", lastName: "marley")
    private let helper = Helper() //1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        updatePerson()
        returnPerson()

        }
       
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10)) //2
        
        for number in helper.getNumbers() { //3
            print(number)
        }
    
    }
    
    private func updatePerson() {
        helper.addPerson(person)
        helper.addPerson(anotherPerson)
        helper.addPerson(anotherPerson2)
    }
    
    private func returnPerson() {
        helper.returnPerson()
    }
    
}

