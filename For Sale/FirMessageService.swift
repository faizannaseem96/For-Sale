//
//  FirMessageService.swift
//  For Sale
//
//  Created by Faizan Naseem on 19/03/2019.
//  Copyright © 2019 Faizan Naseem. All rights reserved.
//

import Foundation
import FirebaseMessaging

class FirMessageService {
    
    private init() {}
    static let shared = FirMessageService()
    let messaging = Messaging.messaging()
    
    func subscribe() {
        Messaging.messaging().subscribe(toTopic: "newProduct")
    }
    
    func unsubscribe() {
        Messaging.messaging().unsubscribe(fromTopic: "newProduct")
    }
}
