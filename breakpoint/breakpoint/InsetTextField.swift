//
//  InsetTextField.swift
//  breakpoint
//
//  Created by gumi-19 on 1/4/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        self.setupView()
        super.awakeFromNib()
    }
    //Returns the drawing rectangle for the text field’s text.
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // Returns the rectangle in which editable text can be displayed.
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

//    //Returns the drawing rectangle for the text field’s placeholder text
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: padding)
//    }
//
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.attributedPlaceholder = placeholder
    }
}
