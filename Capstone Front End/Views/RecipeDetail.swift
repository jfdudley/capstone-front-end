//
//  RecipeDetail.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(recipe.recipeName)
                        .font(.title)
                    HStack {
                        Text(recipe.location)
                        Spacer()
                        Text(recipe.category)
                        Spacer()
                    }.font(.subheadline).foregroundColor(.secondary)
                    Divider()
                    Text(recipe.recipeDescription).font(.title3)
                    NavigationLink{
                        MoldList()
                        
                    } label: {
                        Text("Choose Molds Here")
                    }
                    ForEach(recipe.ingredientInfo, id: \.self){
                        ingredient in
                        Text("\(ingredient.percentage)g \(ingredient.ingredientName)")
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 41.0)
                        .padding(6.0)
                    ForEach(recipe.recipeInstructions, id: \.self) {
                        instruction in
                        Text(instruction).padding()
                    }
                }.padding()
            }
        }
        .navigationTitle(recipe.recipeName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement:.bottomBar){
                Spacer()
                Button("Back"){
                    print("pressed")
                }
                Spacer()
                Button("Home"){
                    print("pressed")
                }
                Spacer()
            }
    }
    }
    


struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipes[0])
    }
}
}

