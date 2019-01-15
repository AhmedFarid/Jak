//
//  langVC.swift
//  Jak
//
//  Created by farido on 1/15/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class langVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func ar(_ sender: Any) {
                if Language.currentLanguage() == "en-US" {
                    Language.setAppLanguage(lang: "ar")
                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
                }
        
        
                let window = (UIApplication.shared.delegate as? AppDelegate)?.window
                let sb = UIStoryboard(name: "Main", bundle: nil)
                if let api_token = helper.getAPIToken(){
                    print(api_token)
                    //            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
                    //            window?.rootViewController = tab
                    window?.rootViewController = sb.instantiateViewController(withIdentifier: "main")
                    UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
                }else{
                    window?.rootViewController = sb.instantiateViewController(withIdentifier: "login")
                    UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
    }
    
    @IBAction func en(_ sender: Any) {
        if Language.currentLanguage() == "ar" {
            Language.setAppLanguage(lang: "en-US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }


        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let api_token = helper.getAPIToken(){
            print(api_token)
            //            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
            //            window?.rootViewController = tab
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "main")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)

        }else{
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "login")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }

    }

    

        
//        if Language.currentLanguage() == "ar" {
//            Language.setAppLanguage(lang: "en-US")
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//        }else{
//            Language.setAppLanguage(lang: "ar")
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//        }
        
        
//        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        if let api_token = helper.getAPIToken(){
//            print(api_token)
//            //            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
//            //            window?.rootViewController = tab
//            window?.rootViewController = sb.instantiateViewController(withIdentifier: "main")
//            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//
//        }else{
//            window?.rootViewController = sb.instantiateViewController(withIdentifier: "login")
//            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//        }
    
}
