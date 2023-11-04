//
//  DataService.swift
//  Recipe List App
//
//  Created by Alberto Jesús Prada Parmera on 27/10/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Creat a url object
        let url = URL(filePath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the uniques IDs
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // Error with parsing json
                print("Couldn't parse the json data \(error)")
            }
        }
        catch {
            // Error with getting the data
            print("Couldn't get the data \(error)")
        }
        
        return [Recipe]()
        
    }
    
}
