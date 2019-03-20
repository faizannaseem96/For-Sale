//
//  ProductCell.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
}


class DownloadService {
    
    private init() {}
    static let shared = DownloadService()
    
    func getImage(url: String, completion: @escaping (URL) -> Void) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, _, _) in
            let filemanager = FileManager.default
            guard let data = data, let document = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return
            }
            let fileUrl = document.appendingPathComponent("image.jpg")
            do {
                try data.write(to: fileUrl)
                DispatchQueue.main.async {
                    completion(fileUrl)
                }
            } catch {
                
            }
        }
        task.resume()
    }
}
