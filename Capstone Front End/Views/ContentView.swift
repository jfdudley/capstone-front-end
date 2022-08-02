//
//  ContentView.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/1/22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Welcome to the DIY Skincare App").padding()
                Spacer()
                NavigationLink(destination: RecipeList()){
                    Text("See All Recipes")
                }
                Spacer()
                Spacer()
                
            }.toolbar{
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
