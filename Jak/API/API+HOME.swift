//
//  API+HOME.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class home: NSObject {
    
    
    class func banner (completion: @escaping (_ error: Error?,_ sparParts: [banners]?)-> Void) {
        
        let url = URLs.mobileBanner
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang
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
                guard let dataArray = json["data"]["Banner"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [banners]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = banners.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func categoure (completion: @escaping (_ error: Error?,_ sparParts: [categours]?)-> Void) {
        
        let url = URLs.showCategory
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang
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
                guard let dataArray = json["data"]["categories"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [categours]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = categours.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func showProduct (cat_id: String ,completion: @escaping (_ error: Error?,_ sparParts: [featureProdects]?)-> Void) {
        
        let url = URLs.showProduct
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang,
            "cat_id": cat_id
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
                guard let dataArray = json["data"]["products"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [featureProdects]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = featureProdects.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func showProductFlash (completion: @escaping (_ error: Error?,_ sparParts: [featureProdects]?)-> Void) {
        
        let url = URLs.showProductFlashSelle
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang
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
                guard let dataArray = json["data"]["products"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [featureProdects]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = featureProdects.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func showProducts (completion: @escaping (_ error: Error?,_ sparParts: [featureProdects]?)-> Void) {
        
        let url = URLs.showProductFeature
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "api_token": api_token,
            "lang": lang
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
                guard let dataArray = json["data"]["products"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [featureProdects]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = featureProdects.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
