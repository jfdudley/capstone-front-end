//
//  Mold.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import Foundation

struct Mold: Hashable, Codable {
    
    var moldId : Int
    var wellShape: String
    var wellVolume: Int
    var numWells: Int
    var source: String
    
}
