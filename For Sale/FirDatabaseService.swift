//
//  FirDatabaseService.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import Foundation
import Firebase

enum FirDatabaseRef : String {
    case products = "products"
}

class FirDatabaseService {
    
    private init() {}
    static let shared = FirDatabaseService()
    
    func reference(_ databaseReference: FirDatabaseRef) -> DatabaseReference {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseRef: FirDatabaseRef, completion: @escaping (DataSnapshot) -> Void) {
        reference(databaseRef).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
    
    func post(parameters: [String: Any], to databaseRef: FirDatabaseRef) {
        reference(databaseRef).childByAutoId().setValue(parameters)
    }
}

