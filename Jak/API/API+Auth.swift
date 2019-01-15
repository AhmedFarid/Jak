//
//  API+Auth.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_AUTH: NSObject {
    
    class func signUp(firstName: String, lastName: String, email: String,phone: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let url = URLs.signupMobile
        print(url)
        let parameters = [
            "api_token": api_token,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone,
            "password": password
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
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                    let data = json["data"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
    
    class func login(email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let url = URLs.login
        print(url)
        let parameters = [
            "api_token": api_token,
            "email": email,
            "password": password
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
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                    let data = json["data"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
}
