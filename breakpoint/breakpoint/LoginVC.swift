//
//  LoginVC.swift
//  breakpoint
//
//  Created by gumi-19 on 1/4/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var ibEmailField: InsetTextField!
    @IBOutlet weak var ibPasswordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ibSignInTapped(_ sender: Any) {
        if let email = ibEmailField.text, let password = ibPasswordField.text {
            AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription as Any)
                    
                    // Account is not exist in firebase => register new account
                    AuthService.instance.registerUser(withEmail: email, andPassword: password) { (success, registerError) in
                        if success {
                            AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, nil) in
                                print("Successfully registered user")
                            }
                        } else {
                            print(registerError?.localizedDescription as Any)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func ibCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
