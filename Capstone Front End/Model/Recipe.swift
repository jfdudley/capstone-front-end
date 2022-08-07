//
//  Recipe.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import Foundation

struct RecipeResponse : Hashable, Codable {
    var recipeResponse : [Recipe]
}


struct Recipe: Hashable, Codable {
    
    var id : Int
    var name: String
    var description: String
    var category: String
    var location: String
    var ingredients: [Ingredients]
    var instructions: [String]

    struct Ingredients: Hashable, Codable {
        var id: Int
        var name: String
        var percentage: Double
        
        enum CodingKeys: String, CodingKey {
            case id = "ingredient_id"
            case name = "ingredient_name"
            case percentage
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "recipe_id"
        case name = "recipe_name"
        case description = "recipe_description"
        case category
        case location
        case ingredients = "ingredient_info"
        case instructions = "instructions"
    }
}
