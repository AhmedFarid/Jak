//
//  myorderDetailsVC.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class myorderDetailsVC: UIViewController {

    
    var orderDetails = [myOrdersDetails]()
    var singleItemMyOrders: myOrders?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        handleRefresh()
        customBackBtton()
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func handleRefresh() {
        API_MyProfile.showProductsDitals(orders_id: singleItemMyOrders?.orders_id ?? ""){ (error: Error?, orderDetails: [myOrdersDetails]?) in
            if let orderDetails = orderDetails {
                self.orderDetails = orderDetails
                print("xxx\(self.orderDetails)")
                self.tableView.reloadData()
            }
        }
        
    }
}

extension myorderDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myordersDeitals {
            let cartss = orderDetails[indexPath.item]
            cell.configuerCell(prodect: cartss)
            return cell
        }else {
            return cartCell()
            
        }
    }
}

