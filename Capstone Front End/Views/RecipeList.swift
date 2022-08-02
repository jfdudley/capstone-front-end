//
//  RecipeList.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        NavigationView {
            List(recipes, id: \.self) {recipe in
                NavigationLink{
                    RecipeDetail(recipe: recipe)
                    
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle("Recipe List")
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
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
}
