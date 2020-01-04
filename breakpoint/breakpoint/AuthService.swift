//
//  AuthService.swift
//  breakpoint
//
//  Created by gumi-19 on 1/4/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let authResult = authResult else {
                userCreationComplete(false, error)
                return
            }
            
            let userData: Dictionary<String, Any> = ["provider": authResult.user.providerID, "email": authResult.user.email ?? ""]
            DataService.instance.createDBUser(uid: authResult.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard authResult != nil else {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
