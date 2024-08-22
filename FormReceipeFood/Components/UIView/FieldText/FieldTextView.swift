//
//  FieldTextView.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import UIKit
@IBDesignable
class FieldTextView: UIView {
    
    var isRequired: Bool = false
    
    var setLabel: String = "" {
        didSet {
            if isRequired {
                labelField.text = "\(setLabel) *"
            } else {
                labelField.text = setLabel
            }
        }
    }
    
    @IBOutlet weak var labelField: UILabel!
    
    @IBOutlet weak var inputField: PaddedTextField!
    
    @IBOutlet weak var alertMsg: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        // Setup labelField
        labelField.textColor = .black
        // Setup inputField
        inputField.borderStyle = .none
        inputField.layer.borderColor = UIColor.lightGray.cgColor
        inputField.layer.borderWidth = 1.0
        inputField.layer.cornerRadius = 20
        inputField.layer.masksToBounds = true
        inputField.placeholder = "Please Input Field!"
        // Setup AlertMsg Label
        alertMsg.textColor = .red
        alertMsg.isHidden = true
        alertMsg.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func commonInit() {
        // Load .xib file
        let nib = UINib(nibName: "FieldTextView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}
