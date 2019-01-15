//
//  API+Cart.swift
//  Jak
//
//  Created by farido on 1/10/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



class API_Cart: NSObject {
    
    class func addToCart(products_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        let url = URLs.addToCart
        print(url)
        let parameters = [
            "user_token": userToken,
            "api_token": api_token,
            "products_id": products_id,
            "lang": lang
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["messages"].string {
                    print(data)
                    completion(nil, true, data)
                }
                
            }
        }
    }
    
    class func carts (completion: @escaping (_ error: Error?,_ sparParts: [cartsData]?, _ total_carts: Int?)-> Void) {
        
        let url = URLs.myCart
        
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil,nil)
            return
        }
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang,
            "user_token": userToken
        ]
        
        print(parameters)
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["cart"].array else{
                    completion(nil, nil,nil)
                    return
                }
                print(dataArray)
                var products = [cartsData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = cartsData.init(dict: data){
                        products.append(prodect)
                    }
                }
                if let total_carts = json["data"]["total_carts"].int {
                    completion(nil, products,total_carts)
                }
            }
        }
    }
    
    class func addTOQuentaty(customers_basket_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        let url = URLs.updateCartAddQty
        print(url)
        let parameters = [
            "user_token": userToken,
            "api_token": api_token,
            "customers_basket_id": customers_basket_id,
            "lang": lang
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["message"].string {
                    print(data)
                    completion(nil, true, data)
                }
                
            }
        }
    }
    
    class func deleteTOQuentaty(customers_basket_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        let url = URLs.updateCartdeleteQty
        print(url)
        let parameters = [
            "user_token": userToken,
            "api_token": api_token,
            "customers_basket_id": customers_basket_id,
            "lang": lang
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["message"].string {
                    print(data)
                    completion(nil, true, data)
                }
                
            }
        }
    }
    
    class func deleteAll(customers_basket_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        let url = URLs.deleteFromCart
        print(url)
        let parameters = [
            "user_token": userToken,
            "api_token": api_token,
            "customers_basket_id": customers_basket_id,
            "lang": lang
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["message"].string {
                    print(data)
                    completion(nil, true, data)
                }
                
            }
        }
    }
    
    class func order(phone: String,city: String,address: String,firstname: String,comments: String,lon: Double, lat: Double, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?,_ orderID: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil,nil)
            return
        }
        let url = URLs.placeOrder
        print(url)
        let parameters = [
            "user_token": userToken,
            "api_token": api_token,
            "lang": lang,
            "phone": phone,
            "address": address,
            "firstname": firstname,
            "comments": comments,
            "city":city,
            "lon": lon,
            "lat": lat
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["message"].string {
                    if let orderID = json["data"]["order_id"].string {
                    completion(nil,true,data,orderID)
                    }
                }
            }
        }
    }
}

