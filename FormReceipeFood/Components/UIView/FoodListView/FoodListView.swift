//
//  FoodListView.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import Foundation
import UIKit

//UIView1

class FoodListView: UIView{
    
    
    
    var isExpanded: Bool = false
    
    var isCheckOther: Bool = false
    
    var food: FoodList?
    
    var additionalDesc: String = ""
    
    var indexFood: Int = 0
    
    var checkboxList: [CheckBoxViaTextView] = []
    
    @IBOutlet weak var containerHeaderView: UIView!
    
    @IBOutlet weak var outlineCircle: UIView!
    
    @IBOutlet weak var inlineCircle: UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var headerBtn: UIButton!
    
    @IBOutlet weak var containerStack: UIStackView!
    
    @IBOutlet weak var detailStack: UIStackView!
    
    @IBOutlet weak var containerDetailView: UIView!
    
    @IBOutlet weak var ingrediantStack: UIStackView!
    
    @IBOutlet weak var checkBoxOtherView: UIView!
    
    
    @IBOutlet weak var labelOtherCheckbox: UILabel!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var containerOtherView: OtherInformationField!
    
  
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
        let nib = UINib(nibName: "FoodListView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    private func setupView() {
        
        containerHeaderView.layer.cornerRadius = 10
        containerHeaderView.layer.borderWidth = 1.0
        containerHeaderView.layer.borderColor = UIColor.gray.cgColor
        
        outlineCircle.layer.cornerRadius = outlineCircle.layer.frame.height/2
        outlineCircle.layer.borderWidth = 1.0
        outlineCircle.layer.borderColor = UIColor.gray.cgColor
        
        headerLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        inlineCircle.layer.cornerRadius = inlineCircle.layer.frame.height/2
        inlineCircle.backgroundColor = .white
        
        containerDetailView.isHidden = true
        containerDetailView.layer.borderWidth = 1.0
        containerDetailView.layer.borderColor = UIColor.gray.cgColor
        containerDetailView.layer.cornerRadius = 10
        
        containerOtherView.isHidden = true
        
        headerBtn.setTitle("", for: .normal)
        
        setActionButton()
        
        checkBoxOtherView.layer.borderWidth = 1.0
        checkBoxOtherView.layer.cornerRadius = 5
        checkBoxOtherView.layer.borderColor = UIColor.gray.cgColor
        checkBoxOtherView.backgroundColor = .white
        
        labelOtherCheckbox.text = "อื่นๆโปรดระบุ"
        
        checkBtn.setTitle("", for: .normal)
        checkBtn.addTarget(self, action: #selector(otherTapped), for: .touchUpInside)
        checkImage.isHidden = true
    }
    
    private func setActionButton() {
        headerBtn.addTarget(self, action: #selector(headerTapped), for: .touchUpInside)
    }
    
    @objc func otherTapped() {
        isCheckOther.toggle()
        UIView.animate(withDuration: 0.3) {
            if self.isCheckOther {
                self.checkBoxOtherView.backgroundColor = .red
                self.checkImage.isHidden = false
                self.containerOtherView.isHidden = false
            } else {
                self.checkBoxOtherView.backgroundColor = .white
                self.checkImage.isHidden = true
                self.containerOtherView.isHidden = true
            }
            self.containerStack.layer.layoutIfNeeded()
        }
    }
    
    private func resetOtherCheckbox() {
        self.isCheckOther = false
        containerOtherView.resetTextField()
        checkBoxOtherView.backgroundColor = .white
        checkImage.isHidden = true
        self.containerOtherView.isHidden = true
        self.detailStack.layer.layoutIfNeeded()
        
        

    }
    
    @objc func headerTapped() {
        isExpanded.toggle()
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.isExpanded {
                self.outlineCircle.layer.borderColor = UIColor.red.cgColor
                self.inlineCircle.backgroundColor = .red
                self.containerDetailView.alpha = 1.0
                self.containerDetailView.isHidden = false
                self.detailStack.isHidden = false
            } else {
                self.outlineCircle.layer.borderColor = UIColor.gray.cgColor
                self.inlineCircle.backgroundColor = .white

                for check in self.checkboxList {
                    if self.isCheckOther { // Chcek Status OtherCheckBox is Expanded
                        self.resetOtherCheckbox()
                    }
                    check.onTappedHeader?() // Closure Reset Checkbox Options
                }
                self.detailStack.isHidden = true  // ควรซ่อน detailStack ด้วย
                // ซ่อน containerDetailView หลังจาก reset options
                self.containerDetailView.alpha = 0
                self.containerDetailView.isHidden = true
   
            }
            
            // Update layout after making changes
            self.containerStack.layoutIfNeeded()
        })
        
    }
    
    func setupFood(food: FoodList) {
        self.food = food
        headerLabel.text = food.name.th
        setupCheckBox(options: food.options)
    }
    
    func setupCheckBox(options: [OptionFood]) {
        for (index,option) in options.enumerated() {
            let checkboxIngrediant = CheckBoxViaTextView()
            checkboxList.append(checkboxIngrediant)
            checkboxIngrediant.heightAnchor.constraint(equalToConstant: 30).isActive = true
            checkboxIngrediant.setLabelCheckbox = option.name.th
            checkboxIngrediant.setupCheckBox(check: option.enable)
            checkboxIngrediant.index = index
            checkboxIngrediant.onTappedCheck = { [weak self] (check,index) in
                self?.food?.options[index].enable = check
            }
            checkboxIngrediant.onTappedHeader = {
                checkboxIngrediant.resetCheckbox()
            }
            self.ingrediantStack.addArrangedSubview(checkboxIngrediant)
        }
    }
    
}

