//
//  MyViewController.swift
//  ComparingArchitectures
//
//  Created by Farasat's_MacBook_Pro on 03/04/2025.
//

import UIKit

//MARK: - Controller Class
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
        modifiedCard()
        modifiedButton()
    }
    //MARK: - Will adjust the view whenever view updates itself again
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
        //MARK: - Animate Out Card
        UIView.animate(withDuration: 0.1, animations: { [self] in
            sender.transform = CGAffineTransform(scaleX: 1.9, y: 2.6)
            
            // Update model
            self.person.setName(name)
            self.person.setEmail(email)
        }) { _ in
            //MARK: - Animate In Card
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
                
                // Update view
                self.resultLabel.text = "Your Name is: \(self.person.getName())\n and Email is: \(self.person.getEmail())"
            }
        }
        
    }
    //MARK: - Updated Card
    func modifiedCard(){
        cardView.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        cardView.addGestureRecognizer(tapGesture)
    }
    //MARK: - Updated Submit Button
    func modifiedButton() {
        submitBtn.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin] // Keeps it centered
    }
    //MARK: - Card Flip Logic
    @objc func flipCard() {
        UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.cardView.backgroundColor = self.isFlipped ? .systemBlue : .systemRed
            self.resultLabel.isHidden = self.isFlipped
            self.submitBtn.isHidden = self.isFlipped
            
        }, completion: { _ in
            self.isFlipped.toggle()
        })
    }
    
}
