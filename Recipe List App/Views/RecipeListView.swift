//
//  ContentView.swift
//  Recipe List App
//
//  Created by Alberto Jesús Prada Parmera on 26/10/2023.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach(model.recipes) { r in
                            
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
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        
                    }
                    
                }
                
            }
            .padding(.leading)
        }
    }
}

#Preview {
    RecipeListView()
        .environmentObject(RecipeModel())
}
