//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    private let anotherPerson2 = User(login: "Login", password: "12345", person: Person(firstName: "John", lastName: "Doe"))
    private let helper = Helper() //1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePerson()
        printPerson()
        
    }
    
    private func updatePerson() {
        helper.addPerson(anotherPerson2)
    }
    
    private func printPerson() {
        helper.printPerson()
    }
    
}
    
   
    

