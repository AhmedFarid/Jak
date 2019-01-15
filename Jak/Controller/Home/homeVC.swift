//
//  homeVC.swift
//  Jak
//
//  Created by farido on 1/8/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class homeVC: UIViewController {

    @IBOutlet weak var broductData: UICollectionView!
    @IBOutlet weak var catColloction: UICollectionView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = [banners]()
    var Cats = [categours]()
    var offers = [featureProdects]()
    
    
    var currentIndex = 0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollection.delegate = self
        bannerCollection.dataSource = self
        
        catColloction.delegate = self
        catColloction.dataSource = self
        
        broductData.delegate = self
        broductData.dataSource = self
        
        handleRefresh()
        handleRefreshcat()
        bordercollection()
        bordercollectionsss()
        handleRefreshoffers()
        customBackBtton()
    }
    
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func bordercollection(){
        catColloction.layer.cornerRadius = 5.0
        catColloction.layer.borderWidth = 0.5
        catColloction.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    func bordercollectionsss(){
        broductData.layer.cornerRadius = 5.0
        broductData.layer.borderWidth = 0.5
        broductData.layer.borderColor = #colorLiteral(red: 0.8785108924, green: 0.8785108924, blue: 0.8785108924, alpha: 1)
    }
    
    @objc private func handleRefresh() {
        home.banner{ (error: Error?, images: [banners]?) in
            if let images = images {
                self.images = images
                print("xxx\(self.images)")
                self.bannerCollection.reloadData()
                self.pageControl.numberOfPages = images.count
                self.startTimer()
            }
        }
        
    }
    
    @objc private func handleRefreshoffers() {
        home.showProducts{ (error: Error?, offers: [featureProdects]?) in
            if let offers = offers {
                self.offers = offers
                print("xxx\(self.offers)")
                self.broductData.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshcat() {
        home.categoure{ (error: Error?, Cats: [categours]?) in
            if let Cats = Cats {
                self.Cats = Cats
                print("xxx\(self.Cats)")
                self.catColloction.reloadData()
            }
        }
        
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        
        let desiredScrollPosititon = (currentIndex < images.count - 1) ? currentIndex + 1 : 0
        bannerCollection.scrollToItem(at: IndexPath(item: desiredScrollPosititon, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension homeVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return images.count
        }else if collectionView.tag == 1{
            return Cats.count
        }else {
            return offers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as? BannerCell {
                let iamge = images[indexPath.item]
                cell.configuerCell(prodect: iamge)
                return cell
            }else {
                return BannerCell()
                
            }
        }else if collectionView.tag == 1 {
            if let cell = catColloction.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as? catCell {
                let categour = Cats[indexPath.row]
                cell.configuerCell(prodect: categour)
                return cell
            }else {
                return catCell()
            }
        } else {
            if let cell = broductData.dequeueReusableCell(withReuseIdentifier: "prodectCell", for: indexPath) as? futersOffersCell {
                let subCate = offers[indexPath.row]
                cell.configuerCell(prodect: subCate)
                return cell
            }else {
                return futersOffersCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            print("0")
        }else if collectionView.tag == 1 {
            performSegue(withIdentifier: "suge1", sender: Cats[indexPath.row])
        }else {
            performSegue(withIdentifier: "suge2", sender: offers[indexPath.row])
            print("no")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? subCatVC{
            if let sub = sender as? categours{
                destaiantion.singleItemCat = sub
            }

        }else if let destaiantion = segue.destination as? prodectdetailsVC {
            if let sub = sender as? featureProdects{
                destaiantion.singleItemCat = sub
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView.tag == 1 {
            return CGSize(width: self.catColloction.frame.height / 6 * 5, height: self.catColloction.frame.height / 6 * 5)
        }else {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/2
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: width)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if bannerCollection.tag == 0 {
            currentIndex = Int(scrollView.contentOffset.x / bannerCollection.frame.size.width)
            pageControl.currentPage = currentIndex
        }
    }
    
}

