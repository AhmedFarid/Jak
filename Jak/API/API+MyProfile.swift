//
//  API+MyProfile.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_MyProfile: NSObject {
    
    class func updatProfile(completion: @escaping (_ error: Error?, _ success: Bool, _ first_name: String?, _ last_name: String?, _ email: String?,_ phone: String?, _ image: String?)->Void) {
        
        let api_token = "123asd"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false, nil, nil, nil ,nil,nil)
            return
        }
        
        let url = URLs.profile
        print(url)
        let parameters = [
            "api_token": api_token,
            "lang":lang,
            "user_token": userToken
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil, nil, nil ,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let first_name = json["data"]["first_name"].string {
                    let last_name = json["data"]["last_name"].string
                    let email = json["data"]["email"].string
                    let phone = json["data"]["phone"].string
                    let image = json["data"]["image"].string
                    completion(nil, true , first_name, last_name, email ,phone,image)
                }
                
            }
        }
        
    }
    
    class func showProducts (completion: @escaping (_ error: Error?,_ sparParts: [myOrders]?)-> Void) {
        
        let url = URLs.orderCustomer
        
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
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
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["MyOrder"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myOrders]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myOrders.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func showProductsDitals (orders_id: String, completion: @escaping (_ error: Error?,_ sparParts: [myOrdersDetails]?)-> Void) {
        
        let url = URLs.ordersDetails
        
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang,
            "user_token": userToken,
            "orders_id": orders_id
        ]
        
        print(parameters)
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["Details"][0]["products"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myOrdersDetails]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myOrdersDetails.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
