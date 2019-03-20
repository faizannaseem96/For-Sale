//
//  ViewController.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirDatabaseService.shared.observe(.products) { (snapshot) in
            guard let snapDict = snapshot.value as? [String: [String: Any]] else { return }
            self.products.removeAll()
            for snap in snapDict.values {
                let product = Product(title: snap["title"] as! String, cost: snap["cost"] as! Double)
                self.products.append(product)
            }
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCell
        cell.productImage.image = UIImage(named: "shirt")
        cell.productTitle.text = products[indexPath.row].title
        return  cell
    }

    @IBAction func bookmarkTapped(_ sender: Any) {
        AlertService.suscribeProduct(vc: self)
    }
    
    @IBAction func addProductTapped(_ sender: Any) {
        AlertService.addProduct(vc: self) { (product) in
            FirDatabaseService.shared.post(parameters: ["title": product.title, "cost": product.cost], to: .products)
        }
    }
}

