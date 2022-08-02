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
        ScrollView {
            VStack(alignment: .leading) {
                Text(recipe.recipeName)
                    .font(.title)
                HStack {
                    Text(recipe.category)
                    Spacer()
                    Text(recipe.location)
                }.font(.subheadline).foregroundColor(.secondary)
                Divider()
                Text(recipe.recipeDescription).font(.title2)
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
//        .navigationTitle(recipe.recipeName)
//        .navigationBarTitleDisplayMode(.inline)
    }


struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipes[0])
    }
}
}
