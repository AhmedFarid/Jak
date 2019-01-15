//
//  BannerCell.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class BannerCell: UICollectionViewCell {
    
//    override func awakeFromNib() {
//        self.layer.cornerRadius = (self.frame.width / 2)
//        self.layer.masksToBounds = true
//    }
    @IBOutlet weak var imageView: UIImageView!
    
    func configuerCell(prodect: banners) {
        
        imageView.image = UIImage(named: "3")
        let s = ("http://jak-go.com/public/images/mobile_banner/\(prodect.image)")
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
