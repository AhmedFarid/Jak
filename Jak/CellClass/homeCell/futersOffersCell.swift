//
//  futersOffersCell.swift
//  Jak
//
//  Created by farido on 1/9/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class futersOffersCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func configuerCell(prodect: featureProdects) {
        
        self.name.text = prodect.products_name
        self.price.text = prodect.products_price
        
        imageView.image = UIImage(named: "3")
        let s = (URLs.mainImage + prodect.products_image)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imageView.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imageView.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
}
