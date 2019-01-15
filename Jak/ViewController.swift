//
//  ViewController.swift
//  Jak
//
//  Created by farido on 1/2/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
    }

    func imageText() {
        
        if let myImage = UIImage(named: "Shape"){
            
            emailTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "lock-ico"){
            
            passwordTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
}

