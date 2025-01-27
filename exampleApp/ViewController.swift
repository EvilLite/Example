//
//  ViewController.swift
//  exampleApp
//
//  Created by Alex Grigol on 24/01/2025.
//

import UIKit

class ViewController: UIViewController {
    let person = Person(firstName: "alex", lastName: "grigol")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        print(person.fullName)
    }
}

