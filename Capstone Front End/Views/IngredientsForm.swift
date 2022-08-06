//
//  IngredientsForm.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import SwiftUI

struct IngredientsForm: View {
    @Binding var ingredients: [String : Int]
    @Binding var ingredientList : [Ingredient]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct IngredientsForm_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsForm(ingredients: .constant([:]), ingredientList: .constant([]))
    }
}
