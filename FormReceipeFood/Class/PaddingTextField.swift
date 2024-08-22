//
//  UITextField.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import Foundation
import UIKit
class PaddedTextField: UITextField {
    
    var padding: UIEdgeInsets

    init(padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.padding = UIEdgeInsets(top: 05, left: 10, bottom: 0, right: 10)
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
