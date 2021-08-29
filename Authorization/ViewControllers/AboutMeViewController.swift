//
//  AboutMeViewController.swift
//  Authorization
//
//  Created by Ярослав Бойко on 29.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var navigationBar: UINavigationItem!
    
    @IBOutlet var userInformation: UILabel!
    
    var navigationTittle: String!
    var userInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.title = navigationTittle
        userInformation.text = userInfo
    }

}
