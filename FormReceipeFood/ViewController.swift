//
//  ViewController.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    let vm = FormViewModel()
    
    @IBOutlet weak var personalTitle: UILabel!
    
    @IBOutlet weak var nameField: FieldTextView!
    
    @IBOutlet weak var lastnameField: FieldTextView!
    
    @IBOutlet weak var emailField: FieldTextView!
    
    @IBOutlet weak var additionalView: AdditionalInfomationView!
    
    @IBOutlet weak var foodStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupVM()
        vm.getFoodData()
    }

    func checkboxValueDidChange(_ isChecked: Bool) {
        print(isChecked)
    }
    
    private func setupView() {
        personalTitle.text = "Personal Information"
        personalTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameField.isRequired = true
        nameField.setLabel = "ขื่อ"
        lastnameField.isRequired = true
        lastnameField.setLabel = "นามสกุล"
        emailField.isRequired = true
        emailField.setLabel = "อีเมล"
    }
    
    private func setupVM() {
        vm.dataCallBack = { [weak self] foods in
            // Setup Food List
            self?.setupFoodListView(foodList: foods)
        }
    }
    
    private func setupFoodListView(foodList: FoodRecipeModel) {
        for (index,food) in foodList.rightRequests.enumerated(){
            let foodListView = FoodListView()
            foodListView.setupFood(food: food)
            foodListView.indexFood = index
            foodStackView.addArrangedSubview(foodListView)
        }
    }
    
}


