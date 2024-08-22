//
//  SubmitFormModel.swift
//  FormReceipeFood
//
//  Created by PP on 22/8/2567 BE.
//

import Foundation

struct SubmitFormModel: Codable {
    var uuid: String = ""
    var mainInformation: MainInformationModel
    var additionalInformation: AdditionalInformationModel
    var rightRequests: [FoodRecipeModel]
}

struct MainInformationModel: Codable {
    var name: String = ""
    var lastname: String = ""
    var email: String = ""

}

struct AdditionalInformationModel: Codable {
    var name: String = ""
    var lastname: String = ""
    var email: String = ""
    var country: String = ""
}

struct FoodRecipeModel: Codable {
    var id: Int = 0
    var name: Name
    var options: [OptionFood]
    var description: String?
}

