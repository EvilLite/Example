//
//  Helper.swift
//  exampleApp
//
//  Created by Alex Grigol on 27/01/2025.
//

import Foundation

class Helper {
    
     var listPeople: [User] = []
    
    
    func addPerson(_ person: User) {
        listPeople.append(person)
    }
   
    
    func addAllPerson(_ person: [User]) {
        listPeople.append(contentsOf: person)
    }
    
    
}
