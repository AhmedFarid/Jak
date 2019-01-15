//
//  myordersDeitals.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class myordersDeitals: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var finalprice: UILabel!
    @IBOutlet weak var prodecQuentity: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    func configuerCell(prodect: myOrdersDetails) {
        
        let ProductName = NSLocalizedString("Product Name:", comment: "profuct list lang")
        self.name.text = "\(ProductName) \(prodect.products_name)"
        let ProducPrice = NSLocalizedString("Product Price:", comment: "profuct list lang")
        self.price.text = "\(ProducPrice) \(prodect.products_price)"
        let ProductFinalPrice = NSLocalizedString("Product Final Price:", comment: "profuct list lang")
        self.finalprice.text = "\(ProductFinalPrice) \(prodect.final_price)"
        let ProductQuantity = NSLocalizedString("Product Quantity:", comment: "profuct list lang")
        self.prodecQuentity.text = "\(ProductQuantity) \(prodect.products_quantity)"
        
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
    
    
}
