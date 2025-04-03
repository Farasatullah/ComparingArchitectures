//
//  Person.swift
//  ComparingArchitectures
//
//  Created by Farasat's_MacBook_Pro on 03/04/2025.
//

import Foundation
class Person {
    private var name: String
    private var email: String

    init(name: String = "", email: String = "") {
        self.name = name
        self.email = email
    }

    func setName(_ name: String) {
        self.name = name
    }

    func setEmail(_ email: String) {
        self.email = email
    }

    func getName() -> String {
        return name
    }

    func getEmail() -> String {
        return email
    }
}
