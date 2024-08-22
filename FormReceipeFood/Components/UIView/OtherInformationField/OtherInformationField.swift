//
//  OtherInformationField.swift
//  FormReceipeFood
//
//  Created by PP on 21/8/2567 BE.
//

import Foundation
import UIKit

class OtherInformationField: UIView {
    
    var getValueField: String? {
        return inputTextField.text ?? ""
    }
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var subHeaderLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var inputTextField: PaddingLargeTextField!
    
    private func setupView() {
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerLabel.text = "อื่นๆ"
        subHeaderLabel.font = UIFont.systemFont(ofSize: 20)
        subHeaderLabel.text = "กรุณาระบุเพิ่มเติม"
        inputLabel.font = UIFont.systemFont(ofSize: 14)
        inputLabel.text = "อธิบายรายละเอียด"
        inputTextField.contentVerticalAlignment = .top
        inputTextField.layer.borderWidth = 1.0
        inputTextField.layer.cornerRadius = 20
        inputTextField.layer.masksToBounds = true
        inputTextField.layer.borderColor = UIColor.gray.cgColor
        inputTextField.placeholder = "Please Input your other information..."
        
    }
    
    func resetTextField() {
        inputTextField.text = ""
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
        let nib = UINib(nibName: "OtherInformationField", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
}
