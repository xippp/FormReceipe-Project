//
//  FormViewModel.swift
//  FormReceipeFood
//
//  Created by PP on 21/8/2567 BE.
//

import Foundation
class FormViewModel {
    
    let getJsonFile = GetJsonFile()
    
    var dataCallBack: ((FoodRecipeModel) -> Void)?
    
    func getFoodData() {
        guard let data = getJsonFile.getJsonData(fileName: "FoodData") else { return  }
        dataCallBack?(data)
    }

}
