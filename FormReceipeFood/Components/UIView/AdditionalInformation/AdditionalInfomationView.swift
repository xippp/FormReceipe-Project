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
    
    var getStatusCheck: Bool {
        return statusCheck
    }
    
    var validateAdditionalForm: Bool{
        return nameField.isValidateField() && lastnameField.isValidateField() && emailField.isValidateField() && countryField.isValidateField()
    }
    
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

    func getFieldData() -> AdditionalInformationModel {
        let model = AdditionalInformationModel(name: nameField.getValueField,
                                               lastname: lastnameField.getValueField,
                                               email: emailField.getValueField,
                                               country: countryField.getValueField)
        return model
    }
    
    @objc private func checkStatus() {

        statusCheck.toggle()
        UIView.animate(withDuration: 0.3) {
            if self.statusCheck {
                self.checkImage.isHidden = false
                self.checkboxView.backgroundColor = .red
                self.additionalView.isHidden = false
                self.underLine.isHidden = false
            } else {
                self.checkImage.isHidden = true
                self.checkboxView.backgroundColor = .white
                self.additionalView.isHidden = true
                self.underLine.isHidden = true
            }
            self.containStackView.layoutIfNeeded()
        }
       

    }
    
    func changeLanguage() {
        if Utils.shared.language == "th" {
            checkLabel.text = "ข้อมูลเพิ่มเติม"
            titleLabel.text = "ข้อมูล"
            nameField.setLabel = "ชื่อ"
            lastnameField.setLabel = "นามสกุล"
            emailField.setLabel = "อีเมล"
            countryField.setLabel = "ประเทศ"
        } else if Utils.shared.language == "en" {
            checkLabel.text = "Additional Information"
            titleLabel.text = "Information"
            nameField.setLabel = "Name"
            lastnameField.setLabel = "Surname"
            emailField.setLabel = "Email"
            countryField.setLabel = "Country"
        }
        nameField.updateLanguage()
        lastnameField.updateLanguage()
        emailField.updateLanguage()
    }
    
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
        emailField.typeField = .email
        countryField.isRequired = false
        countryField.setLabel = "ประเทศ"
        countryField.isEnable = false
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
