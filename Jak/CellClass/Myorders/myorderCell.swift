//
//  myorderCell.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class myorderCell: UITableViewCell {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quanttiy: UILabel!
    
    
    func configuerCell(prodect: myOrders) {
        
        let orderId = NSLocalizedString("order Id:", comment: "profuct list lang")
        self.name.text = "\(orderId) \(prodect.orders_id)"
        let orderprice = NSLocalizedString("order price:", comment: "profuct list lang")
        self.price.text = "\(orderprice) \(prodect.total_price)"
        let orderstatus = NSLocalizedString("order status:", comment: "profuct list lang")
        self.quanttiy.text = "\(orderstatus) \(prodect.orders_status)"
    }
}
