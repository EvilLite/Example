//
//  Person.swift
//  exampleApp
//
//  Created by Alex Grigol on 27/01/2025.
//

import Foundation

class Person {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName    
    }
}
