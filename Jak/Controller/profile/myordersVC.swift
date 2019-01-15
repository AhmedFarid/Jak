//
//  myordersVC.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class myordersVC: UIViewController {

    var myorders = [myOrders]()
    
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
        API_MyProfile.showProducts{ (error: Error?, myorders: [myOrders]?) in
            if let myorders = myorders {
                self.myorders = myorders
                print("xxx\(self.myorders)")
                self.tableView.reloadData()
            }
        }
        
    }
}

extension myordersVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myorders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myorderCell {
            let cartss = myorders[indexPath.item]
            cell.configuerCell(prodect: cartss)
            return cell
        }else {
            return cartCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: myorders[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? myorderDetailsVC{
            if let sub = sender as? myOrders{
                destaiantion.singleItemMyOrders = sub
            }
        }
    }
}
