//
//  ContentView.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/1/22.
//

import SwiftUI


struct ContentView: View {
    @State var isActive = false
    @StateObject var apiManager = APIManager()
    @State var recipes: [Recipe] = []
    @State var molds: [Mold] = []
    
    var body: some View {
        if !recipes.isEmpty && !molds.isEmpty{
            NavigationView {
                VStack {
                    Text("Welcome to the DIY Skincare App").padding()
                    Spacer()
                    NavigationLink(destination: RecipeList(rootIsActive: self.$isActive, recipes: self.$recipes, molds: self.$molds), isActive: self.$isActive){
                        Text("See All Recipes")
                    }.isDetailLink(false)
                    Spacer()
                    NavigationLink {
                        NewMoldForm(molds: $molds, apiManager: apiManager)
                    } label: {
                        Text("Create New Mold")
                    }

                    Spacer()
                }
            }
        }
        else {
            Loading_Page().task {
                    recipes = await apiManager.getAllRecipes()
                    molds = await apiManager.getAllMolds()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
