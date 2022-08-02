//
//  ModelData.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import Foundation

var recipes: [Recipe] = load("sampleData-noIngredients.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        print("In Encoder!")
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        print(error)
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
