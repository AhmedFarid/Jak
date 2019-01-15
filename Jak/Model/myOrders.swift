//
//  myOrders.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class myOrders: NSObject {
    
    var orders_id: String
    var customers_id: String
    var customers_name: String
    var customers_street_address: String
    var customers_city: String
    var email: String
    var total_price: String
    var orders_status: String
    
    init?(dict: [String: JSON]){
        
        guard let orders_id = dict["orders_id"]?.string,let customers_id = dict["customers_id"]?.string,let customers_name = dict["customers_name"]?.string,let customers_street_address = dict["customers_street_address"]?.string, let customers_city = dict["customers_city"]?.string, let email = dict["email"]?.string, let total_price = dict["total_price"]?.string, let orders_status = dict["orders_status"]?.string else {return nil}
        
        
        self.orders_id = orders_id
        self.customers_id = customers_id
        self.customers_name = customers_name
        self.customers_street_address = customers_street_address
        self.customers_city = customers_city
        self.email = email
        self.total_price = total_price
        self.orders_status = orders_status
    }

}

class myOrdersDetails {
    var image: String
    var products_id: String
    var products_name: String
    var products_price: String
    var final_price: String
    var products_quantity: String
    
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string,let products_id = dict["products_id"]?.string,let products_name = dict["products_name"]?.string,let products_price = dict["products_price"]?.string, let final_price = dict["final_price"]?.string, let products_quantity = dict["products_quantity"]?.string else {return nil}
        
        
        self.image = image
        self.products_id = products_id
        self.products_name = products_name
        self.products_price = products_price
        self.final_price = final_price
        self.products_quantity = products_quantity
    }

}
