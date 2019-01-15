//
//  cartsData.swift
//  Jak
//
//  Created by farido on 1/10/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class cartsData: NSObject {

    
    var image: String
    var products_name: String
    var price: String
    var customers_basket_id: String
    var customers_basket_quantity: String
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string,let products_name = dict["products_name"]?.string,let price = dict["price"]?.string,let customers_basket_id = dict["customers_basket_id"]?.string, let customers_basket_quantity = dict["customers_basket_quantity"]?.string else {return nil}
        
        
        self.image = image
        self.products_name = products_name
        self.price = price
        self.customers_basket_id = customers_basket_id
        self.customers_basket_quantity = customers_basket_quantity
    }
}
