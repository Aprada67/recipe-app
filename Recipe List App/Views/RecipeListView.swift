//
//  ContentView.swift
//  Recipe List App
//
//  Created by Alberto Jesús Prada Parmera on 26/10/2023.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(model.recipes) { r in
                
                NavigationLink  {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack (spacing: 20) {
                        Image(r.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .clipShape(.buttonBorder)
                        Text(r.name)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipeListView()
}
