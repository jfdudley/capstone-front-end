//
//  Mold.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import Foundation

struct MoldResponse : Hashable, Codable {
    var moldResponse : [Mold]
}

struct Mold: Hashable, Codable, Identifiable {
    
    var id : Int
    var wellShape: String
    var wellVolume: Int
    var numWells: Int
    var source: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "mold_id"
        case wellShape = "well_shape"
        case wellVolume = "well_volume_grams"
        case numWells = "num_wells"
        case source
    }
    

}
