//
//  homeData.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class banners: NSObject {

    var image: String
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string else {return nil}
        
        
        self.image = image
        
    }
}

class categours: NSObject {
    
    var categories_id: String
    var categories_name: String
    var categories_image: String
    var categories_icon: String
    
    init?(dict: [String: JSON]){
        
        guard let categories_id = dict["categories_id"]?.string,let categories_name = dict["categories_name"]?.string,let categories_image = dict["categories_image"]?.string,let categories_icon = dict["categories_icon"]?.string else {return nil}
        
        
        self.categories_id = categories_id
        self.categories_name = categories_name
        self.categories_image = categories_image
        self.categories_icon = categories_icon
        
    }
}


class featureProdects: NSObject {
    
    var products_id: String
    var products_name: String
    var products_description: String
    var products_model: String
    var products_image: String
    var products_price: String
    
    init?(dict: [String: JSON]){
        
        guard let products_id = dict["products_id"]?.string,let products_name = dict["products_name"]?.string,let products_description = dict["products_description"]?.string,let products_model = dict["products_model"]?.string,let products_image = dict["products_image"]?.string,let products_price = dict["products_price"]?.string else {return nil}
        
        
        self.products_id = products_id
        self.products_name = products_name
        self.products_description = products_description
        self.products_model = products_model
        self.products_image = products_image
        self.products_price = products_price
        
    }
}


//class flashOffers: NSObject {
//    
//    "products_id": "104"
//    "products_model": "dqdqwdqw",
//    "products_image": "resources/assets/images/product_images/1546170180.WhatsApp Image 2018-09-23 at 5.31.57 PM.jpeg",
//    "products_price": "1231111.00",
//    "products_name": "dqwdqw",
//    "products_description": "dqwddqwdqw",
//    
//    
//}
