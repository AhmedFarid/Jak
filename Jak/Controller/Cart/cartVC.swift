//
//  cartVC.swift
//  Jak
//
//  Created by farido on 1/10/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class cartVC: UIViewController {

    
    var carts = [cartsData]()
    @IBOutlet weak var totalprice: UILabel!
    @IBOutlet weak var tabelVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelVIew.delegate = self
        tabelVIew.dataSource = self
        
        handleRefresh()
        customBackBtton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefresh()
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func handleRefresh() {
        API_Cart.carts{ (error: Error?, carts: [cartsData]?, total_carts) in
            if let carts = carts {
                self.carts = carts
                print("xxx\(self.carts)")
                self.tabelVIew.reloadData()
                self.totalprice.text = "\(total_carts ?? 0)"
            }
        }
        
    }
    

    @IBAction func orderBTN(_ sender: Any) {
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        guard totalprice.text != "\(0)" else {
            let message = NSLocalizedString("Add something to cart frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: title, message: message)
            return
        }
        
        performSegue(withIdentifier: "suge", sender: nil)
        
        
    }
}

extension cartVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelVIew.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cartCell {
            let cartss = carts[indexPath.item]
            cell.configuerCell(prodect: cartss)
            
            cell.addCount = {
                
                guard (helper.getAPIToken() != nil)  else {
                    let message = NSLocalizedString("please login frist", comment: "hhhh")
                    let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                    self.showAlert(title: title, message: message)
                    return
                }
                
                API_Cart.addTOQuentaty(customers_basket_id: cartss.customers_basket_id ) { (error: Error?, success, data) in
                    if success {
                        self.handleRefresh()
                        let title = NSLocalizedString("Added", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }else {
                        self.handleRefresh()
                        print("Error")
                    }
                }
            }
            if cartss.customers_basket_quantity != "1" {
                cell.deletBTN.isEnabled = true
                cell.deleteCount = {
                    guard (helper.getAPIToken() != nil)  else {
                        let message = NSLocalizedString("please login frist", comment: "hhhh")
                        let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                        self.showAlert(title: title, message: message)
                        return
                    }
                    
                    API_Cart.deleteTOQuentaty(customers_basket_id: cartss.customers_basket_id ) { (error: Error?, success, data) in
                        if success {
                            self.handleRefresh()
                            let title = NSLocalizedString("Delete", comment: "profuct list lang")
                            self.showAlert(title: title, message: data ?? "")
                        }else {
                            self.handleRefresh()
                            print("Error")
                        }
                    }
                }
            }else {
                cell.deletBTN.isEnabled = false
            }
            cell.deletAll = {
                guard (helper.getAPIToken() != nil)  else {
                    let message = NSLocalizedString("please login frist", comment: "hhhh")
                    let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                    self.showAlert(title: title, message: message)
                    return
                }
                
                API_Cart.deleteAll(customers_basket_id: cartss.customers_basket_id ) { (error: Error?, success, data) in
                    if success {
                        self.handleRefresh()
                        let title = NSLocalizedString("Delete", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }else {
                        self.handleRefresh()
                        print("Error")
                    }
                }
            }
            
            return cell
        }else {
            return cartCell()
            
        }
    }
}
