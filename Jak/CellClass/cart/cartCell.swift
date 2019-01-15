//
//  cartCell.swift
//  Jak
//
//  Created by farido on 1/10/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class cartCell: UITableViewCell {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var quanttiy: UILabel!
    @IBOutlet weak var deletBTN: UIButton!
    
    
    
    var addCount: (()->())?
    var deleteCount: (()->())?
    var deletAll: (()->())?
    
    
    func configuerCell(prodect: cartsData) {
        
        self.name.text = prodect.products_name
        self.price.text = prodect.price
        self.quanttiy.text = prodect.customers_basket_quantity
        
        images.image = UIImage(named: "3")
        let s = (URLs.mainImage + prodect.image)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        addCount?()
    }

    @IBAction func deletse(_ sender: Any) {
        deleteCount?()
    }

    @IBAction func deletaCart(_ sender: Any) {
        deletAll?()
    }
    
}
