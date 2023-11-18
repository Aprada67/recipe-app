//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Alberto Jesús Prada Parmera on 28/10/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State private var selectedServingSize = 2
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                // MARK: Serving Size Picker
                
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View{
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
