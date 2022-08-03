//
//  RecipeList.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct RecipeList: View {
    @Binding var rootIsActive: Bool
    @Binding var recipes : [Recipe]
    @Binding var molds: [Mold]
    
    var body: some View {
        List(recipes, id: \.self) {recipe in
//                NavigationLink(
//                    destination: RecipeDetail(recipe:recipe, prevIsActive: self.$rootIsActive), isActive: self.$rootIsActive) {
//                    RecipeRow(recipe: recipe)
//                }.isDetailLink(false)
            NavigationLink(destination: RecipeDetail(recipe: recipe, molds: $molds)){
                    RecipeRow(recipe: recipe)}
            }
            .navigationTitle("Recipe List")
            .toolbar{
                ToolbarItemGroup(placement:.bottomBar){
                    Spacer()
                    Button("Back"){
                        print("pressed")
                    }
                    Spacer()
                    Button (action: { self.rootIsActive = false } ){
                        Text("Home")
                    }
                    Spacer()
                }
        }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList(rootIsActive: .constant(false), recipes: .constant(previewRecipes), molds: .constant(previewMolds))
    }
}
}
