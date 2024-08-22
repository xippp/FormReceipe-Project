//
//  FormViewModel.swift
//  FormReceipeFood
//
//  Created by PP on 21/8/2567 BE.
//

import Foundation
class FormViewModel {
    
    let getJsonFile = GetJsonFile()
    
    var dataCallBack: ((RecipeInstruct) -> Void)?
    
    var getLangaugeCallBack: ((RecipeInstruct) -> Void)?
    
    var data: RecipeInstruct? = nil
    
    func getLanguage() {
        guard let data = data else { return }
        getLangaugeCallBack?(data)
    }
    
    func getFoodData() {
        guard let data = getJsonFile.getJsonData(fileName: "FoodData") else { return  }
        self.data = data
        Utils.shared.uuid = data.uuid
        Utils.shared.language = data.defaultLanguage
        dataCallBack?(data)
    }
    
    func prepareSubmitForm(mainInformation: MainInformationModel, additionalInformation: AdditionalInformationModel?, foodListView: [FoodListView]) {
        var foodRecipes: [FoodRecipeModel] = []
        for foodView in foodListView {
            foodRecipes.append(FoodRecipeModel(id: foodView.food?.id ?? 0,
                            name: foodView.food?.name ?? Name(en: "", th: ""),
                            options: foodView.food?.options ?? [OptionFood(name: Name(en: "",
                                                                                      th: ""),
                                                                           enable: false)],
                                               description: foodView.containerOtherView.getValueField))
        }
        let submitFormModel = SubmitFormModel(uuid: Utils.shared.uuid,
                                              mainInformation: mainInformation,
                                               additionalInformation: additionalInformation ?? AdditionalInformationModel(),
                                               rightRequests: foodRecipes)
        sendObjectJson(obj: submitFormModel)
    }
    
    func sendObjectJson(obj: SubmitFormModel) {
        do {
            let jsonData = try JSONEncoder().encode(obj)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print(jsonString) // Check Obj To Send API Here
        } catch {
            print("Error encoding data: \(error)")
        }

    }

}
