//
//  prodectdetailsVC.swift
//  Jak
//
//  Created by farido on 1/9/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class prodectdetailsVC: UIViewController {

   
    
    
    var singleItemCat: featureProdects?
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackBtton()
        
        self.navigationItem.title = singleItemCat?.products_name
        
        

        price.text = singleItemCat?.products_price
        name.text = singleItemCat?.products_name
        desc.text = singleItemCat?.products_description
        
        images.image = UIImage(named: "3")
        let s = (URLs.mainImage + "\(singleItemCat?.products_image ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        
        API_Cart.addToCart(products_id: singleItemCat?.products_id ?? "") { (error: Error?, success, data) in
            if success {
                let title = NSLocalizedString("Add To cart", comment: "profuct list lang")
                self.showAlert(title: title, message: data ?? "")
            }else {
                print("Error")
            }
        }
    }
}
