//
//  orderProdectVC.swift
//  Jak
//
//  Created by farido on 1/13/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class orderProdectVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var comments: UITextField!
    
    var lat = "111"
    var long = "111"
    
    var lats = 0.0
    var longs = 0.0
    
    
    var locagtionManger = CLLocationManager()
    var locationManageer: CLLocationManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapLocation.showsUserLocation = true
        mapLocation.delegate = self
        
        
        locationManageer = CLLocationManager()
        locationManageer?.requestWhenInUseAuthorization()
        
        let longitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.longitude) ?? 0.0
        print("long\(longitude)")
        self.longs = longitude
        self.long = "\(longitude)"
        let latitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.latitude) ?? 0.0
        print("lat\(latitude)")
        self.lat = "\(latitude)"
        self.lats = latitude
    }
    
    
    
    @IBAction func orderbutn(_ sender: Any) {
        
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        
        guard let namess = name.text, !namess.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let names = city.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your city", comment: "hhhh")
            let title = NSLocalizedString("order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let emails = address.text, !emails.isEmpty else {
            let messages = NSLocalizedString("enter your address", comment: "hhhh")
            let title = NSLocalizedString("order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let comment = comments.text, !comment.isEmpty else {
            let messages = NSLocalizedString("enter your comments", comment: "hhhh")
            let title = NSLocalizedString("order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        API_Cart.order(phone: phone.text ?? "", city: city.text ?? "", address: address.text ?? "", firstname: name.text ?? "", comments: comments.text ?? "", lon: longs, lat: lats) { (error: Error?, success, data, orderID)  in
            if success {
                let orderId = NSLocalizedString("Order ID", comment: "hhhh")
                let title = NSLocalizedString("Added", comment: "profuct list lang")
                self.showAlert(title: title, message: "\(data ?? "") \n  \(orderId): \(orderID ?? "")" )
            }else {

                print("Error")
            }
        }
    }
    
    @IBAction func getmyLocation(_ sender: Any) {
        let longitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.longitude) ?? 0.0
        self.long = "\(longitude)"
        let latitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.latitude) ?? 0.0
        self.lat = "\(latitude)"
        let userLocation = mapLocation.userLocation
        let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)! ,latitudinalMeters: 1000,longitudinalMeters: 1000)
        mapLocation.setRegion(region, animated: true)
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil {
                print("error")
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0] as CLPlacemark?
                let address = (pm?.thoroughfare)! + " " + (pm?.locality)! + " " + (pm?.country)!
                print("addersssss \(address)")
                self.address.text = address
            }else {
                print("error2")
            }
        })
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapLocation.centerCoordinate = userLocation.location!.coordinate
    }
    
}
