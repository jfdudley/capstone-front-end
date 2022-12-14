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
    @ObservedObject var moldTracker = MoldTracker()

    
    var body: some View {
        VStack {
            Text("Recipe List").font(.title2).foregroundColor(Color("Cultured"))
            List(recipes, id: \.self) {recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe, moldTracker: moldTracker, molds: $molds, rootIsActive: $rootIsActive)){
                    RecipeRow(recipe: recipe)}.isDetailLink(false)
            }
            .onAppear{
                moldTracker.setMoldCounts(molds: molds)
                moldTracker.totalVolume = 0
            }
            .toolbar{
                Navbar(rootIsActive: $rootIsActive)
            }
        }.background(Color("ShadowBlue"))

    }
    
    struct RecipeList_Previews: PreviewProvider {
        static var previews: some View {
            RecipeList(rootIsActive: .constant(false), recipes: .constant(previewRecipes), molds: .constant(previewMolds))
        }
    }
}
