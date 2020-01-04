//
//  AuthVC.swift
//  breakpoint
//
//  Created by gumi-19 on 1/4/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ibLoginByEmailTapped(_ sender: Any) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func ibLoginWithFBTapped(_ sender: Any) {
        
    }
    
    @IBAction func ibLoginWithGoogleTapped(_ sender: Any) {
        
    }
    
}
