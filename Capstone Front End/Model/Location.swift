//
//  Location.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import Foundation

struct Location: Hashable, Codable, Identifiable {
    
    var id : Int
    var name: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "location_id"
        case name = "location_name"
    }
    
    
}
