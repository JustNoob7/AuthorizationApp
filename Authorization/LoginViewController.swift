//
//  ViewController.swift
//  Authorization
//
//  Created by Ярослав Бойко on 24.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let trueUserName = "User"
    private let truePassword = "1234"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    @IBAction func logInButton() {
        if userNameTF.text != trueUserName || passwordTF.text != truePassword {
            showAlert(title: "Wrong User Name or Password",
                      message: "Please, enter correct User Name and Password",
                      textfield: passwordTF)
        }
    }
    
    @IBAction func forgotPersonalData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Hey there :)", message: "Your user name is \(trueUserName)")
            : showAlert(title: "Hey there :)", message: "Your password is \(truePassword)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textfield: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textfield?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
