//
//  Person.swift
//  exampleApp
//
//  Created by Alex Grigol on 27/01/2025.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

struct User {
    let login: String
    let password: String
    let person: Person
    
    var fullName: String {
        person.fullName
    }
}
