//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    //private let anotherPerson1 = User(login: "Login", password: "12345", person: Person(firstName: "John", lastName: "Doe"))
    //private let anotherPerson2 = User(login: "Login1", password: "12345", person: Person(firstName: "John1", lastName: "Doe1"))
    //private let anotherPerson3 = User(login: "Login2", password: "12345", person: Person(firstName: "John2", lastName: "Doe2"))

    private let helper = Helper() //1
    private let userRepository = UserRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updatePerson()
        //printPerson()
        view.backgroundColor = .white
        view.alpha = 0.1
            //test commit
        let allPerson = userRepository.returnMass()
        helper.addAllPerson(allPerson)
        helper.printPerson()
        
    }
    
/*    private func updatePerson() {
        helper.addPerson(anotherPerson2)
    }
    
    private func printPerson() {
        helper.printPerson()
    }
*/

    
}
    
   
    

