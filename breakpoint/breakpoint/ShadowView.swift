//
//  ShadowView.swift
//  breakpoint
//
//  Created by gumi-19 on 1/4/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
}

