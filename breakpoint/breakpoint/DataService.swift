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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            // send to groups ref
        } else {
            _REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ message: [Message]) -> ()) {
        var messageArray = [Message]()
        _REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for message in feedMessageSnapshot {
                if let content = message.childSnapshot(forPath: "content").value as? String, let senderId = message.childSnapshot(forPath: "senderId").value as? String {
                    let message = Message(content: content, senderId: senderId)
                    messageArray.append(message)
                }
            }
            handler(messageArray)
        }
    }
}
