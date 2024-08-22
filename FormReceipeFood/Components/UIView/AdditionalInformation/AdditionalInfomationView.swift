//
//  AdditionalInfomationView.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import Foundation
import UIKit
@IBDesignable
class AdditionalInfomationView: UIView {
    
    var statusCheck: Bool = false
    
    @IBOutlet weak var roundCornerView: UIView!
    
    @IBOutlet weak var containStackView: UIStackView!
    
    @IBOutlet weak var checkboxView: UIView!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var underLine: UIView!
    
    @IBOutlet weak var additionalView: UIView!
    
    @IBOutlet weak var stackField: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameField: FieldTextView!
    
    @IBOutlet weak var lastnameField: FieldTextView!
    
    @IBOutlet weak var emailField: FieldTextView!
    
    @IBOutlet weak var countryField: FieldTextView!
    
    
    private func setupView() {
        roundCornerView.layer.cornerRadius = 10
        roundCornerView.layer.borderColor = UIColor.gray.cgColor
        roundCornerView.layer.borderWidth = 1.0
        checkboxView.layer.borderColor = UIColor.gray.cgColor
        checkboxView.layer.borderWidth = 1.0
        checkboxView.layer.cornerRadius = 5
        checkboxView.backgroundColor = .white
        checkLabel.text = "ข้อมูลเพิ่มเติม"
        checkBtn.setTitle("", for: .normal)
        checkBtn.addTarget(self, action: #selector(checkStatus), for: .touchUpInside)
        checkImage.isHidden = false
        additionalView.isHidden = true
        titleLabel.text = "ข้อมูล"
        underLine.isHidden = true
        containStackView.layoutIfNeeded()
        nameField.isRequired = true
        nameField.setLabel = "ชื่อ"
        lastnameField.isRequired = true
        lastnameField.setLabel = "นามสกุล"
        emailField.isRequired = true
        emailField.setLabel = "อีเมล"
        countryField.isRequired = false
        countryField.setLabel = "ประเทศ"
        
        
    }
    
    @objc private func checkStatus() {

        statusCheck.toggle()
        if statusCheck {
            checkImage.isHidden = false
            checkboxView.backgroundColor = .red
            additionalView.isHidden = false
            underLine.isHidden = false
        } else {
            checkImage.isHidden = true
            checkboxView.backgroundColor = .white
            additionalView.isHidden = true
            underLine.isHidden = true
        }
        UIView.animate(withDuration: 0.3) {
            self.containStackView.layoutIfNeeded()
        }
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
    
    private func commonInit() {
        // Load .xib file
        let nib = UINib(nibName: "AdditionalInfomationView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}
