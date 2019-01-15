//
//  offersVC.swift
//  Jak
//
//  Created by farido on 1/14/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class offersVC: UIViewController {

    @IBOutlet weak var subCatcollection: UICollectionView!
    var offers = [featureProdects]()
    var singleItemCat: categours?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = singleItemCat?.categories_name
        
        subCatcollection.delegate = self
        subCatcollection.dataSource = self
        
        handleRefreshoffers()
        customBackBtton()
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func handleRefreshoffers() {
        home.showProductFlash{ (error: Error?, offers: [featureProdects]?) in
            if let offers = offers {
                self.offers = offers
                print("xxx\(self.offers)")
                self.subCatcollection.reloadData()
            }
        }
        
    }
}

extension offersVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = subCatcollection.dequeueReusableCell(withReuseIdentifier: "prodectCell", for: indexPath) as? sucCatCell {
            let subCate = offers[indexPath.row]
            cell.configuerCell(prodect: subCate)
            
            cell.addTocart = {
                
                guard (helper.getAPIToken() != nil)  else {
                    let message = NSLocalizedString("please login frist", comment: "hhhh")
                    let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
                    self.showAlert(title: title, message: message)
                    return
                }
                
                API_Cart.addToCart(products_id: subCate.products_id) { (error: Error?, success, data) in
                    if success {
                        let title = NSLocalizedString("Add To cart", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }else {
                        print("Error")
                    }
                }
            }
            return cell
        }else {
            return sucCatCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge85", sender: offers[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? prodectdetailsVC {
            if let sub = sender as? featureProdects{
                destaiantion.singleItemCat = sub
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: width)
    }
    
    class CollectionView: UICollectionView {
        
        private let numberOfCellsPerRow = 3
        private let spacing: CGFloat = 1
        
        private var flowLayout: UICollectionViewFlowLayout? {
            return collectionViewLayout as? UICollectionViewFlowLayout
        }
        
        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
            sharedInit()
            updateItemSize()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            sharedInit()
            updateItemSize()
        }
        
        private func sharedInit() {
            flowLayout?.minimumInteritemSpacing = spacing
            flowLayout?.minimumLineSpacing = spacing
        }
        
        
        private func updateItemSize() {
            let cellWidth = floor((bounds.width - (CGFloat(numberOfCellsPerRow) - 1) * spacing) / CGFloat(numberOfCellsPerRow))
            flowLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth)
            flowLayout?.invalidateLayout()
        }
        
        override var bounds: CGRect {
            didSet {
                if bounds != oldValue {
                    updateItemSize()
                }
            }
        }
    }
    
}

