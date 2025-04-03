//
//  ViewController.swift
//  ComparingArchitectures
//
//  Created by Farasat's_MacBook_Pro on 03/04/2025.
//

import UIKit

class ViewController: UIViewController, PersonView {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    private var presenter: PersonPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PersonPresenter(view: self)
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        presenter.updatePerson(name: nameTextField.text, email: emailTextField.text)
    }

    // MARK: - PersonView Protocol Methods

    func showPersonInfo(name: String, email: String) {
        resultLabel.text = "Name: \(name)\nEmail: \(email)"
    }

    func showError(message: String) {
        resultLabel.text = message
    }
}
