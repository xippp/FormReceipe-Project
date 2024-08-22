//
//  SubmitFormModel.swift
//  FormReceipeFood
//
//  Created by PP on 22/8/2567 BE.
//

import Foundation

struct MainInformationModel {
    var name: String = ""
    var lastname: String = ""
    var email: String = ""

}

struct AdditionalInformationModel {
    var name: String = ""
    var lastname: String = ""
    var email: String = ""
    var country: String = ""
}

struct FoodRecipeModel {
    var id: Int = 0
    var name: FoodName
    var options: [OptionRecipe]
    var description: String = ""
}

struct FoodName {
    var en: String = ""
    var th: String = ""
}

struct OptionRecipe {
    var name: FoodName
    var enable: Bool = false
}
