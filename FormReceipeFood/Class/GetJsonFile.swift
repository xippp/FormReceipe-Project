//
//  GetJsonFile.swift
//  FormReceipeFood
//
//  Created by PP on 21/8/2567 BE.
//

import Foundation

class GetJsonFile {
    

    func getJsonData(fileName: String) -> FoodRecipeModel? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("File Not Found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let model = try decoder.decode(FoodRecipeModel.self, from: data)
            return model
        } catch {
            print("Error Reading File \(error)")
            return nil
        }
    }
    
}
