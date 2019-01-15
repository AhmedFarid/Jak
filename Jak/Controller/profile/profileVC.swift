//
//  profileVC.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackBtton()
        handelRefsh()
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func handelRefsh(){
        API_MyProfile.updatProfile{ (error: Error?, success: Bool, first_name, last_name,email,phone,image) in
            if success {
                let FullName = NSLocalizedString("Full Name", comment: "hhhh")
                self.fullname.text = "\(FullName): \(first_name ?? "") \(last_name ?? "")"
                let Email = NSLocalizedString("Email", comment: "hhhh")
                self.email.text = "\(Email): \(email ?? "")"
                let Phone = NSLocalizedString("Phone", comment: "hhhh")
                self.phone.text = "\(Phone): \(phone ?? "")"
                print(image ?? "")
            }else {
            }
            
        }
    }
    
    @IBAction func view(_ sender: Any) {
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        performSegue(withIdentifier: "123", sender: nil)
    }
    
}
