//
//  RecipeRow.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Image(systemName:"seal")
            Text(recipe.name)
            Spacer()
        }.foregroundColor(Color("BdazzledBlue"))
    }
}

struct RecipeRow_Previews: PreviewProvider {
        static var previews: some View {

        Group {
            RecipeRow(recipe: previewRecipes[0])
            RecipeRow(recipe: previewRecipes[1])
        }.previewLayout(.fixed(width:300, height: 70))
    }
}
