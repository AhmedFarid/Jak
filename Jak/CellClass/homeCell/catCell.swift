//
//  catCell.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class catCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func configuerCell(prodect: categours) {
        
        self.name.text = prodect.categories_name
        
        imageView.image = UIImage(named: "3")
        let s = (URLs.mainImage + prodect.categories_image)
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
