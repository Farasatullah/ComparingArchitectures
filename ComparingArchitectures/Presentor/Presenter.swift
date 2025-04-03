//
//  Presenter.swift
//  ComparingArchitectures
//
//  Created by Farasat's_MacBook_Pro on 03/04/2025.
//

import Foundation
protocol PersonView: AnyObject {
    func showPersonInfo(name: String, email: String)
    func showError(message: String)
}

class PersonPresenter {
    private weak var view: PersonView?
    private var person: Person

    init(view: PersonView, person: Person = Person()) {
        self.view = view
        self.person = person
    }

    func updatePerson(name: String?, email: String?) {
        guard let name = name, !name.isEmpty,
              let email = email, !email.isEmpty else {
            view?.showError(message: "Please enter both name and email.")
            return
        }

        person.setName(name)
        person.setEmail(email)
        view?.showPersonInfo(name: person.getName(), email: person.getEmail())
    }
}
