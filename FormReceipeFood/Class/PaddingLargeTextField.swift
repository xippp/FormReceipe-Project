//
//  UITextField.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import Foundation
import UIKit
class PaddingLargeTextField: UITextField {
    
    var padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding.left,
                      y: bounds.origin.y + padding.top,
                      width: bounds.width - padding.left - padding.right,
                      height: bounds.height - padding.top - padding.bottom)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func drawPlaceholder(in rect: CGRect) {
        let placeholderRect = CGRect(x: rect.origin.x + padding.left,
                                     y: rect.origin.y + padding.top,
                                     width: rect.width - padding.left - padding.right,
                                     height: rect.height - padding.top - padding.bottom)
        super.drawPlaceholder(in: placeholderRect)
    }
}
