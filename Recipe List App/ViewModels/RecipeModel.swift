//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Alberto Jesús Prada Parmera on 27/10/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
}
