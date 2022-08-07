////
////  Autocomplete.swift
////  Capstone Front End
////
////  Created by Joanna Dudley on 8/7/22.
////
//
//import SwiftUI
//
//struct Autocomplete: View {
//    @Binding var ingredientList: [Ingredient]
//    @ObservedObject var ingredientTracker: IngredientsTracker
//    
//    var suggestions = ["Cocoa Butter", "Shea Butter", "Sweet Almond Oil", "Jojoba Oil", "Beeswax", "Rice Bran Wax"]
//    
//    var body: some View {
//        VStack {
//            TextField("Ingredient", text: $ingredientTracker.ingredientNames[1])
//                .textFieldStyle(.roundedBorder)
//                .padding()
//        }
//        List(suggestions, id: \.self) { suggestion in
//            ZStack {
//                Text(suggestion)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//        }
//    }
//
//struct Autocomplete_Previews: PreviewProvider {
//    static var previews: some View {
//        Autocomplete(ingredientList: .constant([]), ingredientTracker: IngredientsTracker()).previewLayout(.fixed(width:300, height: 70))
//    }
//}
//}
