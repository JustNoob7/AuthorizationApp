//
//  ViewController.swift
//  Authorization
//
//  Created by Ярослав Бойко on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let trueUserName = "User"
    private let truePassword = "1234"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeMessage = "Welcome, \(userNameTF.text ?? "someone")!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    @IBAction func logInButton() {
        if userNameTF.text == trueUserName && passwordTF.text == truePassword {
            // Понимаю, что здесь код неверный, но не придумал лучшего варианта
        } else {
            showAlert(with: "Wrong User Name or Password", and: "Please, enter correct User Name and Password")
        }
    }
    
    @IBAction func userNamePromptButton() {
        showAlert(with: "Hey there :)", and: "Your user name is \(trueUserName)")
    }
    
    @IBAction func passwordPromptButton() {
        showAlert(with: "Hey there :)", and: "Your password is \(truePassword)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

