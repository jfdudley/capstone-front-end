//
//  Autocomplete.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/7/22.
//

import SwiftUI

struct Autocomplete: View {
    @Binding var ingredientList: [Ingredient]
    @ObservedObject var ingredientTracker: IngredientsTracker
    @State var indexNum: Int
    
    @State var filteredIngredients : [Ingredient] = []
    @State var hasOptions: Bool = false
    @State var buttonTapped : Bool = false
    
    var body: some View {
        VStack {
            TextField("Ingredient", text:$ingredientTracker.ingredientNames[indexNum])
                .onChange(of: $ingredientTracker.ingredientNames[indexNum].wrappedValue) { newValue in
                    if buttonTapped && ingredientTracker.ingredientNames[indexNum] != ""{
                        hasOptions = false
                    }
                    else if buttonTapped {
                        buttonTapped = false
                    }
                    else {
                        hasOptions = true
                        filteredIngredients = ingredientList.filter({ ingredient in ingredient.name.contains(newValue)
                    })}
                }.textInputAutocapitalization(.words).padding(4.0).background(.white).cornerRadius(7)
            ZStack{
            if hasOptions {
                
                Spacer().frame(height: 50)
                
                VStack(alignment: .center) {
                    
                    ForEach(filteredIngredients, id: \.self) { ingredient in
                        Text(ingredient.name).frame(maxWidth: .infinity).padding(4).onTapGesture {
                            ingredientTracker.ingredientNames[indexNum] = ingredient.name
                            buttonTapped = true
                        }
                        Divider()
                    }
                    Button {
                        buttonTapped.toggle()
                        hasOptions.toggle()
                    } label: {
                        Text("New Ingredient").foregroundColor(Color("BdazzledBlue")).fontWeight(.bold).frame(maxWidth: .infinity).padding(4)
                    }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 4))
                
            }
    }
        }
    }

struct Autocomplete_Previews: PreviewProvider {
    static var previews: some View {
        Autocomplete(ingredientList: .constant([]), ingredientTracker: IngredientsTracker(), indexNum: 1)
        }
    }
}

