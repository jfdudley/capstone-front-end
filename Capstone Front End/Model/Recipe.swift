//
//  Recipe.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import Foundation

struct Recipe: Hashable, Codable {
    
    var recipeId : Int
    var recipeName: String
    var recipeDescription: String
    var category: String
    var location: String
    var ingredientInfo: Array<ingredients>
    var recipeInstructions: Array<String>

    struct ingredients: Hashable, Codable {
        var ingredientId: Int
        var ingredientName: String
        var percentage: Int
    }

}
