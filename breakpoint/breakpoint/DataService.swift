//
//  DataService.swift
//  breakpoint
//
//  Created by Trinh Thai on 12/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation
import Firebase


let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        // To have read/write permission => Create Database => Choose "Realtime Database" => Choose "Rules" => Edit false -> true
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
