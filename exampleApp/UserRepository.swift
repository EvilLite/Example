class UserRepository {
    private let anotherPerson1 = User(login: "Login", password: "12345", person: Person(firstName: "John", lastName: "Doe"))
    private let anotherPerson2 = User(login: "Login1", password: "12345", person: Person(firstName: "John1", lastName: "Doe1"))
    private let anotherPerson3 = User(login: "Login2", password: "12345", person: Person(firstName: "John2", lastName: "Doe2"))
    
    func returnMass() -> [User] {
        return [User(login: "Login", password: "12345", person: Person(firstName: "John", lastName: "Doe")),
                User(login: "Login1", password: "12345", person: Person(firstName: "John1", lastName: "Doe1")),
                User(login: "Login2", password: "12345", person: Person(firstName: "John2", lastName: "Doe2"))
        ]
    }
}

