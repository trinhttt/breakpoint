//
//  FeedCell.swift
//  breakpoint
//
//  Created by gumi-19 on 1/6/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var iProfileImage: UIImageView!
    @IBOutlet weak var ibEmailLabel: UILabel!
    @IBOutlet weak var ibContentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.iProfileImage.image = profileImage
        self.ibEmailLabel.text = email
        self.ibContentLabel.text = content
    }
}
