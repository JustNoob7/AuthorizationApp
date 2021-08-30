//
//  HobbiesViewController.swift
//  Authorization
//
//  Created by Ярослав Бойко on 29.08.2021.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    @IBOutlet var navigationTittle: UINavigationItem!
    
    @IBOutlet var hobbiesInfo: UILabel!
    
    var hobby: Hobby!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTittle.title = "Hobbies"
        hobbiesInfo.text = hobby.title
    }

}
