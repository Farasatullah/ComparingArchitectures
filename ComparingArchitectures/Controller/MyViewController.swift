//
//  MyViewController.swift
//  ComparingArchitectures
//
//  Created by Farasat's_MacBook_Pro on 03/04/2025.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var person = Person()
    var isFlipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial UI setup if needed
        createCard()
        initButton()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Ensure cardView is centered
        cardView.center = view.center
        
        // Recenter the button within cardView
        submitBtn.center = CGPoint(x: cardView.bounds.midX, y: cardView.bounds.midY)
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty else {
            resultLabel.text = "Please enter both name and email."
            return
        }
        
        UIView.animate(withDuration: 0.1, animations: { [self] in
            sender.transform = CGAffineTransform(scaleX: 1.9, y: 2.6)
            
            // Update model
            self.person.setName(name)
            self.person.setEmail(email)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
                
                // Update view
                self.resultLabel.text = "Your Name is: \(self.person.getName())\n and Email is: \(self.person.getEmail())"
            }
        }
        
    }
    func createCard(){
        cardView.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        cardView.addGestureRecognizer(tapGesture)
    }
    func initButton() {
        submitBtn.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin] // Keeps it centered
    }
    @objc func flipCard() {
        UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.cardView.backgroundColor = self.isFlipped ? .systemBlue : .systemRed
            self.resultLabel.isHidden = self.isFlipped
            self.submitBtn.isHidden = self.isFlipped

//            if !self.isFlipped {
//                self.cardView.addSubview(self.submitBtn)
//                self.submitBtn.center = CGPoint(x: self.cardView.bounds.midX, y: self.cardView.bounds.midY) // Ensure it's centered after flipping
//            } else {
//                self.submitBtn.removeFromSuperview()
//            }
        }, completion: { _ in
            self.isFlipped.toggle()
        })
    }
    
}
