//
//  ViewController.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    let vm = FormViewModel()
    
    var foodRecipeList: [FoodListView] = []
    
    var isFormValidate: Bool = false
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var personalTitle: UILabel!
    
    @IBOutlet weak var nameField: FieldTextView!
    
    @IBOutlet weak var lastnameField: FieldTextView!
    
    @IBOutlet weak var emailField: FieldTextView!
    
    @IBOutlet weak var additionalView: AdditionalInfomationView!
    
    @IBOutlet weak var foodStackView: UIStackView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var thLangLabel: UILabel!
    
    @IBOutlet weak var enLangaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupVM()
        setupView()
        vm.getFoodData()
    }

    func checkboxValueDidChange(_ isChecked: Bool) {
        print(isChecked)
    }

    func postFormData() {
        if additionalView.getStatusCheck {
            if self.isFormValidate {
                let mainInformation = MainInformationModel(name: nameField.getValueField,
                                                           lastname: lastnameField.getValueField,
                                                           email: emailField.getValueField)
                let additionalInfomation = additionalView.getFieldData()
                vm.prepareSubmitForm(mainInformation: mainInformation,
                                     additionalInformation: additionalInfomation,
                                     foodListView: self.foodRecipeList)
            }
        } else {
            if self.isFormValidate {
                let mainInformation = MainInformationModel(name: nameField.getValueField,
                                                           lastname: lastnameField.getValueField,
                                                           email: emailField.getValueField)
                vm.prepareSubmitForm(mainInformation: mainInformation,
                                     additionalInformation: AdditionalInformationModel(),
                                     foodListView: self.foodRecipeList)
            }
        }
    }
    
    @objc private func checkValidationForm() {
        if additionalView.getStatusCheck { // Check addtional Information
            self.isFormValidate = nameField.isValidateField() && lastnameField.isValidateField() && emailField.isValidateField() && additionalView.validateAdditionalForm
        } else { // Uncheck addtional Information
            self.isFormValidate = nameField.isValidateField() && lastnameField.isValidateField() && emailField.isValidateField()
        }
        postFormData()
    }
    
    private func setupVM() {
        vm.dataCallBack = { [weak self] foods in
            // Setup Food List
            self?.setupFoodListView(foodList: foods)
            if Utils.shared.language == "en" {
                self?.enLangaLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            } else if Utils.shared.language == "th" {
                self?.thLangLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            }
            self?.setupLanguage(model: foods)
        }
        vm.getLangaugeCallBack = { [weak self] data in
            self?.setupLanguage(model: data)
        }
    }
    
    private func setupLanguage(model: RecipeInstruct) {
        if Utils.shared.language == "en" {
            headerLabel.text = model.title.en
            personalTitle.text = "Personal Information"
            nameField.setLabel = "Name"
            lastnameField.setLabel = "Surname"
            emailField.setLabel = "Email"
            submitButton.setTitle("Submit", for: .normal)
        } else if Utils.shared.language == "th" {
            headerLabel.text = model.title.th
            personalTitle.text = "ข้อมูลส่วนตัว"
            nameField.setLabel = "ชื่อ"
            lastnameField.setLabel = "นามสกุล"
            emailField.setLabel = "อีเมล"
            submitButton.setTitle("ส่งข้อมูล", for: .normal)
        }
    }
    
    private func setupView() {
        personalTitle.text = "Personal Information"
        personalTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameField.isRequired = true
        lastnameField.isRequired = true
        emailField.isRequired = true
        emailField.typeField = .email
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(checkValidationForm), for: .touchUpInside)
        // Add Tap Gesture เพื่อ EndEditing
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setupFoodListView(foodList: RecipeInstruct) {
        for (index,food) in foodList.rightRequests.enumerated(){
            let foodListView = FoodListView()
            self.foodRecipeList.append(foodListView)
            foodListView.setupFood(food: food)
            foodListView.indexFood = index
            foodStackView.addArrangedSubview(foodListView)
        }
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        vm.getLanguage()
        if Utils.shared.language == "th" {
            Utils.shared.language = "en"
            enLangaLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            thLangLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            
        } else if Utils.shared.language == "en"{
            Utils.shared.language = "th"
            enLangaLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            thLangLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
        print(Utils.shared.language)
    }
    
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        checkValidationForm()
    }
    
}


