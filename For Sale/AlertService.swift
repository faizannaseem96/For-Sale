//
//  AlertService.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import Foundation
import UIKit

class AlertService {
    
    private init() {
        
    }
    
    static func addProduct(vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New Product", message: "Whats for sale", preferredStyle:
            UIAlertController.Style.alert)
        
        alert.addTextField{ (titleTF) in
            titleTF.placeholder = "Title"
        }
        
        alert.addTextField{ (priceTF) in
            priceTF.placeholder = "Price"
        }
        
        alert.addAction(UIAlertAction(title: "Send", style: UIAlertAction.Style.default, handler:{ (UIAlertAction)in
            guard let title = alert.textFields?.first?.text,
                let price = alert.textFields?.last?.text,
                let cost = Double(price) else {return}
            let product = Product(title: title, cost: cost)
            completion(product)
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func suscribeProduct(vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            FirMessageService.shared.subscribe()
        }
        
        let unsubscribe = UIAlertAction(title: "Unsubsribe", style: .default) { (_) in
            FirMessageService.shared.unsubscribe()
        }
        
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true, completion: nil)
    }
    
}


