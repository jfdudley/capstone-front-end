//
//  RecipeDetail.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct RecipeDetail: View {
    
    var recipe: Recipe
    @ObservedObject var moldTracker : MoldTracker
    @Binding var molds : [Mold]
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                                    .font(.title)
                                HStack {
                                    Text(recipe.location)
                                    Spacer()
                                    Text(recipe.category)
                                    Spacer()
                                }.font(.subheadline).foregroundColor(.secondary)
                                Divider()
                                Text(recipe.description).font(.title3)
                                NavigationLink{
                                    MoldList(moldTracker: moldTracker, molds: $molds)
                                    
                                } label: {
                                    Text("Choose Molds Here")
                                }.padding()
                                ForEach(recipe.ingredients, id: \.self){
                                    ingredient in
                                    if moldTracker.totalVolume != 0 {
                                        let ingredientTotal = moldTracker.getIngredientTotal(percentage: ingredient.percentage)
                                        if ingredientTotal >= 5.0 {
                                            let intTotal = Int(ingredientTotal)
                                            Text("\(intTotal)g \(ingredient.name)")
                                        } else {
                                        Text("\(ingredientTotal, specifier: "%.2f")g \(ingredient.name)")
                                        
                                        }
                                    }
                                    else {
                                        Text("\(ingredient.name)")
                                    }
                                }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 80)
                                    .padding(6.0)
                                ForEach(recipe.instructions, id: \.self) {
                                    instruction in
                                    Text(instruction).padding()
                                }
                            }.padding().background(Color("ShadowBlue").ignoresSafeArea(.all))
            }.onAppear{
                UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = .clear
            }
            .toolbar{
                    ToolbarItemGroup(placement:.bottomBar){
                        Spacer()
                        Button (action: { self.rootIsActive = false } ){
                            Image(systemName: "house")
                        }
                        
                        Spacer()
                        Button (action: {print("Account button pressed")}){
                            Image(systemName: "person.crop.circle")
                        }
                        Spacer()
                    }
            }
        }.background(Color("ShadowBlue").ignoresSafeArea(.all))
        
    }
        }
    


struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
//        RecipeDetail(recipe: recipes[0], prevIsActive: .constant(false))
        RecipeDetail(recipe: previewRecipes[0], moldTracker: MoldTracker(), molds: .constant(previewMolds), rootIsActive: .constant(false))
    }
}


