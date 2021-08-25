//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Ярослав Бойко on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeMessageLabel: UILabel!
    
    var welcomeMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeMessageLabel.text = welcomeMessage
    }
    
    @IBAction func logOutButton() {
    }
    
}
