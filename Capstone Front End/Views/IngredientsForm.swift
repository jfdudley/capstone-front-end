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
                            TextField("Amount", text: $ingredientTracker.ingredientAmounts[num]).keyboardType(.numberPad).padding(4.0).background(.white).cornerRadius(7)
                            Text("g").foregroundColor(.white)
                            Spacer()
                            Spacer()
                            VStack {
                                TextField("Ingredient", text:$ingredientTracker.ingredientNames[num]).padding(4.0).background(.white).cornerRadius(7)
                            }
                            Spacer()
                        }
                    }.padding()
                    HStack {
                        Spacer()
                        Button {
                            ingredientTracker.addStep()
                        } label: {
                            Text("Add row")
                        }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10)
                        Spacer()
                        Button {
                            ingredientTracker.removeStep()
                        } label: {
                            Text("Remove row")
                        }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10)
                        Spacer()
                    }
                    Button{
                        ingredientTracker.resetTracker()
                    }label: {
                        Text("Reset")
                    }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10).padding()
                }
            }.background(Color("BdazzledBlue")).onDisappear{
                ingredients = ingredientTracker.convertToDict()
            }
        }
    }


struct IngredientsForm_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsForm(ingredients: .constant([:]), ingredientList: .constant([]), ingredientTracker: IngredientsTracker())
    }
}
