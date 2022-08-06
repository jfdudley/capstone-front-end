//
//  Ingredient.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import Foundation

struct Ingredient: Hashable, Codable, Identifiable {
    
    var id : Int
    var name: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "ingredient_id"
        case name = "ingredient_name"
    }
    
    
}
