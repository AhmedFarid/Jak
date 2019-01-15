//
//  moreVC.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class moreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackBtton()
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func myorder(_ sender: Any) {
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        performSegue(withIdentifier: "suge123", sender: nil)
    }
    
    @IBAction func logoutBTN(_ sender: Any) {
        helper.dleteAPIToken()
    }
    
}
