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
    
    private let user = User.getUserInfo()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.person = user.person
            }
        }
    }
    
    @IBAction func logInButton() {
        if userNameTF.text != user.username || passwordTF.text != user.password {
            showAlert(title: "Wrong User Name or Password",
                      message: "Please, enter correct User Name and Password",
                      textfield: passwordTF)
        }
    }
    
    @IBAction func forgotPersonalData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Hey there :)", message: "Your user name is \(user.username)")
            : showAlert(title: "Hey there :)", message: "Your password is \(user.password)")
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
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
        return true
    }
}

