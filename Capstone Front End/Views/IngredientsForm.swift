//
//  IngredientsForm.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import SwiftUI


struct IngredientsForm: View {
    @Binding var ingredients: [String : Double]
    @Binding var ingredientList: [Ingredient]
    @ObservedObject var ingredientTracker: IngredientsTracker
    
    var numberFormatter = NumberFormatter()
    

    

    var body: some View {
            ScrollView {
                VStack{
                    ForEach(0..<ingredientTracker.ingredientsCount, id:\.self){num in
                        HStack {
                            Spacer()
                            TextField("Amount (grams)", text: $ingredientTracker.ingredientAmounts[num]).keyboardType(.numberPad).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            Text("g")
                            Spacer()
                            Spacer()
                            TextField("Ingredient", text:$ingredientTracker.ingredientNames[num])
                            Spacer()
                        }
                    }.padding()
                    
                    HStack {
                        Spacer()
                        Button {
                            ingredientTracker.addStep()
                        } label: {
                            Text("Add ingredient row")
                        }
                        Spacer()
                        Button {
                            ingredientTracker.removeStep()
                        } label: {
                            Text("Remove ingredient row")
                        }
                        Spacer()
                    }
                    Button{
                        ingredientTracker.resetTracker()
                    }label: {
                        Text("Reset ingredients")
                    }.padding()
                }
            }.onDisappear{
                ingredients = ingredientTracker.convertToDict()
            }
        }
    }


struct IngredientsForm_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsForm(ingredients: .constant([:]), ingredientList: .constant([]), ingredientTracker: IngredientsTracker())
    }
}
