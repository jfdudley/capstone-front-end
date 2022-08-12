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
    
    @State var navText : Color = .white

    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().compactAppearance?.backgroundColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = .clear
    }
    
    let gradient = LinearGradient(gradient:Gradient(colors: [Color("KombuGreen"), Color("SpanishBistre"), /*Color("Cultured"),*/ Color("ShadowBlue"), Color("BdazzledBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        if !recipes.isEmpty && !molds.isEmpty{
            
            NavigationView {
                VStack {
                    Text("Welcome to the DIY Skincare App").foregroundColor(Color("KombuGreen")).font(.title).fontWeight(.semibold).padding().background(RoundedRectangle(cornerRadius: 15).stroke(gradient,lineWidth: 3)).multilineTextAlignment(.center).foregroundStyle(gradient)
                    Spacer()
                    NavigationLink(destination: RecipeList(rootIsActive: self.$isActive, recipes: self.$recipes, molds: self.$molds), isActive: self.$isActive){
                        Text("See All Recipes")
                    }.isDetailLink(false).buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(Color("ShadowBlue")).cornerRadius(10)
                    Spacer()
                    NavigationLink {
                        NewRecipeForm(recipes: $recipes, apiManager: apiManager, navText: $navText)
                    } label: {
                        Text("Create New Recipe")
                    }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(Color("BdazzledBlue")).cornerRadius(10)
                    Spacer()
                    NavigationLink {
                        NewMoldForm(molds: $molds, apiManager: apiManager, navText: $navText)
                    } label: {
                        Text("Create New Mold")
                    }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(Color("SpanishBistre")).cornerRadius(10)
                    Spacer()
                    Button {
                        print("To account view")
                    } label: {
                        Text("Login / User Profile")
                    }.buttonStyle(.bordered).foregroundColor(.white).padding(5.0).background(Color("KombuGreen")).cornerRadius(10)
                    Spacer()
                }.background(Image("Loading Image").resizable().aspectRatio(contentMode: .fill).frame(minWidth:0, maxWidth: .infinity,alignment: .center).edgesIgnoringSafeArea(.all).opacity(0.5))
            }.accentColor(navText)
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
