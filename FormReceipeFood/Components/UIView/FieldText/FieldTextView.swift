//
//  FieldTextView.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import UIKit
@IBDesignable
class FieldTextView: UIView, UITextFieldDelegate {
    
    enum TypeField {
        case text
        case email
    }
    
    var typeField: TypeField = .text
    
    var isRequired: Bool = false
    
    var isValidate: Bool = false
    
    var isEnable: Bool = true {
        didSet {
            inputField.isEnabled = isEnable
            inputField.backgroundColor = UIColor.lightGray
            inputField.textColor = UIColor.darkGray
        }
    }
    
    var setValue: String = "" {
        didSet {
            inputField.text = setValue
        }
    }
    
    var setLabel: String = "" {
        didSet {
            if isRequired {
                labelField.text = "\(setLabel) *"
            } else {
                labelField.text = setLabel
            }
        }
    }
    
    var getValueField: String {
        return inputField.text ?? ""
    }
    
    @IBOutlet weak var labelField: UILabel!
    
    @IBOutlet weak var inputField: PaddedTextField!
    
    @IBOutlet weak var alertMsg: UILabel!
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isValidate = isValidateField()
    }
    
    func isValidateField() -> Bool {
        if isRequired {
            switch typeField {
            case .text:
                isValidate = isValidText(inputField.text ?? "")
            case .email:
                isValidate = isValidEmail(inputField.text ?? "")
            }
            alertMsg.isHidden = isValidate
        }
        return isValidate
    }
    
    private func isValidText(_ text: String) -> Bool {
        return !text.isEmpty
    }
    
    private func isValidEmail(_ text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
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
        inputField.delegate = self
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
    
    
}
