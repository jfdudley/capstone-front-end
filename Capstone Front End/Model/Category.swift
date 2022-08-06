//
//  Category.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import Foundation

struct Category: Hashable, Codable, Identifiable {
    
    var id : Int
    var name: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "category_id"
        case name = "category_name"
    }
    
    
}
