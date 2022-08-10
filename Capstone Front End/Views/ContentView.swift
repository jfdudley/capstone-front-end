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
    
//    let blueText = UIColor(named:"BdazzledBlue")
//    let greenText = UIColor(named:"KombuGreen")
//    @State var navText: [Bool] = [false, false]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().compactAppearance?.backgroundColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = .clear
        UINavigationBar.appearance().tintColor = /*self.navText[0] ? blueText : self.navText[1] ? greenText : */.white
    }
    
    var body: some View {
        if !recipes.isEmpty && !molds.isEmpty{
                
                NavigationView {
                            VStack {
                                Text("Welcome to the DIY Skincare App").font(.title).fontWeight(.semibold).foregroundColor(Color("KombuGreen")).multilineTextAlignment(.center).padding()
                                Spacer()
                                NavigationLink(destination: RecipeList(rootIsActive: self.$isActive, recipes: self.$recipes, molds: self.$molds), isActive: self.$isActive){
                                    Text("See All Recipes")
                                }.isDetailLink(false).buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("ShadowBlue")/*@END_MENU_TOKEN@*/).cornerRadius(10)
                                Spacer()
                                NavigationLink {
                                    NewRecipeForm(recipes: $recipes, apiManager: apiManager/*, navText: $navText*/)
                                } label: {
                                    Text("Create New Recipe")
                                }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("BdazzledBlue")/*@END_MENU_TOKEN@*/).cornerRadius(10)
                                Spacer()
                                NavigationLink {
                                    NewMoldForm(molds: $molds, apiManager: apiManager/*, navText: $navText*/)
                                } label: {
                                    Text("Create New Mold")
                                }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("SpanishBistre")/*@END_MENU_TOKEN@*/).cornerRadius(10)
                                Spacer()
                                Button {
                                    print("To account view")
                                } label: {
                                    Text("Login / User Profile")
                                }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("KombuGreen")/*@END_MENU_TOKEN@*/).cornerRadius(10)
                                Spacer()
                            }.background(Image("Loading Image").resizable().aspectRatio(contentMode: .fill).frame(minWidth:0, maxWidth: .infinity,alignment: .center).edgesIgnoringSafeArea(.all).opacity(0.5))
                }
            }
        else {
            Loading_Page().task {
                    sleep(2)
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
