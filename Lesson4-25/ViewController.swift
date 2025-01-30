//
//  ViewController.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {

    //MARK: User info entries
    
    private lazy var sex = UserInfoEntery(heading: "SEX", info:"Dima")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sex)
        
        sex.translatesAutoresizingMaskIntoConstraints = false
        sex.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sex.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    



}

