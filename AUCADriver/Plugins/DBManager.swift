//
//  DBManager.swift
//  AUCADriver
//
//  Created by Sanira on 6/28/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DBManager {
    
    class var shared: DBManager   {
        struct Static {
            static let instance = DBManager()
        }
        return Static.instance
    }

    var dbRef: DatabaseReference {
        return Database.database().reference()
    }


    var ridersRef: DatabaseReference {
        return dbRef.child(Constants.RIDERS)
    }
    var driversRef: DatabaseReference {
        return dbRef.child(Constants.DRIVERS)
    }
    
    
    func saveUser(with userId: String, email: String, password: String) {
        if UserDefaults.standard.string(forKey: "role") == "driver" {
            let data: [String: Any] = [Constants.EMAIL: email,
                                       Constants.PASSWORD: password,
                                       Constants.IS_RIDER: false]
            ridersRef.child(userId).child(Constants.DATA).setValue(data)
            return
        }
        
        let data: [String: Any] = [Constants.EMAIL: email,
                                             Constants.PASSWORD: password,
                                             Constants.IS_RIDER: true]
        
        ridersRef.child(userId).child(Constants.DATA).setValue(data)
        
    }
    
}
