//
//  RecipeInstruct.swift
//  FormReceipeFood
//
//  Created by PP on 20/8/2567 BE.
//

import Foundation

struct RecipeInstruct: Codable {
    var id: Int
    var uuid: String
    var title: Title
    var description: Description
    var availableLanguage: [String]
    var defaultLanguage: String
    var rightRequests: [FoodList]
    var version: String
}

struct FoodList: Codable {
    var id: Int
    var name: Name
    var options: [OptionFood]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "Name"
        case options = "options"
    }
}

struct OptionFood: Codable {
    var name: Name
    var enable: Bool
}

struct Name: Codable {
    var en: String
    var th: String
}

struct Description: Codable {
    var en: String
    var th: String
}

struct Title:Codable {
    var en: String
    var th: String
}

struct Ingrediant {
    var nameTH: String = ""
    var nameEN: String = ""
    var enable: Bool = false
}
