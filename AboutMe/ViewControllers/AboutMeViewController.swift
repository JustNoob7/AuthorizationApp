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
    
    var person: Person!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hobbiesVC = segue.destination as? HobbiesViewController else { return }
        hobbiesVC.hobby = person.hobby
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.title = person.name + " " + person.surname
        userInformation.text = person.aboutUserInfo
    }

}
