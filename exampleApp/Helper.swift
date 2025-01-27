//
//  Helper.swift
//  exampleApp
//
//  Created by Alex Grigol on 27/01/2025.
//

import Foundation

class Helper {
    
    var listPeople: [Person] = []
    

    func addPerson(_ person: Person) {
        listPeople.append(person)
    }
    func returnPerson() {
        for person in listPeople {
            print(person.fullName)
        }
    }
    
    private var numbers: [Int] = [] //1
    
    
    func addNumber(_ number: Int) { //2
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] { //3
        numbers
    }
}
