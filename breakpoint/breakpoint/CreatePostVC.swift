//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by gumi-19 on 1/6/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var ibProfileImage: UIImageView!
    @IBOutlet weak var ibEmailLabel: UILabel!
    @IBOutlet weak var ibTextView: UITextView!
    @IBOutlet weak var ibSendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibTextView.delegate = self
        ibSendButton.bindToKeyboard()
    }
    
    @IBAction func ibCloseTapped(_ sender: Any) {
        
    }
    
    @IBAction func ibSendTapped(_ sender: Any) {
        if let text = ibTextView.text, text != "Say something here...", let uid = Auth.auth().currentUser?.uid{
            ibSendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: text, forUID: uid, withGroupKey: nil) { (isComplete) in
                self.ibSendButton.isEnabled = true
                if isComplete {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("There was an error")
                }
            }
        }
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
