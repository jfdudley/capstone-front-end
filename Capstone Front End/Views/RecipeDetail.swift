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
                    }.font(.subheadline).foregroundColor(Color("Cultured")).padding(.top, 3)
                    Divider().overlay(Color("Cultured")).padding(3)
                    Text(recipe.description).font(.body)
                    
                    VStack {
                        NavigationLink{
                            MoldList(moldTracker: moldTracker, molds: $molds)
                            
                        } label: {
                            Text("Choose Molds Here")
                        }.buttonStyle(.bordered).background(Color(.white)).cornerRadius(10).foregroundColor(Color("BdazzledBlue")).padding(2).frame(minWidth: 0, maxWidth: .infinity, alignment:.center)
                        Text("Ingredient amounts for:").font(.body).padding(2)
                        MoldCounts(molds:$molds, moldTracker:moldTracker)
                    }.frame(minWidth:0, maxWidth:.infinity).padding().border(Color("Cultured"), width: 1).cornerRadius(5)
                    
                    ForEach(recipe.ingredients.sorted{$0.percentage > $1.percentage}, id: \.self){
                        ingredient in
                        if moldTracker.totalVolume != 0 {
                            let ingredientTotal = moldTracker.getIngredientTotal(percentage: ingredient.percentage)
                            if ingredientTotal >= 5.0 {
                                let intTotal = Int(ingredientTotal)
                                HStack {
                                    Spacer()
                                    Text("\(intTotal)g").frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                                    Text("\(ingredient.name)").frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 30)
                                    Spacer()
                                }
                            } else {
                                HStack {
                                    Spacer()
                                    Text("\(ingredientTotal, specifier: "%.2f")g").frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                                    Text("\(ingredient.name)").frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 30)
                                    Spacer()
                                }
                                
                            }
                        }
                        else {
                            Text("\(ingredient.name)").frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 30)
                        }
                    }.padding(6.0)
                    Divider().overlay(Color("Cultured")).padding(.vertical, 4).padding(.horizontal, 3)
                    ForEach(recipe.instructions, id: \.self) {
                        instruction in
                        Text(instruction).padding(3)
                    }
                }.padding().background(Color("ShadowBlue").ignoresSafeArea(.all)).foregroundColor(.white)
            }
            .toolbar{
                Navbar(rootIsActive: $rootIsActive)
            }
        }.background(Color("ShadowBlue").ignoresSafeArea(.all))
        
    }
}



struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: previewRecipes[0], moldTracker: MoldTracker(), molds: .constant(previewMolds), rootIsActive: .constant(false))
    }
}


