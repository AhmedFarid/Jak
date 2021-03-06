//
//  loginVC.swift
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

        customBackBtton()
        imageText()
    }
    
    
    
    @IBAction func loginBTN(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let password = passwordTF.text, !password.isEmpty else {
            let messages = NSLocalizedString("enter your Password", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        API_AUTH.login(email: emailTF.text ?? "", password: passwordTF.text ?? "") { (error: Error?, success: Bool, data) in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Register Filed", message: "\(data ?? "") Sorry Try again")
                }
                //
            }else {
                self.showAlert(title: "Register Filed", message: "\(data ?? "") Sorry Try again")
            }
            
        }
        
    }
    
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "at-sign"){
            
            emailTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "lock-ico"){
            
            passwordTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
}



