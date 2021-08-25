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
    
    let trueUserName = "User"
    let truePassword = "1234"
    
    @IBAction func logInButton() {
//        if userNameTF.text == trueUserName && passwordTF.text == truePassword {
////            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////            guard let newVC = storyBoard.instantiateViewController(withIdentifier: "vc") as? WelcomeViewController else { return }
////            newVC.welcomeMessage = "Welcome, \(userNameTF.text ?? "someone")"
////            present(newVC, animated: true)
//        } else {
//            showAlert(with: "Wrong User Name or Password", and: "Please, enter correct User Name and Password")
//        }
    }
    
    @IBAction func userNamePromptButton() {
        showAlert(with: "Hey there :)", and: "Your user name is \(trueUserName)")
    }
    
    @IBAction func passwordPromptButton() {
        showAlert(with: "Hey there :)", and: "Your password is \(truePassword)")
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

