//
//  CheckBoxViaTextView.swift
//  FormReceipeFood
//
//  Created by PP on 21/8/2567 BE.
//

import Foundation
import UIKit

class CheckBoxViaTextView: UIView {
    
    var isCheck: Bool = false
    var defaultCheck: Bool = false
    var index: Int = 0
    var onTappedCheck: ((Bool,Int) -> Void)?
    var onTappedHeader: (()->Void)?
    
    var setLabelCheckbox: String = "" {
        didSet {
            checkboxLabel.text = setLabelCheckbox
        }
    }

    
    @IBOutlet weak var checkboxView: UIView!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var checkboxLabel: UILabel!
    
    
    private func setupView() {
        checkboxView.layer.borderWidth = 1.0
        checkboxView.layer.cornerRadius = 5
        checkboxView.layer.borderColor = UIColor.gray.cgColor
        checkBtn.setTitle("", for: .normal)
        checkBtn.addTarget(self, action: #selector(checkTapped), for: .touchUpInside)
        
        checkboxView.backgroundColor = .white
        checkImage.isHidden = true
    }
    
    func setupCheckBox(check: Bool) {
        defaultCheck = check // Set Default Value Of Checkbox
        isCheck = check
        if check {
            checkboxView.backgroundColor = .red
            checkImage.isHidden = false
        } else {
            checkboxView.backgroundColor = .white
            checkImage.isHidden = true
        }
    }
    
    func resetCheckbox() {
        setupCheckBox(check: defaultCheck)
    }
    
    @objc func checkTapped() {
        isCheck.toggle()
        if isCheck {
            checkboxView.backgroundColor = .red
            checkImage.isHidden = false
        } else {
            checkboxView.backgroundColor = .white
            checkImage.isHidden = true
        }
        onTappedCheck?(isCheck,index)
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
        let nib = UINib(nibName: "CheckBoxViaTextView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
}
